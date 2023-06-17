import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/search_widgets.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
import 'package:travel_mytri_mobile_v1/data/api.dart';
import 'package:travel_mytri_mobile_v1/data/model/Search/flight_search_model.dart';
import 'package:travel_mytri_mobile_v1/data/model/airport_list.dart';

import '../../data/model/hive_class_functions.dart';

class FlightSearchScreen extends StatefulWidget {
  FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  bool isLogged = false;
  String? userName = "";
  @override
  void initState() {
    getToken().then((value) {
      dev.log(isLogged.toString());
      isLogged = value.isUser ?? false;
      userName = value.firstName ?? "User";
      dev.log((userName).toString() + "userDetails");
      setState(() {});
    });
    super.initState();
  }

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
            label: Text(
              "Hi $userName !",
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25),
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
              decoration: BoxDecoration(
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
  DateTime departureDate = DateTime.now();

  bool showDepTypeField = true;
  bool showArrTypeField = true;

  TextEditingController departureController = TextEditingController();
  TextEditingController arrivalController = TextEditingController();
  TextEditingController departureDateController = TextEditingController(text: DateFormat('dd MMM yyyy').format(DateTime.now()));
  TextEditingController returnDateController = TextEditingController();
  TextEditingController passengerController = TextEditingController();
  TextEditingController classController = TextEditingController();

  String deptAirportName = '';
  String arrAirportName = '';
  String departure = '';
  String arrival = '';
  String travelClass = '';
  String travelType = '';
  bool internationalTrip = false;

  int adultCount = 1;
  int childCount = 0;
  int infantCount = 0;
  int totalPassengerCount = 1;

  List<AirportData> airportList = [];
  FlightSearchReqModel searchReq = FlightSearchReqModel();
  Objsectorlist onwardSector = Objsectorlist();

  String originCode = '';

  String originCountry = '';

  String destinationCode = '';
  String destinationCountry = '';

  DateTime? returnDate;

  bool isLoadingPage = false;

  @override
  void initState() {
    AirlineApi().getAirport().then((value) {
      airportList = value ?? [];
    });

    super.initState();

    passengerController.text = '1 Passenger';
    classController.text = 'Economy';
    //travelType = 'oneWay';
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
      child: isLoadingPage
          ? Image.asset(
              "assets/loader.gif",
              //      "https://cdn.dribbble.com/users/328772/screenshots/10293847/media/d45c05b5e858e2508fb1a3b84f33e932.gif",
            )
          : ListView(
              padding: const EdgeInsets.all(30),
              children: [
                selectTripType(),
                multiCity ? MultiCity() : oneWayAndRoundTrip(context),
              ],
            ),
    );
  }

  Column oneWayAndRoundTrip(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              /////////////////////////////////

              if (oneWay || roundTrip) {
                onwardSector.origin = originCode;
                onwardSector.origincountry = originCountry;
                onwardSector.destination = destinationCode;
                onwardSector.destinationcountry = destinationCountry;
                onwardSector.departureDate = departureDate;

                if (oneWay) {
                  onwardSector.tripmode = "";
                }

                searchReq.objsectorlist?.add(onwardSector);
                travelType = "O";
              }

              if (roundTrip) {
                Objsectorlist returnSector = Objsectorlist();
                returnSector.origin = destinationCode;
                returnSector.origincountry = destinationCountry;
                returnSector.destination = originCode;
                returnSector.destinationcountry = originCountry;
                returnSector.departureDate = returnDate;

                returnSector.tripmode = "R";

                travelType = "R";

                searchReq.objsectorlist?.add(returnSector);
              }

              print(searchReq);
              print(internationalTrip);
              if (originCountry != "IN" || destinationCountry != "IN") {
                internationalTrip = true;
                print("If statement works");
              } else {
                internationalTrip = false;
                print("else statement works");
              }
              print(internationalTrip);

              if (showDepTypeField && showArrTypeField && departure != '' && arrival != '') {
                isLoadingPage = true;
                setState(() {});
                if (oneWay) {
                  SearchApi().oneWay(searchReq).then((value) {
                    isLoadingPage = false;
                    setState(() {});

                    final data = value ?? AirlineSearchResponse();

                    data.status != null && data.status!
                        ? Navigator.of(context).pushNamed('/FlightSearchResult', arguments: {
                            "data": data,
                            "tripType": travelType,
                            "internationalTrip": internationalTrip,
                          }).then((value) {
                            //      isLoadingPage = false;
                            //         setState(() {});
                          })
                        : Helper().toastMessage(value?.responseMessage ?? "Try Again");
                  });
                } else if (roundTrip && internationalTrip) {
                  SearchApi().combinedRoundTrip(searchReq).then((value) {
                    isLoadingPage = false;
                    setState(() {});

                    final data = value ?? RAirlineSearchResponse();
                    dev.log({
                          "data": data,
                          "tripType": travelType,
                          "internationalTrip": internationalTrip,
                        }.toString() +
                        "  => Passing combinedRoundTrip");
                    data.status != null && data.status!
                        ? Navigator.of(context).pushNamed('/FlightSearchResult', arguments: {
                            "data": data,
                            "tripType": travelType,
                            "internationalTrip": true,
                          }).then((value) {
                            //  isLoadingPage = false;
                            //   setState(() {});
                          })
                        : Helper().toastMessage(value?.responseMessage ?? "Try Again");
                  });
                } else if (roundTrip && internationalTrip == false) {
                  SearchApi().individualRoundTrip(searchReq).then((value) {
                    isLoadingPage = false;
                    setState(() {});

                    final data = value ?? IRAirlineSearchResponse();
                    dev.log({
                          "data": data,
                          "tripType": travelType,
                          "internationalTrip": internationalTrip,
                        }.toString() +
                        "  => Passing individualRoundTrip");
                    data.status != null && data.status!
                        ? Navigator.of(context).pushNamed('/FlightSearchResult', arguments: {
                            "data": data,
                            "tripType": travelType,
                            "internationalTrip": false,
                          }).then((value) {
                            //     isLoadingPage = false;
                            //       setState(() {});
                          })
                        : Helper().toastMessage(value?.responseMessage ?? "Try Again");
                  });
                } else if (multiCity) {
                  SearchApi().oneWay(searchReq).then((value) {
                    isLoadingPage = false;
                    setState(() {});
                    final data = value ?? AirlineSearchResponse();

                    data.status != null && data.status!
                        ? Navigator.of(context).pushNamed('/FlightSearchResult', arguments: {
                            "data": data,
                            "tripType": travelType,
                            "internationalTrip": internationalTrip,
                          }).then((value) {
                            // isLoadingPage = false;
                            // setState(() {});
                          })
                        : Helper().toastMessage(value?.responseMessage ?? "Try Again");
                  });
                }
              } else {
                Helper().toastMessage("Please select Valid Airport");
              }
              //    Navigator.of(context).pushNamed('/FlightSearchResult');
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
                                  if ((infantCount < adultCount) && (infantCount < 4)) {
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
                departureDate = pickedFromDate ?? DateTime.now();
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
                    // travelType = "roundTrip";
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      currentDate: DateTime.now(),
                      initialDate: DateTime.now(), //get today's date
                      firstDate: DateTime(1980), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    pickedDate != null ? returnDateController.text = "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}" : '';
                    returnDate = pickedDate;

                    if (returnDateController.text.isEmpty) {
                      oneWay = true;
                      roundTrip = false;
                      //   travelType = "oneWay";
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
                            //    travelType = "oneWay";
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
                      departureController.text = '';
                      setState(() {});
                    },
                  )
                : TypeAheadField<AirportData>(
                    hideSuggestionsOnKeyboardHide: true,
                    debounceDuration: const Duration(milliseconds: 500),
                    suggestionsCallback: (query) async => getList(query),
                    itemBuilder: (context, itemData) => ListTile(
                          title: Text("${itemData.cityName?.toUpperCase() ?? ''} - ${itemData.code?.toUpperCase() ?? ''}"),
                          subtitle: Text(itemData.airportName ?? ''),
                          trailing: Text(itemData.countryCode ?? ''),
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
                      originCode = suggestion.cityCode ?? '';
                      originCountry = suggestion.countryCode ?? '';
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
                  arrivalController.text = '';

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
                        trailing: Text(itemData.countryCode ?? ''),
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
                    destinationCode = suggestion.cityCode ?? '';
                    destinationCountry = suggestion.countryCode ?? '';
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
                  if (showArrTypeField && showDepTypeField) {
                    final tempDept = departure;
                    departure = arrival;
                    arrival = tempDept;

                    final tempDptAirport = deptAirportName;
                    deptAirportName = arrAirportName;
                    arrAirportName = tempDptAirport;

                    final tempController = departureController;
                    departureController = arrivalController;
                    arrivalController = tempController;
                    setState(() {});
                  }
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
              //   travelType = "oneWay";
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

              //    travelType = "roundTrip";
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
              //    travelType = "multiCity";
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

      final codeList = await airportList.where((element) => element.code!.toLowerCase().contains(query.toLowerCase())).toList();
      filteredFlights.addAll(codeList);

      dev.log("cityCodeList ++++$codeList");

      final cityNameList = airportList.where((element) => element.cityName!.toLowerCase().contains(query.toLowerCase())).toList();
      filteredFlights.addAll(cityNameList);
      dev.log("cityNameList ++++$cityNameList");
      final airportNameList = airportList.where((element) => element.airportName!.toLowerCase().contains(query.toLowerCase())).toList();
      filteredFlights.addAll(airportNameList);
      dev.log("airportNameList ++++$airportNameList");
    }
    dev.log(filteredFlights.toString());

    filteredFlights = filteredFlights.toSet().map((item) => item.code).map((itemId) {
      return filteredFlights.firstWhere((item) => item.code == itemId);
    }).toList();

    return filteredFlights;
  }
}
