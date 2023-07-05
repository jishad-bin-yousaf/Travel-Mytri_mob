import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/traveller%20details/traveller_details.dart';

import '../../../Constants/colors.dart';
import '../../../data/model/utilities.dart';

class PassportDetailsPage extends StatelessWidget {
  PassportDetailsPage({
    super.key,
    required this.cntryList,
    required this.passportNoController,
    required this.nationalityController,
    required this.dobController,
    required this.countryOfIssueController,
    required this.dateOfExpiryController,
    required this.nationalityCode,
    required this.countryOfIssueCode,
    required this.title,
  }) {
    if (nationalityController.text.isNotEmpty) {
      final nationality = cntryList.firstWhere((element) => element.countryCode == (nationalityController.text));
      nationalityController.text = nationality.name ?? '';
    }
    if (countryOfIssueController.text.isNotEmpty) {
      final cntryOfIssueCode = cntryList.firstWhere((element) => element.countryCode == (countryOfIssueController.text));
      countryOfIssueController.text = cntryOfIssueCode.name ?? '';
    }
  }

  List<ClsCountriesJson> cntryList;
  List<ClsCountriesJson> countryList = [];
  TextEditingController passportNoController;
  TextEditingController nationalityController;
  TextEditingController dobController;
  TextEditingController countryOfIssueController;
  TextEditingController dateOfExpiryController;
  String nationalityCode;
  String countryOfIssueCode;
  String title;

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
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
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
              child: TypeAheadField<ClsCountriesJson>(
                  hideSuggestionsOnKeyboardHide: false,
                  debounceDuration: const Duration(milliseconds: 500),
                  suggestionsCallback: (query) async => getCountryList(query),
                  itemBuilder: (context, itemData) => ListTile(
                        title: Text("${itemData.name ?? ''}"),
                      ),
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: nationalityController,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      label: const Text("Nationality"),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  noItemsFoundBuilder: (context) => const SizedBox(
                        height: 80,
                        child: Center(child: Text("No Countries Found")),
                      ),
                  onSuggestionSelected: (suggestion) {
                    nationalityController.text = suggestion.name ?? '';
                    nationalityCode = suggestion.countryCode ?? '';
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
              child: TypeAheadField<ClsCountriesJson>(
                  hideSuggestionsOnKeyboardHide: false,
                  debounceDuration: const Duration(milliseconds: 500),
                  suggestionsCallback: (query) async => getCountryList(query),
                  itemBuilder: (context, itemData) => ListTile(
                        title: Text("${itemData.name ?? ''}"),
                      ),
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: countryOfIssueController,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      label: const Text("Country of Issue"),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  noItemsFoundBuilder: (context) => const SizedBox(
                        height: 80,
                        child: Center(child: Text("No Countries Found")),
                      ),
                  onSuggestionSelected: (suggestion) {
                    countryOfIssueController.text = suggestion.name ?? '';
                    countryOfIssueCode = suggestion.countryCode ?? '';
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
                        countryOfIssueCode: countryOfIssueCode,
                        nationalityCode: nationalityCode,
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

  getCountryList(String query) {
    List<ClsCountriesJson> filteredCountries = [];

    final cityCodeList = cntryList.where((element) => element.name!.toLowerCase().startsWith(query.toLowerCase())).toList();
    filteredCountries.addAll(cityCodeList);

    log(filteredCountries.toString());

    return filteredCountries;
  }
}
