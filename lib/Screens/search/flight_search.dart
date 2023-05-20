import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/search_widgets.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/error.dart';

import '../../data/model/Search/flight_search_model.dart';

class ScreenFlightSearchResult extends StatelessWidget {
  //ScreenFlightSearchResult({super.key});
  AirlineSearchResponse airlineSearchResponse = const AirlineSearchResponse();
  IRAirlineSearchResponse irAirlineSearchResponse = const IRAirlineSearchResponse();
  RAirlineSearchResponse rAirlineSearchResponse = const RAirlineSearchResponse();
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
      log(travelType);
      airlineSearchResponse = arguments["data"];
      log(airlineSearchResponse.toString());

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
        log(travelType + "c");

        rAirlineSearchResponse = arguments["data"];
        log(rAirlineSearchResponse.toString());

        return ((rAirlineSearchResponse.status ?? false) && (rAirlineSearchResponse.objItinList ?? []).isNotEmpty)
            ? Scaffold(
                backgroundColor: white,
                appBar: AppBar(
                  toolbarHeight: 80,
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
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(children: [
                              Text(
                                "BOM", // '${data.origin ?? "N/A"}\t',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                                size: 20,
                              ),
                              Text(
                                "CCJ", //  '\t${data.destination ?? "N/A"}',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                            ]),
                            Text(
                              "12 apr", //   '\t${data.departureDate ?? "Date"}',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                            Text(
                              "12 Travellers", //  " [\t${data.passengers ?? "0"} Traveller]",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(children: [
                              Text(
                                "BOM", // '${data.origin ?? "N/A"}\t',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                                size: 20,
                              ),
                              Text(
                                "CCJ", //  '\t${data.destination ?? "N/A"}',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                            ]),
                            Text(
                              "12 apr", //   '\t${data.departureDate ?? "Date"}',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                            Text(
                              "Premium economy", //    data.airlineClass ?? "Premium economy",
                              style: TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //  flightSearchAppBar(context, data),
                body: SafeArea(
                  child: Expanded(child: FlightFareCardListView(combainedRoundData: rAirlineSearchResponse.objItinList, travelType: travelType, internationalTrip: internationalTrip)),
                ),
              )
            : const ErrorPage();
      } else {
        log(travelType + "I");

        irAirlineSearchResponse = arguments["data"];
        log(irAirlineSearchResponse.toString());
        return Scaffold(
          //    backgroundColor: secondaryColor,
          appBar: AppBar(),
          // flightSearchAppBar(context, ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            label: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 20),
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column();
                },
              );
            },
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      decoration: const BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("DEL", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w600)),
                              Icon(Icons.arrow_forward, color: white),
                              Text("HYD", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Text("15 April", style: TextStyle(color: white, fontSize: 17, fontWeight: FontWeight.w500)),
                        ],
                      )),
                  Container(
                      decoration: const BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.all(Radius.circular(5))),
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("DEL", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w600)),
                              Icon(Icons.arrow_forward, color: white),
                              Text("HYD", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Text("15 April", style: TextStyle(color: white, fontSize: 17, fontWeight: FontWeight.w500)),
                        ],
                      )),
                ],
              ),
              const Divider(),
              Expanded(
                  child: FlightFareCardListView(
                onwardList: irAirlineSearchResponse.objItinList,
                returnList: irAirlineSearchResponse.objItinListR,
                travelType: travelType,
                internationalTrip: false,
              )),
            ],
          ),
        );
      }
    } else {
      airlineSearchResponse = arguments["data"];
      // AirlineSearchResponse data = AirlineSearchResponse();
      return const ErrorPage();
      /*    const Scaffold(
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
            Divider(),
            //  Expanded(child: FlightFareCardListView(data: data.objItinList ?? [])),
          ],
        ),
      );
    */
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
  int selectedIndexOnward = -1;
  int selectedIndexReturn = -1;

  String fareRuleValue = "Saver";

  bool flightDetails = false;

  @override
  Widget build(BuildContext context) {
    if (widget.travelType == "O") {
      return ListView.builder(
          itemCount: widget.data?.length ?? 0,
          itemBuilder: (context, index) {
            bool isSelected = selectedIdx == index;
            return oneWayWidget(context: context, data: widget.data?[index], index: index, isSelected: isSelected);
          });
    } else if (widget.travelType == "R" && widget.internationalTrip) {
      return ListView.builder(
          itemCount: widget.combainedRoundData?.length ?? 0,
          itemBuilder: (context, index) {
            bool isSelected = selectedIdx == index;
            return combainedRoundTripWidget(context, widget.combainedRoundData?[index], isSelected, index);
          });
    } else if (widget.travelType == "R" && !widget.internationalTrip) {
      return Row(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: ListView.builder(
                  itemCount: widget.onwardList?.length ?? 0,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndexOnward == index;

                    return individualRoundTripWidget(context, widget.onwardList?[index], isSelected, index, onward: true);
                  })),
          SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: ListView.builder(
                  itemCount: widget.returnList?.length ?? 0,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndexReturn == index;
                    return individualRoundTripWidget(context, widget.returnList?[index], isSelected, index, onward: false);
                  })),
        ],
      );
    } else {
      return const Text("No data");
    }
  }
  //TODO: induvidual round trip design

  individualRoundTripWidget(BuildContext context, Apisearchresponse? data, bool isSelected, int index, {required bool onward}) {
    return InkWell(
        onTap: () {
          if (onward) {
            selectedIndexOnward = isSelected ? -1 : index;
          } else {
            selectedIndexReturn = isSelected ? -1 : index;
          }
          setState(() {});
        },
        child: Container(
          // color: isSelected ? Colors.blueGrey.shade200 : white,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: isSelected ? Border.all(color: primaryColor, width: 2) : null,
            boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.25), offset: Offset(0, 1), blurRadius: 1)],
          ),

          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      child: Image.network(
                        "https://agents.alhind.com/images/logos/${data?.airlineCode ?? ''}.gif",
                        /*${data.airlineName}.*/
                        width: 40,
                        fit: BoxFit.fitHeight,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text("No logo");
                        },
                      ),
                    ),
                  ),
                  Text(
                    data?.airlineName ?? "Air india",
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(data?.departureTime ?? '32:22', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                          Text(data?.duration ?? ' hr min', style: const TextStyle(fontSize: 11)),
                        ],
                      ),
                      Icon(Icons.arrow_forward, size: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(data?.arrivalTime ?? '32:22', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                          Text(
                            data?.noofStop != 0 && data?.noofStop != null ? "${data?.noofStop} stop" : 'Non-stop',
                            style: const TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "₹${data?.netAmount ?? '736t#'}",
                          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                        // (data?.pricngList?.length ?? 0) >
                        0 < 1
                            ? InkWell(
                                onTap: () {
                                  selectedIdx = isSelected ? -1 : index;
                                  flightDetails = false;
                                  setState(() {});
                                },
                                child: Text(
                                  "More Fares",
                                  style: TextStyle(color: primaryColor, fontSize: 12),
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

/* Text(
        data?.airlineName ?? '',
        style: TextStyle(color: isSelected ? primaryColor : secondaryColor),
      ), */
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
                            /*  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                child: Image.network(
                                  "https://agents.alhind.com/images/logos/${data?.airlineCode??""}.gif",
                                  /*${data.airlineName}.*/
                                  height: 30,
                                  fit: BoxFit.fitHeight,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Text("No logo");
                                  },
                                ),
                              ),
                            ), */
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
                            /* Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                child: Image.network(
                                  "https://agents.alhind.com/images/logos/${data?.airlineCode??""}.gif",
                                  /*${data.airlineName}.*/
                                  height: 30,
                                  fit: BoxFit.fitHeight,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Text("No logo");
                                  },
                                ),
                              ),
                            ), */
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
                        (data?.pricingList?.length ?? 0) > 1
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
                child: flightDetails ? moreDetails(context) : morePrice(context, data?.pricingList),
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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Delhi-Hyderabad"), Text("March 12 2023")],
            ),
          ),
          Text("Flight Information".toUpperCase(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /*  Image.network(
                  "https://agents.alhind.com/images/logos/${data?.airlineCode??""}.gif",
                  /*${data.airlineName}.*/
                  height: 25,
                  fit: BoxFit.fitHeight,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text("No logo");
                  },
                ), */
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.business_center_outlined),
                      Text("\t7KG"),
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Icon(Icons.luggage_outlined),
                    Text("\t30KG"),
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text("12 Mar wednesday"),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 3, child: const Text("Indira ghandi international airport", maxLines: 2, softWrap: true)),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text("New Delhi"),
                  ),
                ],
              ),
              const Column(
                children: [
                  Icon(Icons.access_time_rounded, size: 40),
                  Text("2 h 12 min"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bom 12:56".toUpperCase(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text("12 Mar wednesday"),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: const Text(
                      "Indira ghandi international airport",
                      maxLines: 2,
                      softWrap: true,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text("New Delhi"),
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
                                    "https://agents.alhind.com/images/logos/${data?.airlineCode ?? ''}.gif",
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
                    : morePrice(context, data?.pricngList),
              )
            // TODO : Flight Details
            : const SizedBox(),
      ],
    );
  }

  morePrice(BuildContext context, List<PricingBasic>? data) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: data?.length ?? 0,
        itemBuilder: (context, index) {
          final value = data?[index];
          return Container(
            margin: const EdgeInsets.all(8),
            color: white,
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                InkWell(
                  onTap: () {
                    fareRuleValue = value?.fareName ?? '';
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Text(value?.fareName ?? ''),
                      Text("${value?.netAmount ?? 0}"),
                    ],
                  ),
                ),
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
              fareRuleValue == value?.fareName ? fareRule(context, value) : const SizedBox(),
            ]),
          );
        },
      ),
    );
  }

  /* Column moreFare(BuildContext context, List<PricingBasic>? data) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.all(8),
        color: white,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () {
                fareRuleValue = '';
                setState(() {});
              },
              child: Row(
                children: [
                  Text("Saver"),
                  Text('#45010'),
                ],
              ),
            ),
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
 */
  Column fareRule(BuildContext context, PricingBasic? data) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.business_center),
                    ),
                    Text("Cabin Bag"),
                  ],
                )),
            SizedBox(width: MediaQuery.of(context).size.width / 2 - 20, child: Text(data?.cabinBaggage ?? '')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.luggage_outlined),
                    ),
                    Text("Check-in"),
                  ],
                )),
            SizedBox(width: MediaQuery.of(context).size.width / 2 - 20, child: Text(data?.checkinBaggage ?? '')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.restaurant),
                    ),
                    Text("Meal"),
                  ],
                )),
            SizedBox(width: MediaQuery.of(context).size.width / 2 - 20, child: Text(data?.meal ?? '')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.airline_seat_recline_extra),
                    ),
                    Text("Seat"),
                  ],
                )),
            SizedBox(width: MediaQuery.of(context).size.width / 2 - 20, child: Text(data?.seat ?? '')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.published_with_changes_sharp),
                    ),
                    Text("Cancellation"),
                  ],
                )),
            SizedBox(width: MediaQuery.of(context).size.width / 2 - 20, child: Text(data?.cancellation ?? '', maxLines: 2)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.calendar_month_outlined),
                    ),
                    Text("Date Change"),
                  ],
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Text(
                  data?.dateChange ?? '',
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
