import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/data/model/Search/flight_search_model.dart';

typedef ListCallback = void Function(List<RApisearchresponse>);

class CRTFilter extends StatefulWidget {
  const CRTFilter({
    Key? key,
    required this.airlineList,
    required this.itemList,
    required this.minimumFare,
    required this.callBack,
    required this.maximumFare,
  }) : super(key: key);

  final List<AvailableAirline> airlineList;
  final List<RApisearchresponse> itemList;
  final num? minimumFare;
  final num? maximumFare;
  final ListCallback callBack;
  @override
  State<CRTFilter> createState() => _CRTFilterState();
}

class _CRTFilterState extends State<CRTFilter> {
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
    selectedFlights = List<bool>.filled(widget.airlineList.length, false);
  }

  @override
  void didUpdateWidget(CRTFilter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.airlineList != oldWidget.airlineList) {
      // Widget configuration has changed, update the selectedFlights list accordingly
      selectedFlights = List<bool>.filled(widget.airlineList.length, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    log((widget.airlineList.length).toString() + " total data length");
    return Scaffold(
      appBar: AppBar(),
      bottomSheet: ElevatedButton(
          onPressed: () {
            filterFlights().then((value) {
              widget.callBack(value);

              Navigator.pop(context, value);
            });
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width, 80),
            backgroundColor: secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: const Text("Apply Filters")),
      body: ListView(
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
                  height: 200,
                  child: ListView.builder(
                    //  itemCount: 4,
                    itemCount: widget.airlineList.length,
                    itemBuilder: (context, index) {
                      final val = widget.airlineList[index];
                      //    bool isChecked = selectedFlight == index; // Maintain checked state for each item
                      bool isChecked = selectedFlights[index]; // Maintain checked state for each item

                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              "https://agents.alhind.com/images/logos/${val.airlineCode}.gif",
                              errorBuilder: (context, error, stackTrace) {
                                return const Text("No logo");
                              },
                            ),
                            Text(
                              val.airlineName ?? '',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${val.minAmount ?? 0}",
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
                                    filterFlightCodeList.add(val.airlineCode ?? "");
                                  }
                                  if (!selectedFlights[index]) {
                                    // Add the flight to the filteredFlights list
                                    filterFlightCodeList.remove(val.airlineCode);
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
          widget.minimumFare != widget.maximumFare
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SfRangeSlider(
                    enableTooltip: true,
                    showLabels: true,
                    min: /* (widget.airlineSearchResponse.minimumFare == widget.airlineSearchResponse.maximumFare) ? 0 : */ widget.minimumFare ?? 0,
                    max: widget.maximumFare ?? 10,
                    values: SfRangeValues(
                      startCurrentValue ?? widget.minimumFare ?? 0,
                      endCurrentValue ?? widget.maximumFare ?? 10,
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
          widget.minimumFare != widget.maximumFare
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "min : ${(startCurrentValue ?? widget.minimumFare ?? 0).toInt()}",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "max : ${(endCurrentValue ?? widget.maximumFare ?? 10).toInt()}",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
          SizedBox(height: 80)
        ],
      ),
    );
  }

  Future<List<RApisearchresponse>> filterFlights() {
    List<RApisearchresponse> data = widget.itemList; // data
    //  List<ApiSearchResponse> filteringList = List<ApiSearchResponse>.empty(growable: true);
    List<RApisearchresponse> filteredList = widget.itemList;
    ;

    if (filterFlightCodeList.isNotEmpty) {
      log("Working");
      log("$filterFlightCodeList");
      List<RApisearchresponse> tempFilteredList = [];
      tempFilteredList = data.where((element) => filterFlightCodeList.contains(element.onwardDetails?.airlineCode)).toList();
      // for (int i = 0; i < filterFlightCodeList.length; i++) {
      //   tempFilteredList.addAll(data.where((item) => item.airlineCode == filterFlightCodeList[i]));
      // }
      filteredList = tempFilteredList;
    }

    if (isRefundable) {
      filteredList.removeWhere((element) => (element.onwardDetails?.refundable != "refundable"));
    }
    if (priceFilter) {
      filteredList = filteredList.where((item) => ((item.netAmount ?? 0) >= (startCurrentValue ?? 0) && (item.netAmount ?? 0) <= (endCurrentValue ?? 0))).toList();
    }

    if (nonStop || oneStop || twoStop) {
      filteredList = filteredList.where((item) {
        bool satisfiesConditions = false;

        if (nonStop && item.onwardDetails?.noofStop == 0) {
          satisfiesConditions = true;
        }
        if (oneStop && item.onwardDetails?.noofStop == 1) {
          satisfiesConditions = true;
        }
        if (twoStop && item.onwardDetails?.noofStop == 2) {
          satisfiesConditions = true;
        }
        return satisfiesConditions;
      }).toList();
    }
    if (depEarlyMorning || depMorning || depAfternoon || depNight) {
      filteredList = filteredList.where((item) {
        bool satisfiesConditions = false;
        final departureHour = int.tryParse(item.onwardDetails?.departureTime?.split(":")[0] ?? '');

        if (depEarlyMorning && (departureHour != null) && (departureHour > 0) && (departureHour <= 6)) {
          satisfiesConditions = true;
        }
        if (depMorning && (departureHour != null) && (departureHour > 6) && (departureHour <= 12)) {
          satisfiesConditions = true;
        }
        if (depAfternoon && (departureHour != null) && (departureHour > 12) && (departureHour <= 18)) {
          satisfiesConditions = true;
        }
        if (depNight && (departureHour != null) && ((departureHour > 18) || (departureHour <= 0))) {
          satisfiesConditions = true;
        }
        return satisfiesConditions;
      }).toList();
    }
    if (arrEarlyMorning || arrMorning || arrAfternoon || arrNight) {
      filteredList = filteredList.where((item) {
        bool satisfiesConditions = false;
        final arrivalHour = int.tryParse(item.onwardDetails?.arrivalTime?.split(":")[0] ?? '');

        if (arrEarlyMorning && (arrivalHour != null) && (arrivalHour > 0) && (arrivalHour <= 6)) {
          satisfiesConditions = true;
        }
        if (arrMorning && (arrivalHour != null) && (arrivalHour > 6) && (arrivalHour <= 12)) {
          satisfiesConditions = true;
        }
        if (arrAfternoon && (arrivalHour != null) && (arrivalHour > 12) && (arrivalHour <= 18)) {
          satisfiesConditions = true;
        }
        if (arrNight && (arrivalHour != null) && ((arrivalHour > 18) || (arrivalHour <= 0))) {
          satisfiesConditions = true;
        }
        return satisfiesConditions;
      }).toList();
    }

    // final finalList = filteredList.toSet().map((item) => item.itinId).map((itemId) {
    //   return filteredList.firstWhere((item) => item.itinId == itemId);
    // }).toList();

    print("Filtered List Length: ${filteredList.length}");
    return Future.value(filteredList);
  }
}
