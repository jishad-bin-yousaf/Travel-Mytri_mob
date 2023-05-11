import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/bottom_navigation.dart';

import '../../data/api.dart';

enum TripType { flights, hotels }

class ScreenMyTrips extends StatefulWidget {
  @override
  State<ScreenMyTrips> createState() => _ScreenMyTripsState();
}

class _ScreenMyTripsState extends State<ScreenMyTrips> {
  TripType selectedTrip = TripType.flights;

  @override
  Widget build(BuildContext context) {
    Map<TripType, String> tripTypes = {
      TripType.flights: 'Flights',
      TripType.hotels: 'Hotels',
    };
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text("My Trips"),
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: Column(
        children: [
          flightsOrHotel(tripTypes),
          Expanded(
            child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: primaryColor,
                      dividerColor: primaryColor,
                      enableFeedback: true,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: "Booked",
                        ),
                        Tab(
                          text: "Cancelled",
                        )
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          selectedTrip == TripType.flights
                              ? flightsTabView(true)
                              : const Center(
                                  child: Text("Sorry Hotel ippol illa")),
                          selectedTrip == TripType.flights
                              ? flightsTabView(false)
                              : const Center(
                                  child: Text("Sorry Hotel ippol illa")),
                        ],
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  flightsTabView(booked) {
    return ListView.builder(
      itemCount: 80,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10)),
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                    right: 20,
                  ),
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/T21.png",
                      height: 60,
                      width: 60,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\tFri 29 Oct 12:32",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Calicut",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Icon(Icons.arrow_forward),
                            Text("Sharjah",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Indigo Airlines",
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          Icon(
                            Icons.brightness_1,
                            size: 10,
                          ),
                          Text("6E 3435",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, size: 30)
          ],
        ),
      ),
    );
  }

  Padding flightsOrHotel(Map<TripType, String> tripTypes) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: PreferredSize(
          preferredSize: const Size.fromHeight(58),
          child: Column(
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(tripTypes.length, (index) {
                    final tripType = tripTypes.keys.elementAt(index);
                    var isSelected = selectedTrip == tripType;
                    return TextButton(
                      onPressed: () {
                        selectedTrip = tripType;
                        //      getMyTripAirline();
                        //  sendRequest();
                        //DB().getAccountStatementResp();
                        setState(() {});
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              isSelected ? white : Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          )),
                      child: Text(
                        tripTypes[tripType]!,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                    //   return buildTripTypeSelector(tripType: tripTypes.keys.elementAt(index), tripTypes: tripTypes);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
