import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:travel_mytri_mobile_v1/data/model/Search/flight_search_model.dart';

import '../../Constants/colors.dart';

//typedef ListCallback = void Function(List<AirlineSearchResponse>);
typedef ListCallback = void Function(List<ApiSearchResponse>);

class FlightFilterDrawer extends StatefulWidget {
  const FlightFilterDrawer({
    Key? key,
    required this.airlineSearchResponse,
    required this.callBack,
  }) : super(key: key);

  final AirlineSearchResponse airlineSearchResponse;
  final ListCallback callBack;

  @override
  State<FlightFilterDrawer> createState() => _FlightFilterDrawerState();
}

class _FlightFilterDrawerState extends State<FlightFilterDrawer> {
  double? startCurrentValue;
  double? endCurrentValue;

  bool isRefundable = false;
  bool nonStop = false;
  bool oneStop = false;
  bool twoStop = false;
  bool depEarlyMorning = false;
  bool depMorning = false;
  bool depAfternoon = false;
  bool depNight = false;
  bool arrEarlyMorning = false;
  bool arrMorning = false;
  bool arrAfternoon = false;
  bool arrNight = false;
  List<bool> selectedFlights = [];
  List<String> filterFlightCodeList = [];

  bool priceFilter = false;

  @override
  void initState() {
    super.initState();
    selectedFlights = List<bool>.filled(widget.airlineSearchResponse.objAvlairlineList?.length ?? 0, false);
  }

  @override
  void didUpdateWidget(FlightFilterDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.airlineSearchResponse != oldWidget.airlineSearchResponse) {
      // Widget configuration has changed, update the selectedFlights list accordingly
      selectedFlights = List<bool>.filled(widget.airlineSearchResponse.objAvlairlineList?.length ?? 0, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 3.5 / 4,
      child: ListView(
        //    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade500),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Airlines",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  //   height: 4 * 50,
                  height: (widget.airlineSearchResponse.objAvlairlineList?.length ?? 0) * 50,
                  child: ListView.builder(
                    //  itemCount: 4,
                    itemCount: widget.airlineSearchResponse.objAvlairlineList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final val = widget.airlineSearchResponse.objAvlairlineList?[index];
                      //    bool isChecked = selectedFlight == index; // Maintain checked state for each item
                      bool isChecked = selectedFlights[index]; // Maintain checked state for each item

                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              "https://agents.alhind.com/images/logos/${val?.airlineCode}.gif",
                              errorBuilder: (context, error, stackTrace) {
                                return const Text("No logo");
                              },
                            ),
                            Text(
                              val?.airlineName ?? '',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${val?.minAmount ?? 0}",
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  //  widget.airlineSearchResponse.objAvlairlineList?.where((element) => element.airlineCode != "");
                                  selectedFlights[index] = value ?? false;
                                  if (selectedFlights[index]) {
                                    // Add the flight to the filteredFlights list
                                    filterFlightCodeList.add(val?.airlineCode ?? "");
                                  }
                                  if (!selectedFlights[index]) {
                                    // Add the flight to the filteredFlights list
                                    filterFlightCodeList.remove(val?.airlineCode);
                                  }

                                  //  selectedFlight = isChecked ? -1 : index;
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade500),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Stop",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Non-stop",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Checkbox(
                          value: nonStop,
                          onChanged: (bool? value) {
                            setState(() {
                              nonStop = !nonStop;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          '1 stop',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Checkbox(
                          value: oneStop,
                          onChanged: (bool? value) {
                            setState(() {
                              oneStop = !oneStop;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "2 stop",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Checkbox(
                          value: twoStop,
                          onChanged: (bool? value) {
                            setState(() {
                              twoStop = !twoStop;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade500), borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Refundable",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Switch(
                  value: isRefundable,
                  onChanged: (value) {
                    isRefundable = !isRefundable;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade500), borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Departure time",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Early Morning",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "12 am - 6 am",
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                          Checkbox(
                            value: depEarlyMorning,
                            onChanged: (bool? value) {
                              setState(() {
                                depEarlyMorning = !depEarlyMorning;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Morning",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "6 am - 12 pm",
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                          Checkbox(
                            value: depMorning,
                            onChanged: (bool? value) {
                              setState(() {
                                depMorning = !depMorning;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "After noon ",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "12 pm - 6 pm",
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                        Checkbox(
                          value: depAfternoon,
                          onChanged: (bool? value) {
                            setState(() {
                              depAfternoon = !depAfternoon;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            "Night",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "6 pm - 12 am",
                            style: TextStyle(fontSize: 14),
                          )
                        ]),
                        Checkbox(
                          value: depNight,
                          onChanged: (bool? value) {
                            setState(() {
                              depNight = !depNight;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade500), borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Arrival time",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Early Morning",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "12 am - 6 am",
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                          Checkbox(
                            value: arrEarlyMorning,
                            onChanged: (bool? value) {
                              setState(() {
                                arrEarlyMorning = !arrEarlyMorning;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Morning",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "6 am - 12 pm",
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                          Checkbox(
                            value: arrMorning,
                            onChanged: (bool? value) {
                              setState(() {
                                arrMorning = !arrMorning;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "After noon ",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "12 pm - 6 pm",
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                        Checkbox(
                          value: arrAfternoon,
                          onChanged: (bool? value) {
                            setState(() {
                              arrAfternoon = !arrAfternoon;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            "Night",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "6 pm - 12 am",
                            style: TextStyle(fontSize: 14),
                          )
                        ]),
                        Checkbox(
                          value: arrNight,
                          onChanged: (bool? value) {
                            setState(() {
                              arrNight = !arrNight;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          widget.airlineSearchResponse.minimumFare != widget.airlineSearchResponse.maximumFare
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SfRangeSlider(
                    enableTooltip: true,
                    showLabels: true,
                    min: /* (widget.airlineSearchResponse.minimumFare == widget.airlineSearchResponse.maximumFare) ? 0 : */ widget.airlineSearchResponse.minimumFare ?? 0,
                    max: widget.airlineSearchResponse.maximumFare ?? 10,
                    values: SfRangeValues(
                      startCurrentValue ?? widget.airlineSearchResponse.minimumFare ?? 0,
                      endCurrentValue ?? widget.airlineSearchResponse.maximumFare ?? 10,
                    ),
                    onChanged: (value) {
                      priceFilter = true;
                      startCurrentValue = value.start;
                      endCurrentValue = value.end;
                      setState(() {});
                    },
                  ),
                )
              : SizedBox(),
          widget.airlineSearchResponse.minimumFare != widget.airlineSearchResponse.maximumFare
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "min : ${(startCurrentValue ?? widget.airlineSearchResponse.minimumFare ?? 0).toInt()}",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "max : ${(endCurrentValue ?? widget.airlineSearchResponse.maximumFare ?? 10).toInt()}",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                onPressed: () {
                  filterFlights().then((value) {
                    print(value);
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 50),
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: const Text("Apply Filters")),
          )
        ],
      ),
    );
  }

  Future<List<ApiSearchResponse>> filterFlights() async {
    List<ApiSearchResponse> data = widget.airlineSearchResponse.objItinList ?? [];
    List<ApiSearchResponse> filteringList = [];
    List<ApiSearchResponse> filteredList = [];
    if (filterFlightCodeList.isNotEmpty) {
      log("Working");
      log("$filterFlightCodeList");
      List<ApiSearchResponse> tempFilteredList = [];
      for (int i = 0; i < filterFlightCodeList.length; i++) {
        tempFilteredList.addAll(data.where((item) => item.airlineCode == filterFlightCodeList[i]));
      }
      data = tempFilteredList;
      //  filteringList.addAll(tempFilteredList);
    }

    if (isRefundable) {
      filteringList.addAll(data.where((item) => item.refundable == "refundable").toList());
      log(isRefundable.toString());
    }
    if (priceFilter) {
      filteringList.addAll(data.where((item) => ((item.netAmount ?? 0) >= (startCurrentValue ?? 0) && (item.netAmount ?? 0) <= (endCurrentValue ?? 0))).toList());
    }

    if (nonStop) {
      filteringList.addAll(data.where((item) => item.noofStop == 0));
    }
    if (oneStop) {
      filteringList.addAll(data.where((item) => item.noofStop == 1));
    }
    if (twoStop) {
      filteringList.addAll(data.where((item) => item.noofStop == 2));
    }
    filteredList = filteringList.map((item) => item.itinId).toSet().map((itemId) {
      return filteringList.firstWhere((item) => item.itinId == itemId);
    }).toList();

    print(filteredList.length);
    return filteredList;
  }
}
