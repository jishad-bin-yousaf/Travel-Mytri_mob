import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/bottom_navigation.dart';
import 'package:travel_mytri_mobile_v1/data/api.dart';
import 'package:travel_mytri_mobile_v1/data/model/hive_class_functions.dart';

import '../../data/model/My Trip/my_trips.dart';
import '../widgets/login_error.dart';
import '../widgets/print_pdf.dart';

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

  AirlineTicketHistoryResponse data = AirlineTicketHistoryResponse();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Token>(
      future: getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while waiting for the result
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Display an error message if the asynchronous operation fails
          return Text('Error: ${snapshot.error}');
        } else {
          return (snapshot.data?.isUser ?? false)
              ? Scaffold(
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
                                      selectedTrip == TripType.flights ? flightsTabView(true) : hotelTabView(true),
                                      selectedTrip == TripType.flights ? flightsTabView(false) : hotelTabView(false),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                )
              : Scaffold(
                  backgroundColor: Colors.grey.shade300,
                  bottomNavigationBar: const BottomNavigation(),
                  body: LoginErrorPage(),
                );
        }
      },
    );
  }

  Center hotelTabView(bool booked) => Center(
          child: Image.asset(
        "assets/images/comingsoon.gif",
        height: 200,
      ));

  flightsTabView(bool booked) {
    return FutureBuilder<AirlineTicketHistoryResponse?>(
      future: MyTripsApi().getDetails(request: booked ? "S" : "C"),
      builder: (context, snapshot) {
        //return Center(child: CircularProgressIndicator());
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while waiting for the result
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Display an error message if the asynchronous operation fails
          return Text('Error: ${snapshot.error}');
        } else {
          // The asynchronous operation completed successfully
          final data = snapshot.data ?? AirlineTicketHistoryResponse();
          if (((data.objAirlineTicketHistory ?? []).isNotEmpty)) {
            return ListView.builder(
              itemCount: data.objAirlineTicketHistory?.length ?? 0,
              itemBuilder: (context, index) {
                final value = data.objAirlineTicketHistory?[index];
                return InkWell(
                  onTap: () {
                    flightPopup(context, data.objAirlineTicketHistory?[index], data.statusType ?? '');
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Booking ID : ${value?.bookingReferenceId}",
                                      //   style: TextStyle(color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        "PNR : ${value?.airlinePnr}",
                                        //   style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Text((value?.bookingType ?? '') == "O" ? "OneWay" : "Round Trip", style: TextStyle(fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width / 2.5,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(value?.departureCity ?? '', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                        Icon(Icons.arrow_forward),
                                        Text(value?.arrivalCity ?? '', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                      ],
                                    ),
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
              },
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.grey.shade100,
              body: Center(
                child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/suitcase.png",
                      height: 150,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Looks empty!",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "You've no bookings. When you book a trip,\nyou will see your itinerary here.",
                        maxLines: 2,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
      },
    );
  }

  // flightsTabView(booked) {
  //   MyTripsApi().getDetails(request: booked ? "S" : "C").then((value) {
  //     data = value ?? AirlineTicketHistoryResponse();
  //     //  setState(() {});
  //   });
  //   return ListView.builder(
  //       itemCount: data.objAirlineTicketHistory?.length ?? 0,
  //       itemBuilder: (context, index) {
  //         final value = data.objAirlineTicketHistory?[index];
  //         return InkWell(
  //           onTap: () {
  //             flightPopup(context);
  //           },
  //           child: Container(
  //             margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //             decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(10)),
  //             height: 90,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Row(
  //                   children: [
  //                     /*      Padding(
  //                   padding: const EdgeInsets.only(
  //                     left: 5.0,
  //                     right: 20,
  //                   ),
  //                   child: ClipRRect(
  //                     child: Image.asset(
  //                       "assets/images/T21.png",
  //                       height: 60,
  //                       width: 60,
  //                     ),
  //                   ),
  //                 ),
  //                 */
  //                     Column(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Row(
  //                           children: [
  //                             Text(
  //                               "Booking ID : ${value?.bookingReferenceId}",
  //                               //   style: TextStyle(color: Colors.grey),
  //                             ),
  //                             Padding(
  //                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //                               child: Text(
  //                                 "PNR : ${value?.airlinePnr}",
  //                                 //   style: TextStyle(color: Colors.grey),
  //                               ),
  //                             ),
  //                             Text(value?.bookingType ?? '', style: TextStyle(fontWeight: FontWeight.w500)),
  //                           ],
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsets.all(5),
  //                           child: SizedBox(
  //                             width: MediaQuery.of(context).size.width / 2.5,
  //                             child: Row(
  //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Text("Calicut", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
  //                                 Icon(Icons.arrow_forward),
  //                                 Text("Sharjah", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                         /*                     SizedBox(
  //                       width: MediaQuery.of(context).size.width / 2.5,
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         children: [
  //                           Text(
  //                             "Indigo Airlines",
  //                             style: TextStyle(color: Colors.grey.shade700),
  //                           ),
  //                           Icon(
  //                             Icons.brightness_1,
  //                             size: 10,
  //                           ),
  //                           Text("6E 3435", style: TextStyle(fontWeight: FontWeight.w600)),
  //                         ],
  //                       ),
  //                     ),
  //    */
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 Icon(Icons.arrow_forward_ios, size: 30)
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  flightPopup(
    BuildContext context,
    AirlineTicketHistory? dataList,
    String statusType,
  ) {
    return showBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        dataList?.departureCity ?? "",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Icon(Icons.arrow_forward),
                      ),
                      Text(
                        dataList?.arrivalCity ?? "",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Card(
                    color: statusType == "S" ? Color.fromARGB(255, 23, 212, 9) : Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                      child: Text(statusType == "S" ? "Booked" : "Cancelled", style: TextStyle(color: white, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Booking ID : ${dataList?.bookingReferenceId ?? ''}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "PNR : ${dataList?.airlinePnr ?? ''}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 175 * (dataList?.objSegDetails?.length ?? 0).toDouble(),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemCount: dataList?.objSegDetails?.length ?? 0,
                itemBuilder: (context, i) {
                  final value = dataList?.objSegDetails?[i];
                  return Container(
                    //  margin: EdgeInsets.all(30),
                    //   decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade500), borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.network(
                                      "https://agents.alhind.com/images/logos/${value?.airlineCode ?? ''}.gif",
                                      /*${data.airlineName}.*/

                                      fit: BoxFit.fitHeight,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Text("No logo");
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        "${value?.airlineName ?? ""} ${value?.airlineCode ?? ""}",
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 15.0),
                                        child: Text(
                                          "Departure",
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Text(
                                        value?.departureDate ?? "",
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        value?.departureAirportDetails ?? "",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        "Terminal ${value?.departureTerminal ?? ""}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 70,
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
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Text(
                                        value?.arrivalDate ?? "",
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          value?.arrivalAirportDetails ?? "",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      Text(
                                        "Terminal ${value?.arrivalTerminal ?? ""}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
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
                separatorBuilder: (context, index) => Divider(),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Color.fromARGB(255, 226, 223, 223),
              height: 38 * (dataList?.objPaxDetails?.length ?? 0).toDouble(),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: dataList?.objPaxDetails?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 6.0, left: 8, top: 6),
                    child: Row(
                      children: [
                        Icon(Icons.person_2),
                        Text(dataList?.objPaxDetails?[index] ?? ''),
                      ],
                    ),
                  );
                },
              ),
            ),
            Divider(color: Colors.black87),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  "Total Amount : ₹ ${dataList?.TotalAmount ?? 0}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PDFViewerScreen(pdfUrl: "https://uattm.jameer.xyz/data/TravelMythri_E-Ticket.pdf"),
                    ));
                  },
                  child: Text("Print Ticket"),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder(), backgroundColor: secondaryColor),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Email Ticket"),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder(), backgroundColor: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Cancel Ticket"),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder(), backgroundColor: Colors.red),
                ),
              ],
            )
          ],
        );
      },
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
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
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
                          backgroundColor: MaterialStateProperty.all<Color>(isSelected ? white : Colors.transparent),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
