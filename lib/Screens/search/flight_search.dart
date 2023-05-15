import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/search_widgets.dart';

import '../../data/model/Search/flight_search_model.dart';
import '../widgets/error.dart';

class ScreenFlightSearchResult extends StatelessWidget {
  //ScreenFlightSearchResult({super.key});
  AirlineSearchResponse airlineSearchResponse = AirlineSearchResponse();
  IRAirlineSearchResponse irAirlineSearchResponse = IRAirlineSearchResponse();
  RAirlineSearchResponse rAirlineSearchResponse = RAirlineSearchResponse();
  late String travelType;
  late bool internationalTrip;

  late Map<String, dynamic> arguments;
  @override
  Widget build(BuildContext context) {
    // try {
    arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    travelType = arguments["tripType"];
    var internationalTrip = arguments["internationalTrip"];
    //  log(internationalTrip);
    if (travelType == "O") {
      airlineSearchResponse = arguments["data"];
      return Scaffold(
        backgroundColor: white,
        appBar: flightSearchAppBar(context, airlineSearchResponse),
        body: Column(
          children: [
            fareOnDateListView(context, airlineSearchResponse.objlowfareList ?? []),
            const Divider(),
            Expanded(child: FlightFareCardListView(data: airlineSearchResponse.objItinList ?? [], travelType: travelType)),
          ],
        ),
      );
    } else if (travelType == "R") {
      if (internationalTrip) {
        rAirlineSearchResponse = arguments["data"];
        rAirlineSearchResponse.objItinList;
        return Scaffold(
          backgroundColor: white,
          //    appBar: flightSearchAppBar(context, data),
          body: Column(
            children: [
              const Divider(),
              Expanded(child: FlightFareCardListView(combainedRoundData: rAirlineSearchResponse.objItinList ?? [], travelType: travelType, internationalTrip: internationalTrip)),
            ],
          ),
        );
      } else {
        irAirlineSearchResponse = arguments["data"];
        return Scaffold(
          backgroundColor: white,
          //   appBar: flightSearchAppBar(context, data),

          //TODO: induvidual round trip design
          body: Column(
            children: [
              const Divider(),
              Expanded(
                  child: FlightFareCardListView(
                onwardList: irAirlineSearchResponse.objItinList,
                returnList: irAirlineSearchResponse.objItinListR,
                travelType: travelType,
              )),
            ],
          ),
        );
      }
    } else {
      airlineSearchResponse = arguments["data"];
      // AirlineSearchResponse data = AirlineSearchResponse();
      return Scaffold(
        backgroundColor: Colors.green,
        //  appBar: flightSearchAppBar(context, data),
        // bottomNavigationBar: BottomNavigationBar(backgroundColor: const Color.fromARGB(255, 221, 227, 234), fixedColor: Colors.black, items: const [
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.filter_alt, color: Colors.black),
        //     label: "Filter",
        //   ),
        //   BottomNavigationBarItem(icon: Icon(Icons.toggle_off, color: Colors.black), label: "Filter", backgroundColor: Colors.black),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.schedule, color: Colors.black),
        //     label: "Filter",
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.airlines, color: Colors.black),
        //     label: "Filter",
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.sort, color: Colors.black),
        //     label: "Filter",
        //   )
        // ]),

        body: Column(
          children: [
            // fareOnDateListView(context, data.objlowfareList ?? []),
            const Divider(),
            //  Expanded(child: FlightFareCardListView(data: data.objItinList ?? [])),
          ],
        ),
      );
    }
    // } catch (e) {
    // log(e.toString());
    //   throw Exception();
    // }
    // return const ErrorPage();
  }

  SizedBox fareOnDateListView(BuildContext context, List<LowestFare> data) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 4.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${data[index].date}",
                ),
                Text(
                  "₹${data[index].amount}",
                  style: const TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const VerticalDivider(
            thickness: 1,
          );
        },
      ),
    );
  }
}

class _FlightFareCardListViewState extends State<FlightFareCardListView> {
  //bool showDetails = false;
  int selectedIdx = -1;

  String fareRuleValue = "Saver";

  bool flightDetails = false;

  @override
  Widget build(BuildContext context) {
    final val = widget.data;
    final roundTripVal = widget.combainedRoundData;
    return ListView.builder(
      itemCount: val?.length ?? 0,
      itemBuilder: (context, index) {
        bool isSelected = selectedIdx == index;
        if (widget.travelType == "O") {
          return oneWayWidget(context: context, data: val?[index], index: index, isSelected: isSelected);
        } else if (widget.travelType == "R" && widget.internationalTrip) {
          return combainedRoundTripWidget(context, roundTripVal?[index], isSelected, index);
        }
      },
    );
  }

  Column combainedRoundTripWidget(BuildContext context, RApisearchresponse? data, bool isSelected, int index) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(10)),
          //     height: 170,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 3 / 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /* logo  */ Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                child: Image.network(
                                  "https://agents.alhind.com/images/logos/6E.gif",
                                  /*${data.airlineName}.*/
                                  height: 30,
                                  fit: BoxFit.fitHeight,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Text("No logo");
                                  },
                                ),
                              ),
                            ),
                            Text(
                              data?.onwardDetails?.airlineName ?? "______",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        /* flight time  */ Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Text(
                                      data?.onwardDetails?.origin ?? 'DEL',
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  Text(data?.onwardDetails?.departureTime ?? '11:11', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Column(
                                  children: [
                                    Text(
                                      data?.onwardDetails?.duration ?? '2 hr',
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Stack(
                                        children: [
                                          const Divider(
                                            thickness: 2,
                                            color: primaryColor,
                                          ),
                                          data?.onwardDetails?.noofStop != 0 && data?.onwardDetails?.noofStop != null
                                              ? const Center(
                                                  child: Icon(
                                                    Icons.circle,
                                                    size: 15,
                                                    color: secondaryColor,
                                                  ),
                                                )
                                              : const SizedBox()
                                        ],
                                      ),
                                    ),
                                    Text(
                                      data?.onwardDetails?.noofStop != 0 && data?.onwardDetails?.noofStop != null ? "${data?.onwardDetails?.noofStop} stop" : 'Non-stop',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Text(
                                      data?.onwardDetails?.destination ?? 'DOH',
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  Text(data?.onwardDetails?.arrivalTime ?? '22:22', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        /* baggage and more */ Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 12.0),
                            //   child: Text(
                            //     "2hr Layover at Mumbai",
                            //     style: TextStyle(color: primaryColor),
                            //   ),
                            // ),
                            Row(
                              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.luggage_outlined,
                                    color: Colors.grey.shade600,
                                    size: 20,
                                  ),
                                  Text(data?.onwardDetails?.freeBaggage ?? "N/A")
                                ]),
                                TextButton.icon(
                                    onPressed: () {
                                      selectedIdx = isSelected ? -1 : index;
                                      flightDetails = true;
                                      setState(() {});
                                    },
                                    label: Icon(!isSelected ? Icons.keyboard_arrow_down_outlined : Icons.keyboard_arrow_up_outlined),
                                    icon: const Text("Flight Details"))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 3 / 5,
                      child: const Divider(
                        thickness: 2,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          //    mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                child: Image.network(
                                  "https://agents.alhind.com/images/logos/ai.gif",
                                  /*${data.airlineName}.*/
                                  height: 30,
                                  fit: BoxFit.fitHeight,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Text("No logo");
                                  },
                                ),
                              ),
                            ),
                            Text(
                              data?.returnDetails?.airlineName ?? "Flight Name",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Text(
                                      data?.returnDetails?.origin ?? 'DEL',
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  Text(data?.returnDetails?.departureTime ?? '11:11', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Column(
                                  children: [
                                    Text(
                                      data?.returnDetails?.duration ?? '2 hr',
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Stack(
                                        children: [
                                          const Divider(
                                            thickness: 2,
                                            color: primaryColor,
                                          ),
                                          data?.returnDetails?.noofStop != 0 && data?.returnDetails?.noofStop != null
                                              ? const Center(
                                                  child: Icon(
                                                    Icons.circle,
                                                    size: 15,
                                                    color: secondaryColor,
                                                  ),
                                                )
                                              : const SizedBox()
                                        ],
                                      ),
                                    ),
                                    Text(
                                      data?.returnDetails?.noofStop != 0 && data?.returnDetails?.noofStop != null ? "${data?.returnDetails?.noofStop} stop" : 'Non-stop',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Text(
                                      data?.returnDetails?.destination ?? 'DOH',
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  Text(data?.returnDetails?.arrivalTime ?? '22:22', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        /* baggage and more */ Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 12.0),
                            //   child: Text(
                            //     "2hr Layover at Mumbai",
                            //     style: TextStyle(color: primaryColor),
                            //   ),
                            // ),
                            Row(
                              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.luggage_outlined,
                                    color: Colors.grey.shade600,
                                    size: 20,
                                  ),
                                  Text(data?.returnDetails?.freeBaggage ?? "N/A")
                                ]),
                                TextButton.icon(
                                    onPressed: () {
                                      selectedIdx = isSelected ? -1 : index;
                                      flightDetails = true;
                                      setState(() {});
                                    },
                                    label: Icon(!isSelected ? Icons.keyboard_arrow_down_outlined : Icons.keyboard_arrow_up_outlined),
                                    icon: const Text("Flight Details"))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "₹${data?.returnDetails?.netAmount ?? '736t#'}",
                          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w700, fontSize: 22),
                        ),
                        (data?.returnDetails?.pricngList?.length ?? 0) > 1
                            ? InkWell(
                                onTap: () {
                                  selectedIdx = isSelected ? -1 : index;
                                  flightDetails = false;
                                  setState(() {});
                                },
                                child: const Text(
                                  "More Fares",
                                  style: TextStyle(color: primaryColor),
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14),
                      child: Text(
                        "Book",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      //   fixedSize: Size(, 50),
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        isSelected
            ? Container(
                margin: const EdgeInsets.all(10),
                color: const Color.fromARGB(87, 156, 172, 192),
                child: flightDetails ? moreDetails(context) : moreFare(context),
              )
            // TODO : Flight Details
            : const SizedBox(),
      ],
    );
  }

  Padding moreDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Flight Details".toUpperCase(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Delhi-Hyderabad"), const Text("March 12 2023")],
            ),
          ),
          Text("Flight Information".toUpperCase(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "https://agents.alhind.com/images/logos/ai.gif",
                  /*${data.airlineName}.*/
                  height: 25,
                  fit: BoxFit.fitHeight,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text("No logo");
                  },
                ),
                const Text(
                  "\t Mar 12 2023",
                  maxLines: 2,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.circle, size: 10),
                ),
                const Text(
                  "Premium Economy",
                  maxLines: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.business_center_outlined),
                      const Text("\t7KG"),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.luggage_outlined),
                    const Text("\t30KG"),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Del 08:56".toUpperCase(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: const Text("12 Mar wednesday"),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 3, child: const Text("Indira ghandi international airport", maxLines: 2, softWrap: true)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: const Text("New Delhi"),
                  ),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.access_time_rounded, size: 40),
                  const Text("2 h 12 min"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bom 12:56".toUpperCase(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: const Text("12 Mar wednesday"),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Text(
                      "Indira ghandi international airport",
                      maxLines: 2,
                      softWrap: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: const Text("New Delhi"),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Column oneWayWidget({required Apisearchresponse? data, required bool isSelected, required int index, required BuildContext context}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(
            10,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(10)),
          //     height: 170,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  child: Image.network(
                                    "https://agents.alhind.com/images/logos/g9.gif",
                                    /*${data.airlineName}.*/
                                    height: 40,
                                    fit: BoxFit.fitHeight,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Text("No logo");
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                data?.airlineName ?? "Air india",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.airline_seat_recline_extra),
                              Text(
                                "${data?.noofSeat ?? 16} Seats",
                                style: const TextStyle(fontSize: 18),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: SizedBox(
                                //         width: MediaQuery.of(context).size.width / 2.5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 4.0),
                                          child: Text(
                                            data?.origin ?? 'DEL',
                                            style: const TextStyle(fontSize: 17),
                                          ),
                                        ),
                                        Text(data?.departureTime ?? '11:11', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            data?.duration ?? '2 hr',
                                          ),
                                          SizedBox(
                                            width: 40,
                                            child: Stack(
                                              children: [
                                                const Divider(
                                                  thickness: 2,
                                                  color: primaryColor,
                                                ),
                                                data?.noofStop != 0 && data?.noofStop != null
                                                    ? const Center(
                                                        child: Icon(
                                                          Icons.circle,
                                                          size: 15,
                                                          color: secondaryColor,
                                                        ),
                                                      )
                                                    : const SizedBox()
                                              ],
                                            ),
                                          ),
                                          Text(
                                            data?.noofStop != 0 && data?.noofStop != null ? "${data?.noofStop} stop" : 'Non-stop',
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 4.0),
                                          child: Text(
                                            data?.destination ?? 'DOH',
                                            style: const TextStyle(fontSize: 17),
                                          ),
                                        ),
                                        Text(data?.arrivalTime ?? '22:22', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "₹${data?.netAmount ?? '736t#'}",
                                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w700, fontSize: 24),
                              ),
                              (data?.pricngList?.length ?? 0) > 1
                                  ? InkWell(
                                      onTap: () {
                                        selectedIdx = isSelected ? -1 : index;
                                        flightDetails = false;
                                        setState(() {});
                                      },
                                      child: const Text(
                                        "More Fares",
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text("Book"),
                          ),
                          style: ElevatedButton.styleFrom(
                            //   fixedSize: Size(, 50),
                            backgroundColor: secondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Text(
                            "2hr Layover at Mumbai",
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                        Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Icon(
                                Icons.luggage_outlined,
                                color: Colors.grey.shade600,
                                size: 20,
                              ),
                              Text(data?.freeBaggage ?? "N/A")
                            ]),
                            TextButton.icon(
                                onPressed: () {
                                  selectedIdx = isSelected ? -1 : index;
                                  flightDetails = true;
                                  setState(() {});
                                },
                                label: Icon(!isSelected ? Icons.keyboard_arrow_down_outlined : Icons.keyboard_arrow_up_outlined),
                                icon: const Text("Flight Details"))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        isSelected
            ? Container(
                color: const Color.fromARGB(87, 156, 172, 192),
                child: flightDetails
                    ? const SizedBox() /* Column(
                        children: [Text("Flight Details")],
                      ) */
                    : moreFare(context),
              )
            // TODO : Flight Details
            : const SizedBox(),
      ],
    );
  }

  Column moreFare(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.all(8),
        color: white,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Radio(
                    activeColor: secondaryColor,
                    value: "Saver",
                    groupValue: fareRuleValue,
                    onChanged: (value) {
                      fareRuleValue = value ?? "";
                      setState(() {});
                    }),
                const Text("Saver"),
              ],
            ),
            const Text('#45010'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/ReviewFlight');
                },
                child: const Text("Select"),
              ),
            )
          ]),
          fareRuleValue == "Saver" ? fareRule(context, 10) : const SizedBox(),
        ]),
      ),
      Container(
        margin: const EdgeInsets.all(8),
        color: white,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Radio(
                    activeColor: secondaryColor,
                    value: "Flexi",
                    groupValue: fareRuleValue,
                    onChanged: (value) {
                      fareRuleValue = value ?? "";
                      setState(() {});
                    }),
                const Text("Flexi"),
              ],
            ),
            const Text('#65310'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/ReviewFlight');
                },
                child: const Text("Select"),
              ),
            )
          ]),
          fareRuleValue == "Flexi" ? fareRule(context, 20) : const SizedBox(),
        ]),
      ),
      Container(
        margin: const EdgeInsets.all(8),
        color: white,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Radio(
                    activeColor: secondaryColor,
                    value: "Flexi plus",
                    groupValue: fareRuleValue,
                    onChanged: (value) {
                      fareRuleValue = value ?? "";
                      setState(() {});
                    }),
                const Text("Flexi plus"),
              ],
            ),
            const Text('#45010'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/ReviewFlight');
                },
                child: const Text("Select"),
              ),
            )
          ]),
          fareRuleValue == "Flexi plus" ? fareRule(context, 30) : const SizedBox(),
        ]),
      )
    ]);
  }

  Column fareRule(BuildContext context, bagWeight) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.business_center),
                    ),
                    const Text("Cabin Bag"),
                  ],
                )),
            SizedBox(width: MediaQuery.of(context).size.width / 2 - 20, child: const Text("7 Kgs")),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.luggage_outlined),
                    ),
                    const Text("Check-in"),
                  ],
                )),
            SizedBox(width: MediaQuery.of(context).size.width / 2 - 20, child: Text("$bagWeight Kgs")),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.restaurant),
                    ),
                    const Text("Meal"),
                  ],
                )),
            SizedBox(width: MediaQuery.of(context).size.width / 2 - 20, child: const Text("7 Kgs")),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.airline_seat_recline_extra),
                    ),
                    const Text("Seat"),
                  ],
                )),
            SizedBox(width: MediaQuery.of(context).size.width / 2 - 20, child: const Text("7 Kgs")),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.published_with_changes_sharp),
                    ),
                    const Text("Cancellation"),
                  ],
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: const Text(
                  "7 Kgs",
                  maxLines: 2,
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.calendar_month_outlined),
                    ),
                    const Text("Date Change"),
                  ],
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: const Text(
                  "7 Kgs",
                  maxLines: 2,
                )),
          ],
        ),
      ],
    );
  }
}

class FlightFareCardListView extends StatefulWidget {
  late List<Apisearchresponse>? data;
  late List<Apisearchresponse>? onwardList;
  late List<Apisearchresponse>? returnList;
  late List<RApisearchresponse>? combainedRoundData;
  late bool internationalTrip;

  String travelType;

  FlightFareCardListView({this.data, this.combainedRoundData, required this.travelType, this.onwardList, this.returnList, this.internationalTrip = true});
  @override
  State<FlightFareCardListView> createState() => _FlightFareCardListViewState();
}
