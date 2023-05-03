import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
import 'package:travel_mytri_mobile_v1/data/api.dart';
import 'package:travel_mytri_mobile_v1/data/model/airport_list.dart';

class FlightSearchScreen extends StatelessWidget {
  const FlightSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      bottomSheet: Container(
        color: white,
        height: 100,
        width: MediaQuery.of(context).size.width,
      ),
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 180,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active,
                size: 35,
              )),
          const SizedBox(width: 10),
        ],
        leading: Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () {
              //   loginBottomSheet(context, width);
            },
            icon: const Icon(Icons.account_circle_outlined, color: Colors.white),
            label: const Text(
              "Hi User !",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(top: 60),
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  flightOrHotelSelect(context),
                  const TripTypes(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row flightOrHotelSelect(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 5,
                //  offset: const Offset(0, 7), // changes position of shadow
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
            Icon(Icons.flight_takeoff, size: 35),
            Text("Flights", style: TextStyle(fontSize: 18)),
          ]),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 1,
                  blurRadius: 5,
                  //  offset: const Offset(0, 7), // changes position of shadow
                ),
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
              Icon(Icons.bed_outlined, size: 35),
              Text("Hotels", style: TextStyle(fontSize: 18)),
            ]),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 1,
                  blurRadius: 5,
                  //  offset: const Offset(0, 7), // changes position of shadow
                ),
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
              Icon(Icons.health_and_safety_outlined, size: 35),
              Text("Insurance", style: TextStyle(fontSize: 18)),
            ]),
          ),
        ),
      ],
    );
  }
}

class TripTypes extends StatefulWidget {
  const TripTypes({
    super.key,
  });

  @override
  State<TripTypes> createState() => _TripTypesState();
}

class _TripTypesState extends State<TripTypes> with SingleTickerProviderStateMixin {
  late bool oneWay;
  late bool roundTrip;
  late bool multiCity;
  late bool economy;
  late bool premiumEconomy;
  late bool businessClass;
  late bool firstClass;

  TextEditingController departureController = TextEditingController();
  TextEditingController arrivalController = TextEditingController();
  TextEditingController departureDateController = TextEditingController();
  TextEditingController returnDateController = TextEditingController();
  TextEditingController passengerController = TextEditingController();
  TextEditingController classController = TextEditingController();

  String deptAirportName = '';
  String arrAirportName = '';

  bool showDepTypeField = true;
  bool showArrTypeField = true;

  String departure = '';
  String arrival = '';
  String travelClass = '';
  List<AirportData> airportList = [];

  @override
  void initState() {
    AirlineApi().getAirport().then((value) {
      airportList = value ?? [];
    });

    super.initState();

    passengerController.text = '1 Passenger';

    oneWay = true;
    roundTrip = false;
    multiCity = false;
    economy = true;
    premiumEconomy = false;
    businessClass = false;
    firstClass = false;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          selectTripType(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text("\t\tWhere are you going ?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          departureAndArrival(context),
          departureAndReturnDate(context),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
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
                      passengerController.text = "1 Passenger";

                      //   value.notify();
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
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
              onPressed: () async {},
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
        ],
      ),
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Select Travellers & Class", style: TextStyle(fontSize: 23)),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      )
                    ],
                  ),
                  const Divider(thickness: 2),
                  Row(),
                  Row(),
                  Row(),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "\nCHOOSE CABIN CLASS\n",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Wrap(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () async {},
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
            );
          });
        });
  }

  countAndTravelClass(BuildContext context) {
    return showModalBottomSheet(
        // enableDrag: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Select Travellers & Class", style: TextStyle(fontSize: 23)),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
                const Divider(thickness: 2),
                Row(),
                Row(),
                Row(),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "\nCHOOSE CABIN CLASS\n",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    // alignment: WrapAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          returnDateController.text = '';
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
                )
              ],
            ),
          );
        });
  }

  Row departureAndReturnDate(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          //         width: width * 0.32,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
            child: TextField(
              readOnly: true,
              controller: departureDateController,
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
                pickedFromDate != null ? departureDateController.text = "${pickedFromDate.year}-${pickedFromDate.month.toString().padLeft(2, '0')}-${pickedFromDate.day.toString().padLeft(2, '0')}" : '';

                //   value.notify();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
            child: Stack(
              children: [
                TextField(
                  readOnly: true,
                  controller: returnDateController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_month_outlined),
                    hintText: "Eg : 2023-4-11",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: primaryColor,
                    )),
                    label: Text("Return"),
                  ),
                  onTap: () async {
                    oneWay = false;
                    roundTrip = true;
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      currentDate: DateTime.now(),
                      initialDate: DateTime.now(), //get today's date
                      firstDate: DateTime(1980), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    pickedDate != null ? returnDateController.text = "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}" : '';
                    if (returnDateController.text.isEmpty) {
                      oneWay = true;
                      roundTrip = false;
                    }
                    setState(() {});
                  },
                ),
                roundTrip
                    ? Positioned(
                        right: 0,
                        top: 0,
                        child: IconButton(
                          onPressed: () {
                            oneWay = true;
                            roundTrip = false;
                            returnDateController.text = '';
                            setState(() {});
                          },
                          icon: const Icon(Icons.close),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Stack departureAndArrival(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            showDepTypeField
                ? InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      //    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.flight_takeoff_rounded, color: Colors.grey.shade700, size: 35),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  departure.toUpperCase(),
                                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  deptAirportName,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey.shade900),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      showDepTypeField = false;
                      setState(() {});
                    },
                  )
                : TypeAheadField<AirportData>(
                    hideSuggestionsOnKeyboardHide: true,
                    debounceDuration: const Duration(milliseconds: 500),
                    suggestionsCallback: (query) async => getList(query),
                    itemBuilder: (context, itemData) => ListTile(
                          title: Text("${itemData.cityName?.toUpperCase() ?? ''} - ${itemData.cityCode?.toUpperCase() ?? ''}"),
                          subtitle: Text(itemData.airportName ?? ''),
                        ),
                    textFieldConfiguration: TextFieldConfiguration(
                      autofocus: true,
                      controller: departureController,
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
                      departureController.text = "${suggestion.cityName?.toUpperCase() ?? ''} - ${suggestion.cityCode?.toUpperCase() ?? ''}";
                      departure = departureController.text;
                      deptAirportName = suggestion.airportName ?? '';
                      showDepTypeField = true;
                      setState(() {});
                    }),
            const SizedBox(height: 10),
            if (showArrTypeField)
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  //    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.flight_land_outlined, color: Colors.grey.shade700, size: 35),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              arrival.toUpperCase(),
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              arrAirportName,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey.shade900),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                onTap: () {
                  showArrTypeField = false;
                  setState(() {});
                },
              )
            else
              TypeAheadField<AirportData>(
                  hideSuggestionsOnKeyboardHide: true,
                  debounceDuration: const Duration(milliseconds: 500),
                  suggestionsCallback: (query) async => getList(query),
                  itemBuilder: (context, itemData) => ListTile(
                        title: Text("${itemData.cityName?.toUpperCase() ?? ''} - ${itemData.cityCode?.toUpperCase() ?? ''}"),
                        subtitle: Text(itemData.airportName ?? ''),
                      ),
                  textFieldConfiguration: TextFieldConfiguration(
                    autofocus: true,
                    controller: arrivalController,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      label: const Text("Arrival"),
                      prefixIcon: const Icon(Icons.flight_land_outlined),
                      prefixIconColor: Colors.grey.shade700,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  noItemsFoundBuilder: (context) => const SizedBox(
                        height: 80,
                        child: Center(child: Text("No Airports Found")),
                      ),
                  onSuggestionSelected: (suggestion) {
                    arrivalController.text = "${suggestion.cityName?.toUpperCase() ?? ''} - ${suggestion.cityCode?.toUpperCase() ?? ''}";
                    arrival = arrivalController.text;
                    arrAirportName = suggestion.airportName ?? '';
                    showArrTypeField = true;
                    setState(() {});
                  })
          ],
        ),
        Positioned(
          right: 40,
          top: 40,
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: secondaryColor,
            ),
            child: Transform.rotate(
              angle: 90 * (pi / 180),
              child: IconButton(
                onPressed: () {
                  final tempDept = departure;
                  departure = arrival;
                  arrival = tempDept;
                  final tempDptAirport = deptAirportName;
                  deptAirportName = arrAirportName;
                  arrAirportName = tempDptAirport;
                  setState(() {});
                },
                icon: const Icon(
                  Icons.connecting_airports_rounded,
                  color: white,
                  size: 40,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row selectTripType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            returnDateController.text = '';
            setState(() {
              oneWay = true;
              roundTrip = false;
              multiCity = false;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            decoration: BoxDecoration(
              border: !oneWay ? Border.all(color: Colors.grey) : null,
              borderRadius: BorderRadius.circular(15),
              color: oneWay ? secondaryColor : null,
            ),
            child: Text(
              'One Way',
              style: oneWay
                  ? const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
            setState(() {
              oneWay = false;
              roundTrip = true;
              multiCity = false;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            decoration: BoxDecoration(
              border: !roundTrip ? Border.all(color: Colors.grey) : null,
              borderRadius: BorderRadius.circular(15),
              color: roundTrip ? secondaryColor : null,
            ),
            child: Text(
              'Round Trip',
              style: roundTrip
                  ? const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
            setState(() {
              oneWay = false;
              roundTrip = false;
              multiCity = true;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            decoration: BoxDecoration(
              border: !multiCity ? Border.all(color: Colors.grey) : null,
              borderRadius: BorderRadius.circular(15),
              color: multiCity ? secondaryColor : null,
            ),
            child: Text(
              'Multi City',
              style: multiCity
                  ? const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    )
                  : const TextStyle(
                      fontSize: 13,
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Future<List<AirportData>> getList(String query) async {
    List<AirportData> filteredFlights = [];

    if (query.length >= 3) {
      final cityCodeList = await airportList.where((element) => element.cityCode!.toLowerCase().contains(query.toLowerCase())).toList();
      filteredFlights.addAll(cityCodeList);

      dev.log("cityCodeList ++++$cityCodeList");

      final cityNameList = airportList.where((element) => element.cityName!.toLowerCase().contains(query.toLowerCase())).toList();
      filteredFlights.addAll(cityNameList);
      dev.log("cityNameList ++++$cityNameList");
      final airportNameList = airportList.where((element) => element.airportName!.toLowerCase().contains(query.toLowerCase())).toList();
      filteredFlights.addAll(airportNameList);
      dev.log("airportNameList ++++$airportNameList");
    }
    dev.log(filteredFlights.toString());
    return filteredFlights;
  }
}
