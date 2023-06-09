import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/search_widgets.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/error.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
import 'package:travel_mytri_mobile_v1/data/api.dart';
import 'package:travel_mytri_mobile_v1/data/model/Search/flight_search_model.dart';
import 'package:travel_mytri_mobile_v1/data/model/utilities.dart';
import 'package:connectivity/connectivity.dart';
import '../../data/model/hive_class_functions.dart';
import '../widgets/session_expired.dart';

class ModifyData {
  bool oneWay;
  bool roundTrip;
  bool multiCity;
  bool economy;
  bool premiumEconomy;
  bool businessClass;
  bool firstClass;
  DateTime departureDate;
  String departureDateReq;

  TextEditingController departureController;
  TextEditingController arrivalController;
  TextEditingController departureDateController;
  TextEditingController returnDateController;
  TextEditingController passengerController;
  TextEditingController classController;

  String deptAirportName;
  String arrAirportName;
  String departure;
  String arrival;
  String travelClass;
  String travelType;
  bool internationalTrip;

  int adultCount;
  int childCount;
  int infantCount;
  int totalPassengerCount;

  String originCode;
  String originCountry;

  String destinationCode;
  String destinationCountry;

  DateTime? returnDate;

  bool isLoadingPage;

  String? returnDateReq;

  ModifyData({
    required this.oneWay,
    required this.roundTrip,
    required this.multiCity,
    required this.economy,
    required this.premiumEconomy,
    required this.businessClass,
    required this.firstClass,
    required this.departureDate,
    required this.departureDateReq,
    required this.departureController,
    required this.arrivalController,
    required this.departureDateController,
    required this.returnDateController,
    required this.passengerController,
    required this.classController,
    required this.deptAirportName,
    required this.arrAirportName,
    required this.departure,
    required this.arrival,
    required this.travelClass,
    required this.travelType,
    required this.internationalTrip,
    required this.adultCount,
    required this.childCount,
    required this.infantCount,
    required this.totalPassengerCount,
    required this.originCode,
    required this.originCountry,
    required this.destinationCode,
    required this.destinationCountry,
    required this.returnDate,
    required this.isLoadingPage,
    required this.returnDateReq,
  });

  // Add any additional constructors if needed

  // Add any additional methods or logic as required
}

class FlightSearchScreen extends StatefulWidget {
  FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  bool isLogged = false;
  String? userName = "";

  List<AirportData> airportList = [];
  @override
  void initState() {
    getToken().then((value) {
      dev.log(isLogged.toString());
      isLogged = value.isUser ?? false;
      userName = value.firstName ?? "User";

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UtilitiesApi().getAirport(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while waiting for the result

            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            // Display an error message if the asynchronous operation fails
            return const ErrorPage();
          } else {
            airportList = snapshot.data?.objAirportList ?? [];

            return (snapshot.data?.responseMessage?.trim().toLowerCase() == ("InvalidToken").trim().toLowerCase())
                ? const SessionExpiredPage()
                : Scaffold(
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
                            "Hi $userName",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
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
                                TripTypes(isModify: false, airportList: airportList),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
          }
        });
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
  bool isModify;
  ModifyData? modifyData;
  List<AirportData> airportList;
  TripTypes({
    required this.isModify,
    required this.airportList,
    this.modifyData,
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
  String? departureDateReq = "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}";

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

  FlightSearchReqModel searchReq = FlightSearchReqModel();
  Objsectorlist onwardSector = Objsectorlist();

  String originCode = '';

  String originCountry = '';

  String destinationCode = '';
  String destinationCountry = '';

  DateTime? returnDate;

  bool isLoadingPage = false;
  String dropDownErrorData = "No Airport Found";
  String? returnDateReq;

  @override
  void initState() {
    Connectivity().checkConnectivity().then((value) {
      if (value == ConnectivityResult.none) {
        dropDownErrorData = "Check Your Internet Connection";
        setState(() {});
      }
    });

    super.initState();
    if (widget.isModify) {
      final data = widget.modifyData!;
      oneWay = data.oneWay;
      roundTrip = data.roundTrip;
      multiCity = data.multiCity;
      economy = data.economy;
      premiumEconomy = data.premiumEconomy;
      businessClass = data.businessClass;
      firstClass = data.firstClass;
      departureDate = data.departureDate;
      departureDateReq = data.departureDateReq;
      departureController = data.departureController;
      arrivalController = data.arrivalController;
      departureDateController = data.departureDateController;
      returnDateController = data.returnDateController;
      passengerController = data.passengerController;
      classController = data.classController;
      deptAirportName = data.deptAirportName;
      arrAirportName = data.arrAirportName;
      departure = data.departure;
      arrival = data.arrival;
      travelClass = data.travelClass;
      travelType = data.travelType;
      internationalTrip = data.internationalTrip;
      adultCount = data.adultCount;
      childCount = data.childCount;
      infantCount = data.infantCount;
      totalPassengerCount = data.totalPassengerCount;
      originCode = data.originCode;
      originCountry = data.originCountry;
      destinationCode = data.destinationCode;
      destinationCountry = data.destinationCountry;
      returnDate = data.returnDate;
      isLoadingPage = data.isLoadingPage;
      returnDateReq = data.returnDateReq;
    } else {
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
  }

  @override
  Widget build(BuildContext context) {
    return isLoadingPage
        ? Expanded(
            child: Center(child: CircularProgressIndicator()),
          )
        // Expanded(
        //     child: Center(
        //       child: Image.asset(
        //         "assets/loader.gif",
        //       ),
        //     ),
        //   )
        //  Image.network("https://media.tenor.com/G7RCgbI7ypMAAAAd/airplane-dancing.gif")
        : Expanded(
            child: ListView(
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
        widget.airportList.isEmpty
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text("Something went wrong please go back and try again", style: TextStyle(fontSize: 15, color: Colors.red)),
              )
            : SizedBox(),
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
          child: AbsorbPointer(
            absorbing: isLoadingPage,
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

                if (oneWay || roundTrip) {
                  onwardSector.origin = originCode;
                  onwardSector.origincountry = originCountry;
                  onwardSector.destination = destinationCode;
                  onwardSector.destinationcountry = destinationCountry;
                  onwardSector.departureDate = departureDateReq;
                  onwardSector.tripmode = "O";
                  searchReq.objsectorlist?.add(onwardSector);
                  travelType = "O";
                }

                if (roundTrip) {
                  Objsectorlist returnSector = Objsectorlist();
                  returnSector.origin = destinationCode;
                  returnSector.origincountry = destinationCountry;
                  returnSector.destination = originCode;
                  returnSector.destinationcountry = originCountry;
                  returnSector.departureDate = returnDateReq;
                  returnSector.tripmode = "R";

                  travelType = "R";

                  searchReq.objsectorlist?.add(returnSector);
                }

                print(searchReq);
                print(internationalTrip);
                if (originCountry != "IN" || destinationCountry != "IN") {
                  searchReq.traveltype = "I";
                  internationalTrip = true;
                  print("If statement works");
                } else {
                  searchReq.traveltype = "D";

                  internationalTrip = false;
                  print("else statement works");
                }
                print(internationalTrip);

                if (showDepTypeField && showArrTypeField && departure != '' && arrival != '') {
                  setState(() {});
                  final connectivityResult = await Connectivity().checkConnectivity();

                  if (connectivityResult == ConnectivityResult.none) {
                    Navigator.of(context).pushNamed('/NoConnection');
                  } else {
                    isLoadingPage = true;
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
                                "airportList": widget.airportList,
                                "ModifyData": ModifyData(
                                  oneWay: oneWay,
                                  roundTrip: roundTrip,
                                  multiCity: multiCity,
                                  economy: economy,
                                  premiumEconomy: premiumEconomy,
                                  businessClass: businessClass,
                                  firstClass: firstClass,
                                  departureDate: departureDate,
                                  departureDateReq: departureDateReq ?? '',
                                  departureController: departureController,
                                  arrivalController: arrivalController,
                                  departureDateController: departureDateController,
                                  returnDateController: returnDateController,
                                  passengerController: passengerController,
                                  classController: classController,
                                  deptAirportName: deptAirportName,
                                  arrAirportName: arrAirportName,
                                  departure: departure,
                                  arrival: arrival,
                                  travelClass: travelClass,
                                  travelType: travelType,
                                  internationalTrip: internationalTrip,
                                  adultCount: adultCount,
                                  childCount: childCount,
                                  infantCount: infantCount,
                                  totalPassengerCount: totalPassengerCount,
                                  originCode: originCode,
                                  originCountry: originCountry,
                                  destinationCode: destinationCode,
                                  destinationCountry: destinationCountry,
                                  returnDate: returnDate,
                                  isLoadingPage: isLoadingPage,
                                  returnDateReq: returnDateReq,
                                ),
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
                              "airportList": widget.airportList,
                            }.toString() +
                            "  => Passing combinedRoundTrip");
                        data.status != null && data.status!
                            ? Navigator.of(context).pushNamed('/FlightSearchResult', arguments: {
                                "data": data,
                                "tripType": travelType,
                                "airportList": widget.airportList,
                                "internationalTrip": true,
                                "ModifyData": ModifyData(
                                  oneWay: oneWay,
                                  roundTrip: roundTrip,
                                  multiCity: multiCity,
                                  economy: economy,
                                  premiumEconomy: premiumEconomy,
                                  businessClass: businessClass,
                                  firstClass: firstClass,
                                  departureDate: departureDate,
                                  departureDateReq: departureDateReq ?? '',
                                  departureController: departureController,
                                  arrivalController: arrivalController,
                                  departureDateController: departureDateController,
                                  returnDateController: returnDateController,
                                  passengerController: passengerController,
                                  classController: classController,
                                  deptAirportName: deptAirportName,
                                  arrAirportName: arrAirportName,
                                  departure: departure,
                                  arrival: arrival,
                                  travelClass: travelClass,
                                  travelType: travelType,
                                  internationalTrip: internationalTrip,
                                  adultCount: adultCount,
                                  childCount: childCount,
                                  infantCount: infantCount,
                                  totalPassengerCount: totalPassengerCount,
                                  originCode: originCode,
                                  originCountry: originCountry,
                                  destinationCode: destinationCode,
                                  destinationCountry: destinationCountry,
                                  returnDate: returnDate,
                                  isLoadingPage: isLoadingPage,
                                  returnDateReq: returnDateReq,
                                ),
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
                              "airportList": widget.airportList,
                            }.toString() +
                            "  => Passing individualRoundTrip");
                        data.status != null && data.status!
                            ? Navigator.of(context).pushNamed('/FlightSearchResult', arguments: {
                                "data": data,
                                "tripType": travelType,
                                "airportList": widget.airportList,
                                "internationalTrip": false,
                                "ModifyData": ModifyData(
                                  oneWay: oneWay,
                                  roundTrip: roundTrip,
                                  multiCity: multiCity,
                                  economy: economy,
                                  premiumEconomy: premiumEconomy,
                                  businessClass: businessClass,
                                  firstClass: firstClass,
                                  departureDate: departureDate,
                                  departureDateReq: departureDateReq ?? '',
                                  departureController: departureController,
                                  arrivalController: arrivalController,
                                  departureDateController: departureDateController,
                                  returnDateController: returnDateController,
                                  passengerController: passengerController,
                                  classController: classController,
                                  deptAirportName: deptAirportName,
                                  arrAirportName: arrAirportName,
                                  departure: departure,
                                  arrival: arrival,
                                  travelClass: travelClass,
                                  travelType: travelType,
                                  internationalTrip: internationalTrip,
                                  adultCount: adultCount,
                                  childCount: childCount,
                                  infantCount: infantCount,
                                  totalPassengerCount: totalPassengerCount,
                                  originCode: originCode,
                                  originCountry: originCountry,
                                  destinationCode: destinationCode,
                                  destinationCountry: destinationCountry,
                                  returnDate: returnDate,
                                  isLoadingPage: isLoadingPage,
                                  returnDateReq: returnDateReq,
                                ),
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
                                "airportList": widget.airportList,
                              }).then((value) {
                                // isLoadingPage = false;
                                // setState(() {});
                              })
                            : Helper().toastMessage(value?.responseMessage ?? "Try Again");
                      });
                    }
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
                  initialDate: departureDate /* .subtract(const Duration(days: 30)) */, //get today's date
                  firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                departureDate = pickedFromDate ?? DateTime.now();
                returnDateController.text = '';
                returnDate = departureDate;
                pickedFromDate != null ? departureDateReq = "${pickedFromDate.year}-${pickedFromDate.month.toString().padLeft(2, '0')}-${pickedFromDate.day.toString().padLeft(2, '0')}" : '';
                departureDateController.text = DateFormat('dd MMM yyyy').format(pickedFromDate ?? DateTime.now());
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
                      currentDate: departureDate,
                      initialDate: returnDate ?? departureDate, //get today's date
                      firstDate: departureDate, //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    pickedDate != null ? returnDateReq = "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}" : '';
                    returnDate = pickedDate;
                    returnDateController.text = DateFormat('dd MMM yyyy').format(pickedDate ?? departureDate);

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
                    hideSuggestionsOnKeyboardHide: false,
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
                    noItemsFoundBuilder: (context) => SizedBox(
                          height: 80,
                          child: Center(child: Text(dropDownErrorData)),
                        ),
                    onSuggestionSelected: (suggestion) {
                      originCode = suggestion.code ?? '';
                      originCountry = suggestion.countryCode ?? '';
                      departureController.text = "${suggestion.cityName?.toUpperCase() ?? ''} - ${suggestion.code?.toUpperCase() ?? ''}";
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
                  hideSuggestionsOnKeyboardHide: false,
                  debounceDuration: const Duration(milliseconds: 500),
                  suggestionsCallback: (query) async => getList(query),
                  itemBuilder: (context, itemData) => ListTile(
                        title: Text("${itemData.cityName?.toUpperCase() ?? ''} - ${itemData.code?.toUpperCase() ?? ''}"),
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
                  noItemsFoundBuilder: (context) => SizedBox(
                        height: 80,
                        child: Center(child: Text(dropDownErrorData)),
                      ),
                  onSuggestionSelected: (suggestion) {
                    destinationCode = suggestion.code ?? '';
                    destinationCountry = suggestion.countryCode ?? '';
                    arrivalController.text = "${suggestion.cityName?.toUpperCase() ?? ''} - ${suggestion.code?.toUpperCase() ?? ''}";
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

                    final tempCode = destinationCode;
                    destinationCode = originCode;
                    originCode = tempCode;

                    final tempCountry = destinationCountry;
                    destinationCountry = originCountry;
                    originCountry = tempCountry;

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
      final codeList = widget.airportList.where((element) => element.code!.toLowerCase().contains(query.trim().toLowerCase())).toList();
      filteredFlights.addAll(codeList);

      dev.log("cityCodeList ++++$codeList");

      final cityCodeList = widget.airportList.where((element) => element.cityCode!.toLowerCase().contains(query.trim().toLowerCase())).toList();
      filteredFlights.addAll(cityCodeList);

      dev.log("cityCodeList ++++$cityCodeList");

      final cityNameList = widget.airportList.where((element) => element.cityName!.toLowerCase().contains(query.trim().toLowerCase())).toList();
      filteredFlights.addAll(cityNameList);
      dev.log("cityNameList ++++$cityNameList");
      final airportNameList = widget.airportList.where((element) => element.airportName!.toLowerCase().contains(query.trim().toLowerCase())).toList();
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
