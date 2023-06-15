import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/traveller%20details/traveller_details.dart';

import '../../../Constants/colors.dart';

class PassportDetailsPage extends StatelessWidget {
  PassportDetailsPage({
    super.key,
    required this.cntryList,
    required this.passportNoController,
    required this.nationalityController,
    required this.dobController,
    required this.countryOfIssueController,
    required this.dateOfExpiryController,
  });

  List<CountryList> cntryList;
  TextEditingController passportNoController;
  TextEditingController nationalityController;
  TextEditingController dobController;
  TextEditingController countryOfIssueController;
  TextEditingController dateOfExpiryController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Passport Details"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Note : Traveller's passport should be valid for 6 months from the date of travel.",
                maxLines: 2,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: TextField(
                controller: passportNoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Passport Number"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: TypeAheadField<CountryList>(
                  hideSuggestionsOnKeyboardHide: true,
                  debounceDuration: const Duration(milliseconds: 500),
                  suggestionsCallback: (query) async => getList(query),
                  itemBuilder: (context, itemData) => SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            itemData.name,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: nationalityController,
                    autofocus: true,
                    //  controller: departureController,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      label: Text("Nationality"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  noItemsFoundBuilder: (context) => const SizedBox(
                        height: 80,
                        child: Center(child: Text("No Airports Found")),
                      ),
                  onSuggestionSelected: (suggestion) {
                    nationalityController.text = suggestion.name;
                    // originCode = suggestion.cityCode ?? '';
                    // originCountry = suggestion.countryCode ?? '';
                    // departureController.text = "${suggestion.cityName?.toUpperCase() ?? ''} - ${suggestion.cityCode?.toUpperCase() ?? ''}";
                    // departure = departureController.text;
                    // deptAirportName = suggestion.airportName ?? '';
                    // showDepTypeField = true;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: TextField(
                  readOnly: true,
                  controller: dobController,
                  onTap: () async {
                    DateTime? pickedFromDate = await showDatePicker(
                      context: context,
                      currentDate: DateTime.now(),
                      initialDate: DateTime.now() /* .subtract(const Duration(days: 30)) */, //get today's date
                      firstDate: DateTime(1920), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime.now(),
                    );

                    pickedFromDate != null ? dobController.text = DateFormat('dd MMMM yyyy').format(pickedFromDate) : '';
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.date_range_outlined),
                    border: OutlineInputBorder(),
                    label: Text("Date of birth"),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: TypeAheadField<CountryList>(
                  hideSuggestionsOnKeyboardHide: true,
                  debounceDuration: const Duration(milliseconds: 500),
                  suggestionsCallback: (query) async => getList(query),
                  itemBuilder: (context, itemData) => SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            itemData.name,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: countryOfIssueController,
                    autofocus: true,
                    //  controller: departureController,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      label: Text("Country of Issue"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  noItemsFoundBuilder: (context) => const SizedBox(
                        height: 80,
                        child: Center(child: Text("Not Found")),
                      ),
                  onSuggestionSelected: (suggestion) {
                    countryOfIssueController.text = suggestion.name;
                    // originCode = suggestion.cityCode ?? '';
                    // originCountry = suggestion.countryCode ?? '';
                    // departureController.text = "${suggestion.cityName?.toUpperCase() ?? ''} - ${suggestion.cityCode?.toUpperCase() ?? ''}";
                    // departure = departureController.text;
                    // deptAirportName = suggestion.airportName ?? '';
                    // showDepTypeField = true;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: TextField(
                  readOnly: true,
                  controller: dateOfExpiryController,
                  onTap: () async {
                    DateTime? pickedFromDate = await showDatePicker(
                      context: context,
                      currentDate: DateTime.now(),
                      initialDate: DateTime.now() /* .subtract(const Duration(days: 30)) */, //get today's date
                      firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100),
                    );

                    pickedFromDate != null ? dateOfExpiryController.text = DateFormat('dd MMMM yyyy').format(pickedFromDate) : '';
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.date_range_outlined),
                    border: OutlineInputBorder(),
                    label: Text("Date of expiry"),
                  )),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                      context,
                      PassportDetails(
                        countryOfIssueController: countryOfIssueController,
                        passportNoController: passportNoController,
                        dateOfExpiryController: dateOfExpiryController,
                        dobController: dobController,
                        nationalityController: nationalityController,
                      ));
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width - 50, 50),
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }

  Future<List<CountryList>> getList(String query) async {
    List<CountryList> filteredFlights = [];

    final cityCodeList = cntryList.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
    filteredFlights.addAll(cityCodeList);
    log(filteredFlights.toString());
    return filteredFlights;
  }
}
