import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_mytri_mobile_v1/data/api.dart';
import 'package:intl/intl.dart';
import '../../Constants/colors.dart';
import '../../data/model/Search/flight_search_model.dart';
import '../../data/model/airport_list.dart';
import '../widgets/helper.dart';

flightSearchAppBar(BuildContext context, AirlineSearchResponse data) {
  return AppBar(
    actions: [
      IconButton(
          tooltip: "Edit",
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.edit_outlined,
            size: 23,
          ))
    ],
    automaticallyImplyLeading: false,
    title: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Text(
              '${data.origin ?? "N/A"}\t',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 20,
            ),
            Text(
              '\t${data.destination ?? "N/A"}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
            ),
          ]),
          Text(
            '\t${data.departureDate ?? "Date"}',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          Text(
            " [\t${data.passengers ?? "0"} Traveller]",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          Text(
            data.airlineClass ?? "Premium economy",
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    ),
  );
}

class MultiCity extends StatefulWidget {
  @override
  State<MultiCity> createState() => _MultiCityState();
}

class _MultiCityState extends State<MultiCity> {
  late bool economy;
  late bool premiumEconomy;
  late bool businessClass;
  late bool firstClass;
  FlightSearchReqModel searchReq = FlightSearchReqModel();
  Objsectorlist sector1 = Objsectorlist();
  Objsectorlist sector2 = Objsectorlist();
  Objsectorlist sector3 = Objsectorlist();
  Objsectorlist sector4 = Objsectorlist();

  TextEditingController dep1 = TextEditingController();
  TextEditingController dep2 = TextEditingController();
  TextEditingController dep3 = TextEditingController();
  TextEditingController dep4 = TextEditingController();

  TextEditingController date1Controller = TextEditingController();
  TextEditingController date2Controller = TextEditingController();
  TextEditingController date3Controller = TextEditingController();
  TextEditingController date4Controller = TextEditingController();

  TextEditingController arr1 = TextEditingController();
  TextEditingController arr2 = TextEditingController();
  TextEditingController arr3 = TextEditingController();
  TextEditingController arr4 = TextEditingController();

  TextEditingController passengerController = TextEditingController();
  TextEditingController classController = TextEditingController();

  int adultCount = 1;
  int childCount = 0;
  int infantCount = 0;
  int totalPassengerCount = 1;

  String travelClass = "";

  DateTime? date1;
  DateTime? date2;
  DateTime? date3;
  DateTime? date4;

  String frmCity1code = "Departure";
  String frmCity1cntry = "";
  String frmCity1name = "";

  String frmCity2code = "Departure";
  String frmCity2cntry = "";
  String frmCity2name = "";

  String frmCity3code = "Departure";
  String frmCity3cntry = "";
  String frmCity3name = "";

  String frmCity4code = "Departure";
  String frmCity4cntry = "";
  String frmCity4name = "";

  String toCity1code = "Arrival";
  String toCity1cntry = "";
  String toCity1name = "";

  String toCity2code = "Arrival";
  String toCity2cntry = "";
  String toCity2name = "";

  String toCity3code = "Arrival";
  String toCity3cntry = "";
  String toCity3name = "";

  String toCity4code = "Arrival";
  String toCity4cntry = "";
  String toCity4name = "";

  List<AirportData> airportList = [];

  bool showEditing1 = false;
  bool showEditing2 = false;
  bool showEditing3 = false;
  bool showEditing4 = false;

  bool city3 = false;
  bool city4 = false;

  bool internationalTrip = true;
  @override
  void initState() {
    AirlineApi().getAirport().then((value) {
      airportList = value ?? [];
    });

    super.initState();

    passengerController.text = '1 Passenger';
    classController.text = 'Economy';
    //travelType = 'oneWay';

    economy = true;
    premiumEconomy = false;
    businessClass = false;
    firstClass = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Text("\t\tMulti City ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        !showEditing1
            ? InkWell(
                child: Container(
                  //     width: MediaQuery.of(context).size.width,
                  //    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  /*     decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ), */
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("From", style: TextStyle(color: Colors.grey)),
                          Text(frmCity1code.toUpperCase(), style: TextStyle(fontSize: 20)),
                          Text(frmCity1name, style: TextStyle()),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("To", style: TextStyle(color: Colors.grey)),
                          Text(toCity1code, style: TextStyle(fontSize: 20)),
                          Text(toCity1name, style: TextStyle()),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Date", style: TextStyle(color: Colors.grey)),
                          Row(
                            children: [
                              Icon(Icons.calendar_month_rounded),
                              Text(date1Controller.text),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  showEditing1 = true;
                  setState(() {});
                },
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: TypeAheadField<AirportData>(
                        hideSuggestionsOnKeyboardHide: true,
                        debounceDuration: const Duration(milliseconds: 500),
                        suggestionsCallback: (query) async => getList(query),
                        itemBuilder: (context, itemData) => ListTile(
                              title: Text("${itemData.cityName?.toUpperCase() ?? ''} - ${itemData.cityCode?.toUpperCase() ?? ''}"),
                              subtitle: Text(itemData.airportName ?? ''),
                            ),
                        textFieldConfiguration: TextFieldConfiguration(
                          //  autofocus: true,
                          controller: dep1,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            label: const Text("Departure"),
                            prefixIcon: const Icon(Icons.flight_takeoff_outlined),
                            prefixIconColor: Colors.grey.shade700,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        noItemsFoundBuilder: (context) => const SizedBox(
                              height: 80,
                              child: Center(child: Text("No Airports Found")),
                            ),
                        onSuggestionSelected: (suggestion) {
                          frmCity1code = suggestion.cityCode ?? '';
                          frmCity1cntry = suggestion.countryCode ?? '';
                          dep1.text = suggestion.cityCode?.toUpperCase() ?? '';
                          frmCity1code = dep1.text;
                          frmCity1name = suggestion.cityName ?? '';

                          //      city1 = true;
                          setState(() {});
                        }),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: TypeAheadField<AirportData>(
                        hideSuggestionsOnKeyboardHide: true,
                        debounceDuration: const Duration(milliseconds: 500),
                        suggestionsCallback: (query) async => getList(query),
                        itemBuilder: (context, itemData) => ListTile(
                              title: Text("${itemData.cityName?.toUpperCase() ?? ''} - ${itemData.cityCode?.toUpperCase() ?? ''}"),
                              subtitle: Text(itemData.airportName ?? ''),
                            ),
                        textFieldConfiguration: TextFieldConfiguration(
                          //  autofocus: true,
                          controller: arr1,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            label: const Text("Arrival"),
                            prefixIcon: const Icon(Icons.flight_takeoff_outlined),
                            prefixIconColor: Colors.grey.shade700,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        noItemsFoundBuilder: (context) => const SizedBox(
                              height: 80,
                              child: Center(child: Text("No Airports Found")),
                            ),
                        onSuggestionSelected: (suggestion) {
                          toCity1code = suggestion.cityCode ?? '';
                          toCity1cntry = suggestion.countryCode ?? '';
                          arr1.text = suggestion.cityCode?.toUpperCase() ?? '';

                          toCity1name = suggestion.cityName ?? '';

                          frmCity2code = suggestion.cityCode ?? '';
                          frmCity2cntry = suggestion.countryCode ?? '';
                          dep2.text = suggestion.cityCode?.toUpperCase() ?? '';

                          frmCity2name = suggestion.cityName ?? '';
                          //   city1 = true;
                          setState(() {});
                        }),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
                      child: TextField(
                        readOnly: true,
                        controller: date1Controller,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month_outlined),
                          hintText: "Eg : 2023-4-11",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: primaryColor,
                          )),
                          label: Text("Departure"),
                        ),
                        onTap: () async {
                          DateTime? pickedFromDate = await showDatePicker(
                            context: context,
                            currentDate: DateTime.now(),
                            initialDate: DateTime.now() /* .subtract(const Duration(days: 30)) */, //get today's date
                            firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime.now().add(const Duration(days: 365)),
                          );
                          date1 = pickedFromDate;
                          pickedFromDate != null ? date1Controller.text = DateFormat('dd MMMM').format(pickedFromDate) : '';
                          showEditing1 = false;
                          setState(() {});
                          //   value.notify();
                        },
                      ),
                    ),
                  ),
                ],
              ),
        SizedBox(height: 10),

        !showEditing2
            ? InkWell(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("From", style: TextStyle(color: Colors.grey)),
                          Text(frmCity2code.toUpperCase(), style: TextStyle(fontSize: 20)),
                          Text(frmCity2name, style: TextStyle()),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("To", style: TextStyle(color: Colors.grey)),
                          Text(toCity2code, style: TextStyle(fontSize: 20)),
                          Text(toCity2name, style: TextStyle()),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Date", style: TextStyle(color: Colors.grey)),
                          Row(
                            children: [
                              Icon(Icons.calendar_month_rounded),
                              Text(date2Controller.text),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  showEditing2 = true;
                  setState(() {});
                },
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: TypeAheadField<AirportData>(
                        hideSuggestionsOnKeyboardHide: true,
                        debounceDuration: const Duration(milliseconds: 500),
                        suggestionsCallback: (query) async => getList(query),
                        itemBuilder: (context, itemData) => ListTile(
                              title: Text("${itemData.cityName?.toUpperCase() ?? ''} - ${itemData.cityCode?.toUpperCase() ?? ''}"),
                              subtitle: Text(itemData.airportName ?? ''),
                            ),
                        textFieldConfiguration: TextFieldConfiguration(
                          enabled: false,
                          //       autofocus: true,
                          controller: dep2,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            label: const Text("Departure"),
                            prefixIcon: const Icon(Icons.flight_takeoff_outlined),
                            prefixIconColor: Colors.grey.shade700,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        noItemsFoundBuilder: (context) => const SizedBox(
                              height: 80,
                              child: Center(child: Text("No Airports Found")),
                            ),
                        onSuggestionSelected: (suggestion) {
                          frmCity2code = suggestion.cityCode ?? '';
                          frmCity2cntry = suggestion.countryCode ?? '';
                          dep2.text = suggestion.cityCode?.toUpperCase() ?? '';
                          frmCity2code = dep2.text;
                          frmCity2name = suggestion.cityName ?? '';

                          //      city1 = true;
                          setState(() {});
                        }),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: TypeAheadField<AirportData>(
                        hideSuggestionsOnKeyboardHide: true,
                        debounceDuration: const Duration(milliseconds: 500),
                        suggestionsCallback: (query) async => getList(query),
                        itemBuilder: (context, itemData) => ListTile(
                              title: Text("${itemData.cityName?.toUpperCase() ?? ''} - ${itemData.cityCode?.toUpperCase() ?? ''}"),
                              subtitle: Text(itemData.airportName ?? ''),
                            ),
                        textFieldConfiguration: TextFieldConfiguration(
                          //        autofocus: true,
                          controller: arr2,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            label: const Text("Arrival"),
                            prefixIcon: const Icon(Icons.flight_takeoff_outlined),
                            prefixIconColor: Colors.grey.shade700,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        noItemsFoundBuilder: (context) => const SizedBox(
                              height: 80,
                              child: Center(child: Text("No Airports Found")),
                            ),
                        onSuggestionSelected: (suggestion) {
                          toCity2code = suggestion.cityCode ?? '';
                          toCity2cntry = suggestion.countryCode ?? '';
                          arr2.text = suggestion.cityCode?.toUpperCase() ?? '';
                          toCity2name = suggestion.cityName ?? '';

                          frmCity3code = suggestion.cityCode ?? '';
                          frmCity3cntry = suggestion.countryCode ?? '';
                          dep3.text = suggestion.cityCode?.toUpperCase() ?? '';
                          frmCity3name = suggestion.cityName ?? '';
                          //   city1 = true;
                          setState(() {});
                        }),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
                      child: TextField(
                        readOnly: true,
                        controller: date2Controller,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month_outlined),
                          hintText: "Eg : 2023-4-11",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: primaryColor,
                          )),
                          label: Text("Departure"),
                        ),
                        onTap: () async {
                          DateTime? pickedFromDate = await showDatePicker(
                            context: context,
                            currentDate: DateTime.now(),
                            initialDate: DateTime.now() /* .subtract(const Duration(days: 30)) */, //get today's date
                            firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime.now().add(const Duration(days: 365)),
                          );
                          date2 = pickedFromDate;
                          pickedFromDate != null ? date2Controller.text = DateFormat('dd MMMM').format(pickedFromDate) : '';
                          showEditing2 = false;
                          setState(() {});
                          //   value.notify();
                        },
                      ),
                    ),
                  ),
                ],
              ),
        SizedBox(height: 10),

        city3
            ? Column(children: [
                if (!showEditing3)
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("From", style: TextStyle(color: Colors.grey)),
                            Text(frmCity3code.toUpperCase(), style: TextStyle(fontSize: 20)),
                            Text(frmCity3name, style: TextStyle()),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("To", style: TextStyle(color: Colors.grey)),
                            Text(toCity3code, style: TextStyle(fontSize: 20)),
                            Text(toCity3name, style: TextStyle()),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date", style: TextStyle(color: Colors.grey)),
                            Row(
                              children: [
                                Icon(Icons.calendar_month_rounded),
                                Text(date3Controller.text),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      showEditing3 = true;
                      setState(() {});
                    },
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        child: TypeAheadField<AirportData>(
                            hideSuggestionsOnKeyboardHide: true,
                            debounceDuration: const Duration(milliseconds: 500),
                            suggestionsCallback: (query) async => getList(query),
                            itemBuilder: (context, itemData) => ListTile(
                                  title: Text("${itemData.cityName?.toUpperCase() ?? ''} - ${itemData.cityCode?.toUpperCase() ?? ''}"),
                                  subtitle: Text(itemData.airportName ?? ''),
                                ),
                            textFieldConfiguration: TextFieldConfiguration(
                              //        autofocus: true,
                              controller: dep3,
                              enabled: false,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                label: const Text("Departure"),
                                prefixIcon: const Icon(Icons.flight_takeoff_outlined),
                                prefixIconColor: Colors.grey.shade700,
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            noItemsFoundBuilder: (context) => const SizedBox(
                                  height: 80,
                                  child: Center(child: Text("No Airports Found")),
                                ),
                            onSuggestionSelected: (suggestion) {
                              frmCity3code = suggestion.cityCode ?? '';
                              frmCity3cntry = suggestion.countryCode ?? '';
                              dep3.text = suggestion.cityCode?.toUpperCase() ?? '';

                              frmCity3name = suggestion.cityName ?? '';

                              //      city1 = true;
                              setState(() {});
                            }),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        child: TypeAheadField<AirportData>(
                            hideSuggestionsOnKeyboardHide: true,
                            debounceDuration: const Duration(milliseconds: 500),
                            suggestionsCallback: (query) async => getList(query),
                            itemBuilder: (context, itemData) => ListTile(
                                  title: Text("${itemData.cityName?.toUpperCase() ?? ''} - ${itemData.cityCode?.toUpperCase() ?? ''}"),
                                  subtitle: Text(itemData.airportName ?? ''),
                                ),
                            textFieldConfiguration: TextFieldConfiguration(
                              //     autofocus: true,
                              controller: arr3,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                label: const Text("Arrival"),
                                prefixIcon: const Icon(Icons.flight_takeoff_outlined),
                                prefixIconColor: Colors.grey.shade700,
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            noItemsFoundBuilder: (context) => const SizedBox(
                                  height: 80,
                                  child: Center(child: Text("No Airports Found")),
                                ),
                            onSuggestionSelected: (suggestion) {
                              toCity3code = suggestion.cityCode ?? '';
                              toCity3cntry = suggestion.countryCode ?? '';
                              arr3.text = suggestion.cityCode?.toUpperCase() ?? '';

                              toCity3name = suggestion.cityName ?? '';

                              frmCity4code = suggestion.cityCode ?? '';
                              frmCity4cntry = suggestion.countryCode ?? '';
                              dep4.text = suggestion.cityCode?.toUpperCase() ?? '';

                              toCity4name = suggestion.cityName ?? '';
                              //   city1 = true;
                              setState(() {});
                            }),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
                          child: TextField(
                            readOnly: true,
                            controller: date3Controller,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.calendar_month_outlined),
                              hintText: "Eg : 2023-4-11",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: primaryColor,
                              )),
                              label: Text("Departure"),
                            ),
                            onTap: () async {
                              DateTime? pickedFromDate = await showDatePicker(
                                context: context,
                                currentDate: DateTime.now(),
                                initialDate: DateTime.now() /* .subtract(const Duration(days: 30)) */, //get today's date
                                firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime.now().add(const Duration(days: 365)),
                              );
                              date3 = pickedFromDate;
                              pickedFromDate != null ? date3Controller.text = DateFormat('dd MMMM').format(pickedFromDate) : '';
                              showEditing3 = false;
                              setState(() {});
                              //   value.notify();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 10),
                if (!showEditing4)
                  city4
                      ? InkWell(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("From", style: TextStyle(color: Colors.grey)),
                                    Text(frmCity4code.toUpperCase(), style: TextStyle(fontSize: 20)),
                                    Text(frmCity4name, style: TextStyle()),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("To", style: TextStyle(color: Colors.grey)),
                                    Text(toCity4code, style: TextStyle(fontSize: 20)),
                                    Text(toCity4name, style: TextStyle()),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Date", style: TextStyle(color: Colors.grey)),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_month_rounded),
                                        Text(date4Controller.text),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            showEditing4 = true;
                            setState(() {});
                          },
                        )
                      : SizedBox()
                else
                  city3
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TypeAheadField<AirportData>(
                                  hideSuggestionsOnKeyboardHide: true,
                                  debounceDuration: const Duration(milliseconds: 500),
                                  suggestionsCallback: (query) async => getList(query),
                                  itemBuilder: (context, itemData) => ListTile(
                                        title: Text("${itemData.cityName?.toUpperCase() ?? ''} - ${itemData.cityCode?.toUpperCase() ?? ''}"),
                                        subtitle: Text(itemData.airportName ?? ''),
                                      ),
                                  textFieldConfiguration: TextFieldConfiguration(
                                    // autofocus: true,
                                    enabled: false,
                                    controller: dep4,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      label: const Text("Departure"),
                                      prefixIcon: const Icon(Icons.flight_takeoff_outlined),
                                      prefixIconColor: Colors.grey.shade700,
                                      border: const OutlineInputBorder(),
                                    ),
                                  ),
                                  noItemsFoundBuilder: (context) => const SizedBox(
                                        height: 80,
                                        child: Center(child: Text("No Airports Found")),
                                      ),
                                  onSuggestionSelected: (suggestion) {
                                    frmCity4code = suggestion.cityCode ?? '';
                                    frmCity4cntry = suggestion.countryCode ?? '';
                                    dep4.text = suggestion.cityCode?.toUpperCase() ?? '';

                                    frmCity4name = suggestion.cityName ?? '';

                                    //      city1 = true;
                                    setState(() {});
                                  }),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TypeAheadField<AirportData>(
                                  hideSuggestionsOnKeyboardHide: true,
                                  debounceDuration: const Duration(milliseconds: 500),
                                  suggestionsCallback: (query) async => getList(query),
                                  itemBuilder: (context, itemData) => ListTile(
                                        title: Text("${itemData.cityName?.toUpperCase() ?? ''} - ${itemData.cityCode?.toUpperCase() ?? ''}"),
                                        subtitle: Text(itemData.airportName ?? ''),
                                      ),
                                  textFieldConfiguration: TextFieldConfiguration(
                                    //   autofocus: true,
                                    controller: arr4,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      label: const Text("Arrival"),
                                      prefixIcon: const Icon(Icons.flight_takeoff_outlined),
                                      prefixIconColor: Colors.grey.shade700,
                                      border: const OutlineInputBorder(),
                                    ),
                                  ),
                                  noItemsFoundBuilder: (context) => const SizedBox(
                                        height: 80,
                                        child: Center(child: Text("No Airports Found")),
                                      ),
                                  onSuggestionSelected: (suggestion) {
                                    toCity4code = suggestion.cityCode ?? '';
                                    toCity4cntry = suggestion.countryCode ?? '';
                                    arr4.text = suggestion.cityCode?.toUpperCase() ?? '';

                                    toCity4name = suggestion.cityName ?? '';
                                    //   city1 = true;
                                    setState(() {});
                                  }),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
                                child: TextField(
                                  readOnly: true,
                                  controller: date4Controller,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.calendar_month_outlined),
                                    hintText: "Eg : 2023-4-11",
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: primaryColor,
                                    )),
                                    label: Text("Departure"),
                                  ),
                                  onTap: () async {
                                    DateTime? pickedFromDate = await showDatePicker(
                                      context: context,
                                      currentDate: DateTime.now(),
                                      initialDate: DateTime.now() /* .subtract(const Duration(days: 30)) */, //get today's date
                                      firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime.now().add(const Duration(days: 365)),
                                    );
                                    date4 = pickedFromDate;
                                    pickedFromDate != null ? date4Controller.text = DateFormat('dd MMMM').format(pickedFromDate) : '';
                                    showEditing4 = false;
                                    setState(() {});
                                    //   value.notify();
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox()
              ])
            : SizedBox(),
        Divider(
          thickness: 2,
        ),
        !city4
            ? InkWell(
                onTap: () {
                  if (city3) {
                    city4 = true;
                  } else {
                    city3 = true;
                  }
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                      //    style: BorderStyle.solid,
                    ),
                  ),
                  child: Text('Add City'),
                ),
              )
            : SizedBox(),

        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                child: TextField(
                  readOnly: true,
                  controller: passengerController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.account_circle_outlined),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: primaryColor,
                    )),
                    label: Text("Passenger"),
                  ),
                  onTap: () async {
                    passengerCountAndTravelClass(context);
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                child: TextField(
                  readOnly: true,
                  controller: classController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.flight_class_outlined),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: primaryColor,
                    )),
                    label: Text("Class"),
                  ),
                  onTap: () async {
                    passengerCountAndTravelClass(context);
                  },
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () async {
              searchReq.adult = adultCount;
              searchReq.child = childCount;
              searchReq.infant = infantCount;
              searchReq.airlineClass = classController.text;
              searchReq.traveltype = "";
              searchReq.prefferedCarriers = "";
              searchReq.prefferedProviders = "";
              searchReq.fareType = "";
              searchReq.isdirect = false;
              searchReq.objsectorlist = [];

              sector1.origin = frmCity1code;
              sector1.origincountry = frmCity1cntry;
              sector1.destination = toCity1code;
              sector1.destinationcountry = toCity1cntry;
              sector1.departureDate = date1;

              searchReq.objsectorlist?.add(sector1);

              sector2.origin = frmCity2code;
              sector2.origincountry = frmCity2cntry;
              sector2.destination = toCity2code;
              sector2.destinationcountry = toCity2cntry;
              sector2.departureDate = date2;

              searchReq.objsectorlist?.add(sector2);

              if (city3 && dep3.text.isNotEmpty && arr3.text.isNotEmpty) {
                sector3.origin = frmCity3code;
                sector3.origincountry = frmCity3cntry;
                sector3.destination = toCity3code;
                sector3.destinationcountry = toCity3cntry;
                sector3.departureDate = date3;

                searchReq.objsectorlist?.add(sector3);

                if (city4 && dep4.text.isNotEmpty && arr3.text.isNotEmpty) {
                  sector4.origin = frmCity4code;
                  sector4.origincountry = frmCity4cntry;
                  sector4.destination = toCity2code;
                  sector4.destinationcountry = toCity4cntry;
                  sector4.departureDate = date2;

                  searchReq.objsectorlist?.add(sector4);
                }
              }
              print(searchReq);
              if (frmCity1cntry != "IN" || toCity1cntry != "IN" || frmCity2cntry != "IN" || toCity2cntry != "IN" || frmCity3cntry != "IN" || toCity3cntry != "IN" || frmCity4cntry != "IN" || toCity4cntry != "IN") {
                internationalTrip = true;
                print("If statement works");
              } else {
                internationalTrip = false;
                print("else statement works");
              }
              print(internationalTrip);

              SearchApi().oneWay(searchReq).then((value) {
                final data = value ?? const AirlineSearchResponse();
                print(data);
                data.status != null && data.status!
                    ? Navigator.of(context).pushNamed('/FlightSearchResult', arguments: {
                        "data": data,
                        "tripType": "M",
                        "internationalTrip": internationalTrip,
                      })
                    : Helper().toastMessage(value?.responseMessage ?? "Try Again");
              });
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width, 50),
              backgroundColor: secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text("SEARCH FLIGHTS", style: TextStyle(fontSize: 20)),
          ),
        ),

        //  passengerCountAndTravelClass(context),
      ],
    );
  }

  passengerCountAndTravelClass(BuildContext context) {
    return showModalBottomSheet(
        // enableDrag: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Select Travelers & Class", style: TextStyle(fontSize: 23)),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close),
                        )
                      ],
                    ),
                    const Divider(thickness: 2),
                    //Adult
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Adult",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 30),
                            Text("12 yrs & above"),
                          ],
                        ),
                        Card(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (adultCount > 1) {
                                    adultCount--;
                                    infantCount = 0;
                                    totalPassengerCount = adultCount + childCount;
                                    //   passengerController.text = "Adt :9\tchd :5\tinf :9";
                                    final totalCount = totalPassengerCount + infantCount;
                                    totalCount <= 1 ? passengerController.text = "$totalCount Passenger" : passengerController.text = "$totalCount Passengers";

                                    setState(() {});
                                  }
                                },
                                icon: const Icon(Icons.remove)),
                            Text(
                              "$adultCount",
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  if (totalPassengerCount < 9) {
                                    adultCount++;
                                    totalPassengerCount = adultCount + childCount;
                                    final totalCount = totalPassengerCount + infantCount;
                                    totalCount <= 1 ? passengerController.text = "$totalCount Passenger" : passengerController.text = "$totalCount Passengers";

                                    setState(() {});
                                  }
                                },
                                icon: const Icon(Icons.add)),
                          ],
                        ))
                      ],
                    ),
                    //  child
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Child",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 30),
                            Text("2 - 12 yrs"),
                          ],
                        ),
                        Card(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (childCount > 0) {
                                    childCount--;
                                    totalPassengerCount = adultCount + childCount;
                                    final totalCount = totalPassengerCount + infantCount;
                                    totalCount <= 1 ? passengerController.text = "$totalCount Passenger" : passengerController.text = "$totalCount Passengers";

                                    setState(() {});
                                  }
                                },
                                icon: const Icon(Icons.remove)),
                            Text(
                              "$childCount",
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  if (totalPassengerCount < 9) {
                                    childCount++;
                                    totalPassengerCount = adultCount + childCount;
                                    final totalCount = totalPassengerCount + infantCount;
                                    totalCount <= 1 ? passengerController.text = "$totalCount Passenger" : passengerController.text = "$totalCount Passengers";

                                    setState(() {});
                                  }
                                },
                                icon: const Icon(Icons.add)),
                          ],
                        ))
                      ],
                    ),
                    //Infant
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Infant",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 30),
                            Text("Under 2 yrs"),
                          ],
                        ),
                        Card(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (infantCount > 0) {
                                    infantCount--;
                                    totalPassengerCount = adultCount + childCount;
                                    final totalCount = totalPassengerCount + infantCount;
                                    totalCount <= 1 ? passengerController.text = "$totalCount Passenger" : passengerController.text = "$totalCount Passengers";

                                    setState(() {});
                                  }
                                },
                                icon: const Icon(Icons.remove)),
                            Text(
                              "$infantCount",
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  if (infantCount < adultCount) {
                                    infantCount++;
                                    totalPassengerCount = adultCount + childCount;
                                    final totalCount = totalPassengerCount + infantCount;
                                    totalCount <= 1 ? passengerController.text = "$totalCount Passenger" : passengerController.text = "$totalCount Passengers";

                                    setState(() {});
                                  }
                                },
                                icon: const Icon(Icons.add)),
                          ],
                        ))
                      ],
                    ),

                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "\nCHOOSE CABIN CLASS\n",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      // alignment: WrapAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            travelClass = "Economy";
                            classController.text = travelClass;
                            setState(() {
                              economy = true;
                              premiumEconomy = false;
                              businessClass = false;
                              firstClass = false;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                            decoration: BoxDecoration(
                              border: !economy ? Border.all(color: Colors.grey) : null,
                              borderRadius: BorderRadius.circular(5),
                              color: economy ? primaryColor : null,
                            ),
                            child: Text(
                              'ECONOMY',
                              style: economy
                                  ? const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    )
                                  : const TextStyle(
                                      fontSize: 13,
                                    ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            travelClass = "Premium Economy";
                            classController.text = travelClass;

                            setState(() {
                              economy = false;
                              premiumEconomy = true;
                              businessClass = false;
                              firstClass = false;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                            decoration: BoxDecoration(
                              border: !premiumEconomy ? Border.all(color: Colors.grey) : null,
                              borderRadius: BorderRadius.circular(5),
                              color: premiumEconomy ? primaryColor : null,
                            ),
                            child: Text(
                              'PREMIUM ECONOMY',
                              style: premiumEconomy
                                  ? const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    )
                                  : const TextStyle(
                                      fontSize: 13,
                                    ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            travelClass = "Business Class";
                            classController.text = travelClass;
                            setState(() {
                              economy = false;
                              premiumEconomy = false;
                              businessClass = true;
                              firstClass = false;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                            decoration: BoxDecoration(
                              border: !businessClass ? Border.all(color: Colors.grey) : null,
                              borderRadius: BorderRadius.circular(5),
                              color: businessClass ? primaryColor : null,
                            ),
                            child: Text(
                              'BUSINESS CLASS',
                              style: businessClass
                                  ? const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    )
                                  : const TextStyle(
                                      fontSize: 13,
                                    ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            travelClass = "First Class";
                            classController.text = travelClass;
                            setState(() {
                              economy = false;
                              premiumEconomy = false;
                              businessClass = false;
                              firstClass = true;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                            decoration: BoxDecoration(
                              border: !firstClass ? Border.all(color: Colors.grey) : null,
                              borderRadius: BorderRadius.circular(5),
                              color: firstClass ? primaryColor : null,
                            ),
                            child: Text(
                              'FIRST CLASS',
                              style: firstClass
                                  ? const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    )
                                  : const TextStyle(
                                      fontSize: 13,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(MediaQuery.of(context).size.width, 50),
                          backgroundColor: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text("DONE", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  Future<List<AirportData>> getList(String query) async {
    List<AirportData> filteredFlights = [];

    if (query.length >= 3) {
      final cityCodeList = await airportList.where((element) => element.cityCode!.toLowerCase().contains(query.toLowerCase())).toList();
      filteredFlights.addAll(cityCodeList);

      log("cityCodeList ++++$cityCodeList");

      final cityNameList = airportList.where((element) => element.cityName!.toLowerCase().contains(query.toLowerCase())).toList();
      filteredFlights.addAll(cityNameList);
      log("cityNameList ++++$cityNameList");
      final airportNameList = airportList.where((element) => element.airportName!.toLowerCase().contains(query.toLowerCase())).toList();
      filteredFlights.addAll(airportNameList);
      log("airportNameList ++++$airportNameList");
    }
    log(filteredFlights.toString());
    return filteredFlights;
  }
}
