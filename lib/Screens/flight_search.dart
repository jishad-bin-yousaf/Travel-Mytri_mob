import 'dart:math';

import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
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

class _TripTypesState extends State<TripTypes> {
  late bool oneWay;
  late bool roundTrip;
  late bool multiCity;

  TextEditingController departureController = TextEditingController();

  String airportName = '';

  bool showDepTypeFied = true;
  bool showArrTypeFied = true;

  String departure = '';
  @override
  void initState() {
    super.initState();
    oneWay = true;
    roundTrip = false;
    multiCity = false;
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
          //  Autocomplete(optionsBuilder: (query) async => getList(query)),
          Stack(
            children: [
              Column(
                children: [
                  showDepTypeFied
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
                                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text(
                                        airportName,
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
                            showDepTypeFied = false;
                            setState(() {});
                          },
                        )
                      : TypeAheadField<AirportData>(
                          hideSuggestionsOnKeyboardHide: true,
                          debounceDuration: Duration(milliseconds: 500),
                          suggestionsCallback: (query) async => getList(query),
                          itemBuilder: (context, itemData) => ListTile(
                                title: Text("${itemData.cityName?.toUpperCase() ?? ''} - ${itemData.cityCode?.toUpperCase() ?? ''}"),
                                subtitle: Text(itemData.airportName ?? ''),
                              ),
                          textFieldConfiguration: TextFieldConfiguration(
                            maxLines: 2,
                            controller: departureController,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              label: const Text("Departure"),
                              prefixIcon: Icon(Icons.flight_takeoff_outlined),
                              prefixIconColor: Colors.grey.shade700,
                              border: OutlineInputBorder(),
                              suffixStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey.shade800),
                              suffixText: "\n$airportName",
                            ),
                          ),
                          noItemsFoundBuilder: (context) => SizedBox(),
                          onSuggestionSelected: (suggestion) {
                            departureController.text = "${suggestion.cityName?.toUpperCase() ?? ''} - ${suggestion.cityCode?.toUpperCase() ?? ''}";
                            departure = departureController.text;
                            airportName = suggestion.airportName ?? '';
                            showDepTypeFied = true;
                            setState(() {});
                          }),
                  SizedBox(height: 10),
                  showArrTypeFied
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
                                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text(
                                        airportName,
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
                            showArrTypeFied = false;
                            setState(() {});
                          },
                        )
                      : TypeAheadField<AirportData>(
                          hideSuggestionsOnKeyboardHide: true,
                          debounceDuration: Duration(milliseconds: 500),
                          suggestionsCallback: (query) async => getList(query),
                          itemBuilder: (context, itemData) => ListTile(
                                title: Text("${itemData.cityName?.toUpperCase() ?? ''} - ${itemData.cityCode?.toUpperCase() ?? ''}"),
                                subtitle: Text(itemData.airportName ?? ''),
                              ),
                          textFieldConfiguration: TextFieldConfiguration(
                            maxLines: 2,
                            controller: departureController,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              label: const Text("Departure"),
                              prefixIcon: Icon(Icons.flight_takeoff_outlined),
                              prefixIconColor: Colors.grey.shade700,
                              border: OutlineInputBorder(),
                              suffixStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey.shade800),
                              suffixText: "\n$airportName",
                            ),
                          ),
                          noItemsFoundBuilder: (context) => SizedBox(),
                          onSuggestionSelected: (suggestion) {
                            departureController.text = "${suggestion.cityName?.toUpperCase() ?? ''} - ${suggestion.cityCode?.toUpperCase() ?? ''}";
                            departure = departureController.text;
                            airportName = suggestion.airportName ?? '';
                            showArrTypeFied = true;
                            setState(() {});
                          })
                ],
              ),
              Positioned(
                  right: 40,
                  top: 40,
                  child: Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: secondaryColor,
                    ),
                    child: Transform.rotate(
                      angle: 90 * (pi / 180),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.connecting_airports_rounded,
                          color: white,
                          size: 60,
                        ),
                      ),
                    ),
                  )

                  /*  CircleAvatar(
                  backgroundColor: secondaryColor,
                  radius: 50,
                  child: Transform.rotate(
                    angle: 90 * (pi / 180),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.connecting_airports_rounded,
                        color: white,
                        size: 60,
                      ),
                    ),
                  ),
                ), */
                  ),
            ],
          )

          //   const TextField(),
        ],
      ),
    );
  }

  Future<Iterable<AirportData>> getList(query) async {
    return const [
      AirportData(
        airportName: "cochin",
        cityCode: "ccj",
        cityName: "dubai",
      ),
      AirportData(
        airportName: "cochin international airport",
        cityCode: "ccj",
        cityName: "kozhikkode",
      ),
      AirportData(
        airportName: "cochin",
        cityCode: "ccj",
        cityName: "bai",
      ),
      AirportData(
        airportName: "cochin",
        cityCode: "ccj",
        cityName: "dub",
      ),
      AirportData(
        airportName: "cochin",
        cityCode: "ccj",
        cityName: "di",
      ),
      AirportData(
        airportName: "cochin",
        cityCode: "ccj",
        cityName: "i",
      ),
      AirportData(
        airportName: "cochin",
        cityCode: "ccj",
        cityName: "di",
      ),
      AirportData(
        airportName: "cochin",
        cityCode: "ccj",
        cityName: "ai",
      ),
      AirportData(
        airportName: "cochin",
        cityCode: "ccj",
        cityName: "du",
      ),
    ];
  }

  Row selectTripType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
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
}
