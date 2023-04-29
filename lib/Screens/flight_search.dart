import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';

import '../bottom_navigation.dart';

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
                  Row(
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
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(30),
                      children: [
                        const TripTypeSelect(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TripTypeSelect extends StatefulWidget {
  const TripTypeSelect({
    super.key,
  });

  @override
  State<TripTypeSelect> createState() => _TripTypeSelectState();
}

class _TripTypeSelectState extends State<TripTypeSelect> {
  late bool oneWay;
  late bool roundTrip;
  late bool multiCity;
  @override
  void initState() {
    super.initState();
    oneWay = true;
    roundTrip = false;
    multiCity = false;
  }

  @override
  Widget build(BuildContext context) {
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
