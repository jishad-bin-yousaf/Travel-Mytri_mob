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
  Map<TripType, String> tripTypes = {
    TripType.flights: 'Flights',
    TripType.hotels: 'Hotels',
  };

  @override
  Widget build(BuildContext context) {
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
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade500),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Calicut",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Icon(Icons.arrow_forward),
                        ),
                        Text(
                          "Sharjah",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Card(
                          color: Color.fromARGB(255, 23, 212, 9),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 8),
                            child: Text("Booked",
                                style: TextStyle(
                                    color: white, fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "One way flight",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Booking ID :51545",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "PNR :87898",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Text(
                                  "Departure",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Text(
                                "Fri 29 Oct 13:22",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "CCJ Calicut",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Terminal 1",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 100,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  child: Icon(
                                    Icons.circle_outlined,
                                    size: 15,
                                  ),
                                ),
                                Divider(
                                  endIndent: 12,
                                  indent: 12,
                                  color: Colors.grey.shade600,
                                  thickness: 2,
                                ),
                                Positioned(
                                  right: 0,
                                  child: Icon(
                                    Icons.circle,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Text(
                                  "Arrival",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Text(
                                "Fri 29 Oct 13:22",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "COK Cochin",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Terminal 1",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Container(
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                              Icon(Icons.arrow_forward),
                              Text("Sharjah",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
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
