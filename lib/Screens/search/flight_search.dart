import 'dart:developer';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/filter/filter.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/review_flight.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/search_widgets.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/error.dart';

import '../../data/api.dart';
import '../../data/model/Search/flight_search_model.dart';
import '../../data/model/Search/pricing_models.dart';
import '../../data/model/utilities.dart';
import '../widgets/helper.dart';
import '../widgets/session_expired.dart';
import 'filter/filter_CRT.dart';
import 'search.dart';

class ScreenFlightSearchResult extends StatefulWidget {
  ScreenFlightSearchResult({super.key});

  @override
  State<ScreenFlightSearchResult> createState() => _ScreenFlightSearchResultState();
}

class _ScreenFlightSearchResultState extends State<ScreenFlightSearchResult> {
  //ScreenFlightSearchResult({super.key});
  late AirlineSearchResponse airlineSearchResponse; /* = AirlineSearchResponse();
 */
  IRAirlineSearchResponse irAirlineSearchResponse = IRAirlineSearchResponse();

  RAirlineSearchResponse rAirlineSearchResponse = RAirlineSearchResponse();

  late String travelType;

  late bool internationalTrip;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<ApiSearchResponse>? oneWayDuplicateData;
  List<RApisearchresponse>? crtDuplicateData;
  List<ApiSearchResponse>? irOnwardWayDuplicateData;
  List<ApiSearchResponse>? irReturnWayDuplicateData;
  late Map<String, dynamic> arguments;
  SelectedFilters? selectedFilters;
  SelectedFilters? irtOnwardSelectedFilters;
  SelectedFilters? irtReturnSelectedFilters;
  List<AirportData> airportList = [];
  bool irtOnwardShow = true;

  int indSelectedReturn = -1;
  int indSelectedOnward = -1;
  @override
  Widget build(BuildContext context) {
    // try {
    arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    travelType = arguments["tripType"];
    ModifyData modifyData = arguments["ModifyData"];
    var internationalTrip = arguments["internationalTrip"];
    airportList = arguments["airportList"];

    //  log(internationalTrip);

    if (travelType == "O") {
      log(travelType);
      airlineSearchResponse = arguments["data"] as AirlineSearchResponse;
      if (!(airlineSearchResponse.test ?? false)) {
        oneWayDuplicateData = airlineSearchResponse.objItinList?.where((element) => element.netAmount != 0).toList(); // Store the original data
        log(airlineSearchResponse.test.toString() + " if condition");
      }
      airlineSearchResponse.test = true;

      return WillPopScope(
        onWillPop: () {
          Navigator.popUntil(context, ModalRoute.withName('/flights'));
          return Future.value(true);
        },
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: white,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          drawer: FlightFilterDrawer(
            filterSelections: selectedFilters,
            airlineList: airlineSearchResponse.objAvlairlineList ?? [],
            itemList: airlineSearchResponse.objItinList ?? [],
            maximumFare: airlineSearchResponse.maximumFare,
            minimumFare: airlineSearchResponse.minimumFare,
            // Pass the original data to the drawer
            callBack: (responseData) {
              oneWayDuplicateData = responseData.datas;
              selectedFilters = responseData.filterSelections;
              setState(() {});
              log(responseData.datas.toString());
              log(responseData.datas.length.toString());
              print("Working");
            },
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: FloatingActionButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) {
                //     return FlightFilterDrawer(airlineSearchResponse: arguments["data"]);
                //   },
                // )).then((value) {
                //   airlineSearchResponse.objItinList = value;
                //   setState(() {});
                // });
              },
              child: const Icon(Icons.filter_alt_outlined),
            ),
          ),
          appBar: flightSearchAppBar(context, airlineSearchResponse, modifyData, airportList),
          body: Column(
            children: [
              fareOnDateListView(context, airlineSearchResponse.objlowfareList ?? []),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        oneWayDuplicateData?.sort((a, b) => (a.netAmount ?? 0).compareTo(b.netAmount ?? 0));
                      });
                    },
                    icon: const Icon(Icons.attach_money_outlined),
                    label: const Text("CHEAPEST"),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        oneWayDuplicateData?.sort((a, b) => (a.durationInMinutes ?? 0).compareTo(b.durationInMinutes ?? 0));
                      });
                    },
                    icon: const Icon(Icons.speed),
                    label: const Text("Fastest"),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        oneWayDuplicateData?.sort((a, b) => (int.tryParse(a.departureTime?.split(":")[0] ?? '') ?? 0).compareTo(int.tryParse(b.departureTime?.split(":")[0] ?? '') ?? 0));
                      });
                    },
                    icon: const Icon(Icons.timer),
                    label: const Text("Earliest"),
                  ),
                ],
              ),
              Expanded(child: FlightFareCardListView(data: oneWayDuplicateData ?? [], travelType: travelType)),
            ],
          ),
        ),
      );
    } else if (travelType == "R") {
      if (internationalTrip) {
        log(travelType + "c");

        rAirlineSearchResponse = arguments["data"];
        if (!(rAirlineSearchResponse.test ?? false)) {
          crtDuplicateData = rAirlineSearchResponse.objItinList?.where((element) => element.netAmount != 0).toList(); // Store the original data
          log(rAirlineSearchResponse.test.toString() + " if condition");
        }
        rAirlineSearchResponse.test = true;

        return ((rAirlineSearchResponse.status ?? false) && (rAirlineSearchResponse.objItinList ?? []).isNotEmpty)
            ? WillPopScope(
                onWillPop: () {
                  Navigator.popUntil(context, ModalRoute.withName('/flights'));
                  return Future.value(true);
                },
                child: Scaffold(
                  key: _scaffoldKey,
                  backgroundColor: white,
                  drawer: CRTFilter(
                    filterSelections: selectedFilters,
                    airlineList: rAirlineSearchResponse.objAvlairlineList ?? [],
                    itemList: rAirlineSearchResponse.objItinList ?? [],
                    maximumFare: rAirlineSearchResponse.maximumFare,
                    minimumFare: rAirlineSearchResponse.minimumFare,
                    // Pass the original data to the drawer
                    callBack: (filteredData) {
                      crtDuplicateData = filteredData.datas;
                      selectedFilters = filteredData.filterSelections;

                      setState(() {});
                      log(filteredData.datas.toString());
                      log(filteredData.datas.length.toString());
                      print("Working");
                    },
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: const Icon(Icons.filter_alt_outlined),
                  ),
                  appBar: AppBar(
                    toolbarHeight: 80,
                    actions: [
                      IconButton(
                          tooltip: "Edit",
                          // onPressed: () => Navigator.of(context).pop(),
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              useSafeArea: true,
                              enableDrag: true,
                              context: context,
                              builder: (context) {
                                return Flex(direction: Axis.vertical, crossAxisAlignment: CrossAxisAlignment.end, children: [
                                  // IconButton(
                                  //   icon: Icon(Icons.close),
                                  //   onPressed: () {
                                  //     Navigator.pop(context);
                                  //   },
                                  // ),
                                  TripTypes(isModify: true, modifyData: modifyData, airportList: airportList),
                                ]);
                              },
                            );
                          },
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(children: [
                                Text(
                                  '${rAirlineSearchResponse.origin ?? ""}\t',
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                Text(
                                  rAirlineSearchResponse.destination ?? "",
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                                ),
                              ]),
                              Text(
                                DateFormat('dd MMMM').format(rAirlineSearchResponse.departureDate!),
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                              Text(
                                " [\t${(rAirlineSearchResponse.adult ?? 0) + (rAirlineSearchResponse.child ?? 0) + (rAirlineSearchResponse.infant ?? 0)} Traveller]",
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(children: [
                                Text(
                                  '${rAirlineSearchResponse.destination ?? ""}\t',
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                Text(
                                  rAirlineSearchResponse.origin ?? "",
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                                ),
                              ]),
                              Text(
                                DateFormat('dd MMMM').format(rAirlineSearchResponse.returnDate!),
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                              Text(
                                '${rAirlineSearchResponse.airlineClass}',
                                style: const TextStyle(fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //  flightSearchAppBar(context, data),
                  body: SafeArea(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OutlinedButton.icon(
                              onPressed: () {
                                setState(() {
                                  crtDuplicateData?.sort((a, b) => (a.netAmount ?? 0).compareTo(b.netAmount ?? 0));
                                });
                              },
                              icon: const Icon(Icons.attach_money_outlined),
                              label: const Text("CHEAPEST"),
                            ),
                            OutlinedButton.icon(
                              onPressed: () {
                                setState(() {
                                  crtDuplicateData?.sort((a, b) => (a.onwardDetails?.durationInMinutes ?? 0).compareTo(b.onwardDetails?.durationInMinutes ?? 0));
                                });
                              },
                              icon: const Icon(Icons.speed),
                              label: const Text("Fastest"),
                            ),
                            OutlinedButton.icon(
                              onPressed: () {
                                setState(() {
                                  crtDuplicateData?.sort((a, b) => (int.tryParse(a.onwardDetails?.departureTime?.split(":")[0] ?? '') ?? 0).compareTo(int.tryParse(b.onwardDetails?.departureTime?.split(":")[0] ?? '') ?? 0));
                                });
                              },
                              icon: const Icon(Icons.timer),
                              label: const Text("Earliest"),
                            ),
                          ],
                        ),
                        Expanded(child: FlightFareCardListView(combainedRoundData: crtDuplicateData, travelType: travelType, internationalTrip: internationalTrip)),
                      ],
                    ),
                  ),
                ),
              )
            : const ErrorPage();
      } else {
        log(travelType + "I");
        irAirlineSearchResponse = arguments["data"];

        if (!(irAirlineSearchResponse.testO ?? false)) {
          irOnwardWayDuplicateData = irAirlineSearchResponse.objItinList?.where((element) => element.netAmount != 0).toList(); // Store the original data
          //   log(airlineSearchResponse.testO.toString() + " if condition");
        }
        if (!(irAirlineSearchResponse.testR ?? false)) {
          irReturnWayDuplicateData = irAirlineSearchResponse.objItinListR?.where((element) => element.netAmount != 0).toList(); // Store the original data
          //   log(airlineSearchResponse.testO.toString() + " if condition");
        }
        irAirlineSearchResponse.testO = true;
        irAirlineSearchResponse.testR = true;
        log(irAirlineSearchResponse.toString());
        return WillPopScope(
          onWillPop: () {
            Navigator.popUntil(context, ModalRoute.withName('/flights'));
            return Future.value(true);
          },
          child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    tooltip: "Edit",
                    // onPressed: () => Navigator.of(context).pop(),
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        useSafeArea: true,
                        enableDrag: true,
                        context: context,
                        builder: (context) {
                          return Flex(direction: Axis.vertical, crossAxisAlignment: CrossAxisAlignment.end, children: [
                            //   IconButton(
                            //     icon: Icon(Icons.close),
                            //     onPressed: () {
                            //       Navigator.pop(context);
                            //     },
                            //   ),
                            TripTypes(isModify: true, modifyData: modifyData, airportList: airportList),
                          ]);
                        },
                      );
                    },
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          DateFormat('dd MMMM').format(irAirlineSearchResponse.departureDate!),
                          style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          " - ",
                          style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          DateFormat('dd MMMM').format(irAirlineSearchResponse.returnDate!),
                          style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Text(
                      " [\t${((irAirlineSearchResponse.adult ?? 0) + (irAirlineSearchResponse.child ?? 0) + (irAirlineSearchResponse.infant ?? 0))}Traveller]",
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    Text(
                      irAirlineSearchResponse.airlineClass ?? "",
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          irtOnwardShow = true;
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          decoration: BoxDecoration(color: irtOnwardShow ? secondaryColor : Colors.grey.shade300, borderRadius: const BorderRadius.all(Radius.circular(5))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(irAirlineSearchResponse.origin ?? '', style: TextStyle(color: irtOnwardShow ? white : Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
                                  Icon(Icons.arrow_forward, color: irtOnwardShow ? white : Colors.black),
                                  Text(irAirlineSearchResponse.destination ?? '', style: TextStyle(color: irtOnwardShow ? white : Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Text(
                                DateFormat('dd MMMM').format(irAirlineSearchResponse.departureDate!),
                                style: TextStyle(color: irtOnwardShow ? white : Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          irtOnwardShow = false;
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(color: !irtOnwardShow ? secondaryColor : Colors.grey.shade300, borderRadius: const BorderRadius.all(Radius.circular(5))),
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(irAirlineSearchResponse.originR ?? '', style: TextStyle(color: !irtOnwardShow ? white : Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
                                  Icon(Icons.arrow_forward, color: !irtOnwardShow ? white : Colors.black),
                                  Text(irAirlineSearchResponse.destinationR ?? '', style: TextStyle(color: !irtOnwardShow ? white : Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Text(
                                DateFormat('dd MMMM').format(irAirlineSearchResponse.returnDate!),
                                style: TextStyle(color: !irtOnwardShow ? white : Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    irtOnwardShow
                        ? InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return FlightFilterDrawer(
                                    filterSelections: irtOnwardSelectedFilters,
                                    airlineList: irAirlineSearchResponse.objAvlairlineList ?? [],
                                    itemList: irAirlineSearchResponse.objItinList ?? [],
                                    maximumFare: irAirlineSearchResponse.maximumFare,
                                    minimumFare: irAirlineSearchResponse.minimumFare,
                                    // Pass the original data to the drawer
                                    callBack: (responseData) {
                                      irOnwardWayDuplicateData = responseData.datas;
                                      irtOnwardSelectedFilters = responseData.filterSelections;
                                      indSelectedOnward = -1;
                                      setState(() {});
                                      log(responseData.datas.toString());
                                      log(responseData.datas.length.toString());
                                      print("Working");
                                    },
                                  );
                                },
                              )).then((value) {
                                indSelectedOnward = -1;
                                irOnwardWayDuplicateData = value ?? irAirlineSearchResponse.objItinList;

                                setState(() {});
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 5.0, left: 10),
                              child: Row(children: [
                                Icon(Icons.sort),
                                Text("Filter"),
                              ]),
                            ),
                          )
                        : const SizedBox(),
                    !irtOnwardShow
                        ? InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return FlightFilterDrawer(
                                    filterSelections: irtReturnSelectedFilters,
                                    airlineList: irAirlineSearchResponse.objAvlairlineList ?? [],
                                    itemList: irAirlineSearchResponse.objItinListR ?? [],
                                    maximumFare: irAirlineSearchResponse.maximumFare,
                                    minimumFare: irAirlineSearchResponse.minimumFare,
                                    // Pass the original data to the drawer
                                    callBack: (responseData) {
                                      irReturnWayDuplicateData = responseData.datas;
                                      irtReturnSelectedFilters = responseData.filterSelections;
                                      indSelectedReturn = -1;
                                      setState(() {});
                                      log(responseData.datas.toString());
                                      log(responseData.datas.length.toString());
                                      print("Working");
                                    },
                                  );
                                },
                              )).then((value) {
                                indSelectedReturn = -1;
                                irReturnWayDuplicateData = value ?? irAirlineSearchResponse.objItinListR;
                                setState(() {});
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5.0, left: 10),
                              child: Row(children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                                  child: Text("Filter"),
                                ),
                                Transform(
                                  transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                                  child: const Icon(Icons.sort),
                                ),
                              ]),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                Expanded(
                    child: FlightFareCardListView(
                  onwardList: irOnwardWayDuplicateData,
                  returnList: irReturnWayDuplicateData,
                  travelType: travelType,
                  internationalTrip: false,
                  irtOnwardShow: irtOnwardShow,
                  selectedIndexOnward: indSelectedOnward,
                  selectedIndexReturn: indSelectedReturn,
                )),
              ],
            ),
          ),
        );
      }
    } else {
      airlineSearchResponse = arguments["data"];
      // AirlineSearchResponse data = AirlineSearchResponse();
      return const ErrorPage();
    }
  }

  flightDetailsSector(BuildContext context, FlightDetailsItin data) {
    return SizedBox(
      height: (data.objseglist?.length ?? 0) * 210,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.objseglist?.length ?? 0,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(height: 10),
                Card(
                  color: Colors.grey.shade300,
                  elevation: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        "https://agents.alhind.com/images/logos/${data.objseglist?[index].airlineCode ?? ''}.gif",
                        /*${data.airlineName}.*/

                        fit: BoxFit.fitHeight,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text("No logo");
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(data.objseglist?[index].airlineName ?? ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 5),
                        child: Text(data.objseglist?[index].airlineFlightClass ?? ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 25),
                        child: Text(data.adultCabinBaggage ?? ''),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 14, top: 15, bottom: 15),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(
                      //  width: MediaQuery.of(context).size.width / 2 - 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.objseglist?[index].departureCity ?? '',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "${data.objseglist?[index].departureAirportCode ?? ''} ${data.objseglist?[index].departureTime ?? ''}",
                              style: const TextStyle(fontSize: 23),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              data.objseglist?[index].departureAirport ?? '',
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(Icons.access_time_outlined),
                        ),
                        Text(
                          data.objseglist?[index].travelDuration ?? '',
                        )
                      ],
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width / 2 - 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            data.objseglist?[index].arrivalCity ?? '',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "${data.objseglist?[index].arrivalAirportCode ?? ''} ${data.objseglist?[index].arrivalTime ?? ''}",
                              style: const TextStyle(fontSize: 23),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              data.objseglist?[index].arrivalAirport ?? '',
                              maxLines: 2,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            );
          }),
    );
  }

  SizedBox fareOnDateListView(BuildContext context, List<LowestFare> data) {
    return SizedBox(
      height: 70,
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
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                Text(
                  "₹${data[index].amount}",
                  style: const TextStyle(color: Colors.red, fontSize: 17, fontWeight: FontWeight.w700),
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

  int fareRuleValue = -1;

  bool flightDetails = false;

  int? fareId;
  FlightDetailsResponse flightData = const FlightDetailsResponse();
  ApiSearchResponse indSelectedOnward = ApiSearchResponse();
  ApiSearchResponse indSelectedReturn = ApiSearchResponse();
  int selectedIdx = -1;
  int selectedIdxBookButton = -1;
  bool isFlightDetails = true;
  bool isFareSummary = false;

  FlightDetailsResponseIR flightDataRoundTrip = const FlightDetailsResponseIR();

  bool isBookLoading = false;

  @override
  Widget build(BuildContext context) {
    if (widget.travelType == "O") {
      return ListView.builder(
          itemCount: widget.data?.length ?? 0,
          itemBuilder: (context, index) {
            bool isSelected = selectedIdx == index;
            bool isBookLoading = selectedIdxBookButton == index;
            return oneWayWidget(context: context, data: widget.data?[index], index: index, isSelected: isSelected, isBookLoading: isBookLoading);
          });
    } else if (widget.travelType == "R" && widget.internationalTrip) {
      return ListView.builder(
          itemCount: widget.combainedRoundData?.length ?? 0,
          itemBuilder: (context, index) {
            bool isSelected = selectedIdx == index;
            bool isBookLoading = selectedIdxBookButton == index;
            return combainedRoundTripWidget(context, widget.combainedRoundData?[index], isSelected, index, isBookLoading);
          });
    } else if (widget.travelType == "R" && !widget.internationalTrip) {
      return Column(
        children: [
          Expanded(
            child: Row(
              children: [
                widget.irtOnwardShow
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: widget.onwardList?.length ?? 0,
                            itemBuilder: (context, index) {
                              bool isSelected = widget.selectedIndexOnward == index;

                              return individualRoundTripWidget(context, widget.onwardList?[index], isSelected, index, onward: true, selectedItinID: indSelectedOnward.itinId ?? 0);
                            }))
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: widget.returnList?.length ?? 0,
                            itemBuilder: (context, index) {
                              bool isSelected = widget.selectedIndexReturn == index;
                              return individualRoundTripWidget(context, widget.returnList?[index], isSelected, index, onward: false, selectedItinID: indSelectedReturn.itinId ?? 0);
                            })),
              ],
            ),
          ),
          Card(
            color: const Color.fromARGB(255, 255, 232, 214),
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                indSelectedOnward.itinId != null
                    ? Expanded(
                        child: Container(
                          height: 80,
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                                    child: ClipRRect(
                                      child: Image.network(
                                        "https://agents.alhind.com/images/logos/${indSelectedOnward.airlineCode ?? ''}.gif",

                                        /*${data.airlineName}.*/

                                        fit: BoxFit.fitHeight,
                                        errorBuilder: (context, error, stackTrace) {
                                          return const Text("No logo");
                                        },
                                      ),
                                    ),
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
                                          Text(indSelectedOnward.departureTime ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                          Text(indSelectedOnward.duration ?? '', style: const TextStyle(fontSize: 11)),
                                        ],
                                      ),
                                      const Icon(Icons.arrow_forward, size: 20),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(indSelectedOnward.arrivalTime ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                          Text(
                                            indSelectedOnward.noofStop != 0 && indSelectedOnward.noofStop != null ? "${indSelectedOnward.noofStop} stop" : 'Non-stop',
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
                                          "₹${indSelectedOnward.netAmount ?? ''}",
                                          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w700, fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    : indSelectedReturn.itinId != null
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 80,
                            child: const Center(child: Text("Please select onward")),
                          )
                        : const SizedBox(),
                indSelectedReturn.itinId != null
                    ? Expanded(
                        child: Container(
                          height: 80,
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                                    child: ClipRRect(
                                      child: Image.network(
                                        "https://agents.alhind.com/images/logos/${indSelectedReturn.airlineCode ?? ''}.gif",

                                        /*${data.airlineName}.*/

                                        fit: BoxFit.fitHeight,
                                        errorBuilder: (context, error, stackTrace) {
                                          return const Text("No logo");
                                        },
                                      ),
                                    ),
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
                                          Text(indSelectedReturn.departureTime ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                          Text(indSelectedReturn.duration ?? '', style: const TextStyle(fontSize: 11)),
                                        ],
                                      ),
                                      const Icon(Icons.arrow_forward, size: 20),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(indSelectedReturn.arrivalTime ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                          Text(
                                            indSelectedReturn.noofStop != 0 && indSelectedReturn.noofStop != null ? "${indSelectedReturn.noofStop} stop" : 'Non-stop',
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
                                          "₹${indSelectedReturn.netAmount ?? ''}",
                                          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w700, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "₹${(indSelectedOnward.amount ?? 0) + (indSelectedReturn.amount ?? 0)}",
                      style: const TextStyle(
                        color: white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        if ((indSelectedOnward.itinId != null) && (indSelectedReturn.itinId != null)) {
                          await SearchApi()
                              .flightDetailsR(
                                  data: FlightDetailsRequestIR(
                            itinId: indSelectedOnward.itinId,
                            itinIdR: indSelectedReturn.itinId,
                            fareIdR: indSelectedReturn.fareId,
                            providerCodeR: indSelectedReturn.providerCode,
                            providerCode: indSelectedOnward.providerCode,
                            fareId: indSelectedOnward.fareId,
                          ))
                              .then((value) {
                            flightDataRoundTrip = value ?? const FlightDetailsResponseIR();
                          });
                          setState(() {});

                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return StatefulBuilder(builder: (context, setState) {
                                return Container(
                                  padding: const EdgeInsets.only(top: 50),
                                  color: white,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: ListView(
                                      children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    isFlightDetails = true;
                                                    isFareSummary = false;
                                                    setState(() {});
                                                    //       FlightDetailsResponseIR
                                                  },
                                                  child: const Text("Flight Details", style: TextStyle(color: Colors.black, fontSize: 20)),
                                                ),
                                              ),
                                              isFlightDetails
                                                  ? const SizedBox(
                                                      width: 120,
                                                      child: Divider(thickness: 2, color: Colors.black),
                                                    )
                                                  : const SizedBox(
                                                      width: 120,
                                                      child: Divider(thickness: 2, color: Colors.transparent),
                                                    )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    isFareSummary = true;
                                                    isFlightDetails = false;
                                                    setState(() {});
                                                  },
                                                  child: const Text("Fare Summary", style: TextStyle(color: Colors.black, fontSize: 20)),
                                                ),
                                              ),
                                              isFareSummary
                                                  ? const SizedBox(
                                                      width: 120,
                                                      child: Divider(thickness: 2, color: Colors.black),
                                                    )
                                                  : const SizedBox(
                                                      width: 120,
                                                      child: Divider(thickness: 2, color: Colors.transparent),
                                                    )
                                            ],
                                          ),
                                          IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))
                                        ]),
                                        isFlightDetails
                                            ? Column(
                                                children: [
                                                  flightDetailsSector(flightDataRoundTrip.objitin),
                                                  flightDetailsSector(flightDataRoundTrip.objitinR),
                                                ],
                                              )
                                            : flightDetailsFareSummary(flightDataRoundTrip),
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                          );
                        }
                      },
                      icon: const Icon(Icons.info_outline, color: white, size: 30),
                    ),
                  ],
                ),
              ),
              AbsorbPointer(
                absorbing: isBookLoading && (indSelectedOnward.itinId != null && indSelectedOnward.itinId != 0) && (indSelectedReturn.itinId != null && indSelectedReturn.itinId != 0),
                child: InkWell(
                  onTap: () {
                    if ((indSelectedOnward.itinId != null && indSelectedOnward.itinId != 0) && (indSelectedReturn.itinId != null && indSelectedReturn.itinId != 0)) {
                      isBookLoading = true;
                    }

                    setState(() {});
                    PricingRequest req = PricingRequest();
                    req.itinId = indSelectedOnward.itinId;
                    req.itinIdR = indSelectedReturn.itinId;
                    req.fareId = indSelectedOnward.fareId;
                    req.fareIdR = indSelectedReturn.fareId;
                    req.providerCode = indSelectedOnward.providerCode;
                    req.providerCodeR = indSelectedReturn.providerCode;
                    if ((indSelectedOnward.itinId != null) && (indSelectedReturn.itinId != null)) {
                      PricingApi().pricingDetails(request: req).then((value) {
                        isBookLoading = false;
                        setState(() {});
                        (value?.status ?? false)
                            ? Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ScreenReviewFlight(data: value ?? const PricingResponse()),
                              ))
                            : (value?.responseMessage?.trim().toLowerCase() == ("InvalidToken").trim().toLowerCase())
                                ? Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const SessionExpiredPage(),
                                  ))
                                : Helper().toastMessage("Something went wrong try Again!!!");
                      });
                    }
                  },
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width / 2,
                    color: secondaryColor,
                    child: Center(
                      child: isBookLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "PROCEED",
                              style: TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      );
    } else {
      return const Text("No data");
    }
  }

  individualRoundTripWidget(BuildContext context, ApiSearchResponse? data, bool isSelected, int index, {required bool onward, required int selectedItinID}) {
    return InkWell(
        onTap: () {
          if (onward) {
            widget.selectedIndexOnward = isSelected ? -1 : index;
            if (!isSelected) {
              indSelectedOnward = data ?? ApiSearchResponse();
            } else {
              indSelectedOnward = ApiSearchResponse();
            }
          } else {
            widget.selectedIndexReturn = isSelected ? -1 : index;
            if (!isSelected) {
              indSelectedReturn = data ?? ApiSearchResponse();
            } else {
              indSelectedReturn = ApiSearchResponse();
            }
          }
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.all(
            10,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: (selectedItinID == (data?.itinId ?? 0)) ? const Color.fromARGB(255, 220, 234, 251) : Colors.white,
            border: (selectedItinID == (data?.itinId ?? 0)) ? Border.all(color: primaryColor, width: 2) : Border.all(color: Colors.grey.shade400, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
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

                                    fit: BoxFit.fill,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Text("No logo");
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                data?.airlineName ?? "",
                                style: const TextStyle(fontSize: 18),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.circle,
                                  size: 10,
                                ),
                              ),
                              Text(
                                "${data?.flightDetails ?? ""}",
                                style: const TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 4.0),
                                        child: Text(
                                          data?.source ?? '',
                                          style: const TextStyle(fontSize: 17),
                                        ),
                                      ),
                                      Text(data?.departureTime ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          data?.duration ?? '',
                                          style: const TextStyle(fontSize: 11),
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
                                          data?.destination ?? '',
                                          style: const TextStyle(fontSize: 17),
                                        ),
                                      ),
                                      Text(data?.arrivalTime ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            left: 8,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              (data?.noofSeat != 0 && data?.noofSeat != null)
                                  ? Row(
                                      children: [
                                        const Icon(Icons.airline_seat_recline_extra, size: 20),
                                        Text(
                                          "${data?.noofSeat} Seats",
                                          style: const TextStyle(fontSize: 15),
                                        )
                                      ],
                                    )
                                  : const SizedBox(),
                              Text(
                                "₹${data?.netAmount ?? ''}",
                                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w700, fontSize: 23),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          (data?.freeBaggage ?? "") != ''
                              ? Icon(
                                  Icons.luggage_outlined,
                                  color: Colors.grey.shade600,
                                  size: 20,
                                )
                              : const SizedBox(),
                          Text(data?.freeBaggage ?? "")
                        ]),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )); /*   child: Container(
          // color: isSelected ? Colors.blueGrey.shade200 : white,
          decoration: BoxDecoration(
            color: white,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: isSelected ? Border.all(color: primaryColor, width: 2) : null,
            boxShadow: [const BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.25), offset: Offset(0, 1), blurRadius: 1)],
          ),

          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
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

                        fit: BoxFit.fitHeight,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text("No logo");
                        },
                      ),
                    ),
                  ),
                  Text(
                    data?.airlineName ?? "",
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
                          Text(data?.departureTime ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                          Text(data?.duration ?? '', style: const TextStyle(fontSize: 11)),
                        ],
                      ),
                      const Icon(Icons.arrow_forward, size: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(data?.arrivalTime ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
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
                          "₹${data?.netAmount ?? ''}",
                          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )); */
  }

/* Text( data?.airlineName ?? '',style: TextStyle(
  color: isSelected ? primaryColor : secondaryColor),
   ), */
  Column combainedRoundTripWidget(BuildContext context, RApisearchresponse? data, bool isSelected, int index, bool isBookLoading) {
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
                                  "https://agents.alhind.com/images/logos/${data?.onwardDetails?.airlineCode ?? ''}.gif",
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
                        /* flight time  */
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
                                      data?.onwardDetails?.source ?? '',
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  Text(data?.onwardDetails?.departureTime ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Column(
                                  children: [
                                    Text(
                                      data?.onwardDetails?.duration ?? '',
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
                                      data?.onwardDetails?.destination ?? '',
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  Text(data?.onwardDetails?.arrivalTime ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
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
                                  Text(data?.onwardDetails?.freeBaggage ?? "")
                                ]),
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
                            Text(
                              data?.returnDetails?.airlineName ?? "",
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
                                      data?.returnDetails?.source ?? '',
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  Text(data?.returnDetails?.departureTime ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Column(
                                  children: [
                                    Text(
                                      data?.returnDetails?.duration ?? '',
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
                                      data?.returnDetails?.destination ?? '',
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  Text(data?.returnDetails?.arrivalTime ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
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
                                  Text(data?.returnDetails?.freeBaggage ?? "")
                                ]),
                                TextButton.icon(
                                    onPressed: () async {
                                      await SearchApi()
                                          .flightDetailsR(
                                              data: FlightDetailsRequestIR(
                                        itinId: data?.itinId,
                                        itinIdR: 0,
                                        fareIdR: 0,
                                        providerCodeR: "",
                                        providerCode: data?.providerCode,
                                        fareId: fareId ?? data?.pricingList?.first.fareId,
                                      ))
                                          .then((value) {
                                        flightDataRoundTrip = value ?? const FlightDetailsResponseIR();
                                        selectedIdx = isSelected ? -1 : index;
                                        flightDetails = true;
                                      });
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
                          "₹${data?.netAmount ?? ''}",
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
                  AbsorbPointer(
                    absorbing: isBookLoading,
                    child: ElevatedButton(
                      onPressed: () async {
                        Connectivity().checkConnectivity().then((value) {
                          if (value == ConnectivityResult.none) {
                            Navigator.of(context).pushNamed('/NoConnection');
                          } else {
                            selectedIdxBookButton = isBookLoading ? -1 : index;

                            setState(() {});
                            PricingApi()
                                .pricingDetails(
                                    request: PricingRequest(
                              fareId: data?.fareId,
                              fareIdR: 0,
                              itinId: data?.itinId,
                              itinIdR: 0,
                              providerCode: data?.providerCode,
                              providerCodeR: "",
                            ))
                                .then((value) {
                              selectedIdxBookButton = -1;
                              setState(() {});
                              (value?.status ?? false)
                                  ? Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ScreenReviewFlight(
                                        data: value ?? const PricingResponse(),
                                      ),
                                    ))
                                  : (value?.responseMessage?.trim().toLowerCase() == ("InvalidToken").trim().toLowerCase())
                                      ? Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => const SessionExpiredPage(),
                                        ))
                                      : Helper().toastMessage("Something went wrong try Again!!!");
                              ;
                            });
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                        child: isBookLoading
                            ? const SizedBox(height: 23, width: 23, child: CircularProgressIndicator(color: Colors.white))
                            : const Text(
                                "Book",
                                style: TextStyle(fontSize: 17),
                              ),
                      ),
                      style: ElevatedButton.styleFrom(
                        //   fixedSize: Size(, 50),
                        backgroundColor: secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
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
                color: const Color.fromARGB(87, 156, 172, 192),
                child: flightDetails
                    ? Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Row(children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        isFlightDetails = true;
                                        isFareSummary = false;
                                        setState(() {});
                                        //       FlightDetailsResponseIR
                                      },
                                      child: const Text("Flight Details", style: TextStyle(color: Colors.black, fontSize: 20)),
                                    ),
                                  ),
                                  isFlightDetails
                                      ? const SizedBox(
                                          width: 120,
                                          child: Divider(thickness: 2, color: Colors.black),
                                        )
                                      : const SizedBox(
                                          width: 120,
                                          child: Divider(thickness: 2, color: Colors.transparent),
                                        )
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        isFareSummary = true;
                                        isFlightDetails = false;
                                        setState(() {});
                                      },
                                      child: const Text("Fare Summary", style: TextStyle(color: Colors.black, fontSize: 20)),
                                    ),
                                  ),
                                  isFareSummary
                                      ? const SizedBox(
                                          width: 120,
                                          child: Divider(thickness: 2, color: Colors.black),
                                        )
                                      : const SizedBox(
                                          width: 120,
                                          child: Divider(thickness: 2, color: Colors.transparent),
                                        )
                                ],
                              )
                            ]),
                            isFlightDetails
                                ? Column(
                                    children: [
                                      flightDetailsSector(flightDataRoundTrip.objitin),
                                      flightDetailsSector(flightDataRoundTrip.objitinR),
                                    ],
                                  )
                                : flightDetailsFareSummary(flightDataRoundTrip),
                          ],
                        ),
                      )
                    : morePrice(context, pricingList: data?.pricingList, itinID: data?.itinId ?? 0, providerCode: data?.providerCode ?? ''),
              )
            : const SizedBox(),
      ],
    );
  }

  Column oneWayWidget({required ApiSearchResponse? data, required bool isSelected, required int index, required BuildContext context, required bool isBookLoading}) {
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

                                    fit: BoxFit.fill,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Text("No logo");
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                data?.airlineName ?? "",
                                style: const TextStyle(fontSize: 18),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.circle,
                                  size: 10,
                                ),
                              ),
                              Text(
                                "${data?.flightDetails ?? ""}",
                                style: const TextStyle(fontSize: 13),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 4.0),
                                        child: Text(
                                          data?.source ?? '',
                                          style: const TextStyle(fontSize: 17),
                                        ),
                                      ),
                                      Text(data?.departureTime ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          data?.duration ?? '',
                                          style: const TextStyle(fontSize: 11),
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
                                          data?.destination ?? '',
                                          style: const TextStyle(fontSize: 17),
                                        ),
                                      ),
                                      Text(data?.arrivalTime ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ],
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
                                "₹${data?.netAmount ?? ''}",
                                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w700, fontSize: 20),
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
                        AbsorbPointer(
                          absorbing: isBookLoading,
                          child: ElevatedButton(
                            onPressed: () {
                              Connectivity().checkConnectivity().then((value) {
                                if (value == ConnectivityResult.none) {
                                  Navigator.of(context).pushNamed('/NoConnection');
                                } else {
                                  selectedIdxBookButton = isBookLoading ? -1 : index;

                                  setState(() {});
                                  PricingApi()
                                      .pricingDetails(
                                          request: PricingRequest(
                                    fareId: data?.fareId,
                                    fareIdR: 0,
                                    itinId: data?.itinId,
                                    itinIdR: 0,
                                    providerCode: data?.providerCode,
                                    providerCodeR: "",
                                  ))
                                      .then((value) {
                                    selectedIdxBookButton = -1;
                                    setState(() {});
                                    ((value?.status ?? false))
                                        ? Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => ScreenReviewFlight(
                                              data: value ?? const PricingResponse(),
                                            ),
                                          ))
                                        : (value?.responseMessage?.trim().toLowerCase() == ("InvalidToken").trim().toLowerCase())
                                            ? Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => const SessionExpiredPage(),
                                              ))
                                            : Helper().toastMessage("Something went wrong try Again!!!");
                                  });
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              //   fixedSize: Size(, 50),
                              backgroundColor: secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: isBookLoading
                                  ? const SizedBox(
                                      height: 23,
                                      width: 23,
                                      child: CircularProgressIndicator(color: Colors.white),
                                    )
                                  : const Text("Book"),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // const Padding(
                        //   padding: EdgeInsets.only(left: 12.0),
                        //   child: Text(
                        //     "2hr Layover at Mumbai",
                        //     style: TextStyle(color: primaryColor),
                        //   ),
                        // ),
                        Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              (data?.freeBaggage ?? "") != ''
                                  ? Icon(
                                      Icons.luggage_outlined,
                                      color: Colors.grey.shade600,
                                      size: 20,
                                    )
                                  : const SizedBox(),
                              Text(data?.freeBaggage ?? "")
                            ]),
                            TextButton.icon(
                                onPressed: () async {
                                  await SearchApi().flightDetails(itinId: data?.itinId, providerCode: data?.providerCode, fareId: fareId ?? data?.pricingList?.first.fareId).then((value) {
                                    flightData = value ?? const FlightDetailsResponse();
                                    selectedIdx = isSelected ? -1 : index;
                                    flightDetails = true;
                                  });
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
                    ? Container(
                        child: Column(
                          children: [
                            Row(children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        isFlightDetails = true;
                                        isFareSummary = false;
                                        setState(() {});
                                      },
                                      child: const Text("Flight Details", style: TextStyle(color: Colors.black, fontSize: 20)),
                                    ),
                                  ),
                                  isFlightDetails
                                      ? const SizedBox(
                                          width: 120,
                                          child: Divider(thickness: 2, color: Colors.black),
                                        )
                                      : const SizedBox(
                                          width: 120,
                                          child: Divider(thickness: 2, color: Colors.transparent),
                                        )
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        isFareSummary = true;
                                        isFlightDetails = false;
                                        setState(() {});
                                      },
                                      child: const Text("Fare Summary", style: TextStyle(color: Colors.black, fontSize: 20)),
                                    ),
                                  ),
                                  isFareSummary
                                      ? const SizedBox(
                                          width: 120,
                                          child: Divider(thickness: 2, color: Colors.black),
                                        )
                                      : const SizedBox(
                                          width: 120,
                                          child: Divider(thickness: 2, color: Colors.transparent),
                                        ),
                                ],
                              )
                            ]),
                            isFlightDetails ? flightDetailsSector(flightData.objitin) : flightDetailsFareSummary(flightData),
                          ],
                        ),
                      )
                    : morePrice(context, pricingList: data?.pricingList, itinID: data?.itinId ?? 0, providerCode: data?.providerCode ?? ''),
              )
            : const SizedBox(),
      ],
    );
  }

  flightDetailsFareSummary(data) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Fare Summary",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Adult X ${data.adult}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Child X ${data.child}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Infant X ${data.infant}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Base Fare",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " ${data.adtBasic}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      " ${data.chdBasic}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " ${data.infBasic}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Fees & Tax",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " ${data.adtTax}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      " ${data.chdTax}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " ${data.infTax}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(thickness: 2, color: Colors.grey),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
              child: Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
              child: Text(
                " ${data.totalFare ?? 0}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "  *Total price displayed above has been rounded of and may vary at final stage.",
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  flightDetailsSector(FlightDetailsItin? data) {
    return SizedBox(
      height: (data?.objseglist?.length ?? 0) * 210,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data?.objseglist?.length ?? 0,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(height: 10),
                Card(
                  color: Colors.grey.shade300,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          "https://agents.alhind.com/images/logos/${data?.objseglist?[index].airlineCode ?? ''}.gif",
                          /*${data.airlineName}.*/

                          fit: BoxFit.fitHeight,
                          errorBuilder: (context, error, stackTrace) {
                            return const Text("No logo");
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text("${data?.objseglist?[index].airlineName ?? ''} ${data?.objseglist?[index].airlineCode ?? ''}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 5),
                          child: Text(data?.objseglist?[index].airlineFlightClass ?? ''),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 25),
                          child: Text(data?.adultCabinBaggage ?? 'N/A KG'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 14, top: 15, bottom: 15),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(
                      //  width: MediaQuery.of(context).size.width / 2 - 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data?.objseglist?[index].departureCity ?? '',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "${data?.objseglist?[index].departureAirportCode ?? ''} ${data?.objseglist?[index].departureTime ?? ''}",
                              style: const TextStyle(fontSize: 23),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              data?.objseglist?[index].departureAirport ?? '',
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(Icons.access_time_outlined),
                        ),
                        Text(
                          data?.objseglist?[index].travelDuration ?? '',
                        ),
                        (data?.objseglist?[index].layoverTime != null && data?.objseglist?[index].layoverTime != '')
                            ? Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                margin: const EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  "Layover of ${data?.objseglist?[index].layoverTime ?? ''}",
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width / 2 - 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            data?.objseglist?[index].arrivalCity ?? '',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "${data?.objseglist?[index].arrivalAirportCode ?? ''} ${data?.objseglist?[index].arrivalTime ?? ''}",
                              style: const TextStyle(fontSize: 23),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              data?.objseglist?[index].arrivalAirport ?? '',
                              maxLines: 2,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            );
          }),
    );
  }

  morePrice(BuildContext context, {List<PricingBasic>? pricingList, required int itinID, required String providerCode}) {
    int? fare;
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: pricingList?.length ?? 0,
        itemBuilder: (context, index) {
          final value = pricingList?[index];
          return Container(
            margin: const EdgeInsets.all(8),
            color: white,
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton.icon(
                    onPressed: () {
                      fareRuleValue = value?.fareId == fareRuleValue ? -1 : value?.fareId ?? 0;
                      setState(() {});
                    },
                    label: const Icon(Icons.keyboard_arrow_down),
                    icon: Text(
                      value?.fareName ?? '',
                      style: const TextStyle(color: Colors.black),
                    )),
                Text("${value?.netAmount ?? 0}"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AbsorbPointer(
                    absorbing: (fare == value?.fareId),
                    child: ElevatedButton(
                      onPressed: () {
                        fare = value?.fareId;

                        setState(() {});
                        Connectivity().checkConnectivity().then((connection) {
                          if (connection == ConnectivityResult.none) {
                            Navigator.of(context).pushNamed('/NoConnection');
                          } else {
                            PricingApi().pricingDetails(request: PricingRequest(fareId: value?.fareId, fareIdR: 0, itinId: itinID, itinIdR: 0, providerCode: providerCode, providerCodeR: "")).then((value) {
                              fare = -276;

                              setState(() {});
                              (value?.status ?? false)
                                  ? Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ScreenReviewFlight(data: value ?? const PricingResponse()),
                                    ))
                                  : null;
                            });
                          }
                        });

                        //   Navigator.of(context).pushNamed('/ReviewFlight');
                      },
                      child: (fare == value?.fareId) ? CircularProgressIndicator() : const Text("Select"),
                    ),
                  ),
                )
              ]),
              fareRuleValue == value?.fareId ? fareRule(context, value) : const SizedBox(),
            ]),
          );
        },
      ),
    );
  }

  Column fareRule(BuildContext context, PricingBasic? data) {
    return Column(
      children: [
        (data?.cabinBaggage != null && data?.cabinBaggage != '')
            ? Row(
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    child: Text(data?.cabinBaggage ?? ''),
                  ),
                ],
              )
            : const SizedBox(),
        (data?.checkinBaggage != null && data?.checkinBaggage != '')
            ? Row(
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    child: Text(data?.checkinBaggage ?? ''),
                  ),
                ],
              )
            : const SizedBox(),
        (data?.meal != null && data?.meal != '')
            ? Row(
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
              )
            : const SizedBox(),
        (data?.seat != null && data?.seat != '')
            ? Row(
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
              )
            : const SizedBox(),
        (data?.cancellation != null && data?.cancellation != '')
            ? Row(
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
              )
            : const SizedBox(),
        (data?.dateChange != null && data?.dateChange != '')
            ? Row(
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
              )
            : const SizedBox(),
      ],
    );
  }
}

class FlightFareCardListView extends StatefulWidget {
  late List<ApiSearchResponse>? data;
  late List<ApiSearchResponse>? onwardList;
  late List<ApiSearchResponse>? returnList;
  late List<RApisearchresponse>? combainedRoundData;
  late bool internationalTrip;
  bool irtOnwardShow;
  String travelType;

  int selectedIndexOnward;
  int selectedIndexReturn;

  FlightFareCardListView({this.data, this.combainedRoundData, required this.travelType, this.onwardList, this.returnList, this.internationalTrip = true, this.irtOnwardShow = true, this.selectedIndexOnward = -1, this.selectedIndexReturn = -1});
  @override
  State<FlightFareCardListView> createState() => _FlightFareCardListViewState();
}
