import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/search_widgets.dart';

import '../../data/model/Search/flight_search_model.dart';

class ScreenFlightSearchResult extends StatelessWidget {
  const ScreenFlightSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      //  final AirlineSearchResponse data = ModalRoute.of(context)?.settings.arguments as Apisearchresponse;
      AirlineSearchResponse data = AirlineSearchResponse();
      return Scaffold(
        backgroundColor: white,
        appBar: flightSearchAppBar(context, data),
        bottomNavigationBar: BottomNavigationBar(backgroundColor: const Color.fromARGB(255, 221, 227, 234), fixedColor: Colors.black, items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_alt, color: Colors.black),
            label: "Filter",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.toggle_off, color: Colors.black), label: "Filter", backgroundColor: Colors.black),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule, color: Colors.black),
            label: "Filter",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airlines, color: Colors.black),
            label: "Filter",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sort, color: Colors.black),
            label: "Filter",
          )
        ]),
        body: Column(
          children: [
            fareOnDateListView(context, data.objlowfareList ?? []),
            const Divider(),
            Expanded(child: FlightFareCardListView(data: data.objItinList ?? [])),
          ],
        ),
      );
    } catch (e) {
      log(e.toString());
      //   throw Exception();
    }
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Error"),
      ),
    );
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
                  style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.w700),
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
    return ListView.builder(
      itemCount: /* val.length */ 10,
      itemBuilder: (context, index) {
        bool isSelected = selectedIdx == index;
        final data = Apisearchresponse();
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(10)),
              height: 110,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          child: Image.network(
                            "https://agents.alhind.com/images/logos/ai.gif",
                            /*${data.airlineName}.*/
                            height: 60,
                            width: 60,
                            errorBuilder: (context, error, stackTrace) {
                              return Text("No logo");
                            },
                          ),
                        ),
                        Text(
                          data.airlineName ?? "",
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width / 2.5,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 4.0),
                                              child: Text(
                                                data.origin ?? 'DEL',
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ),
                                            Text(data.departureTime ?? '11:11', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                data.duration ?? '2 hr',
                                              ),
                                              SizedBox(
                                                width: 80,
                                                child: Stack(
                                                  children: [
                                                    Divider(
                                                      thickness: 2,
                                                      color: primaryColor,
                                                    ),
                                                    data.noofStop != 0 && data.noofStop != null
                                                        ? Center(
                                                            child: Icon(
                                                              Icons.circle,
                                                              size: 15,
                                                              color: secondaryColor,
                                                            ),
                                                          )
                                                        : SizedBox()
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                data.noofStop != 0 && data.noofStop != null ? "${data.noofStop} stop" : 'Non-stop',
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 4.0),
                                              child: Text(
                                                data.destination ?? 'DOH',
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ),
                                            Text(data.arrivalTime ?? '22:22', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
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
                                    "₹${data.netAmount ?? '736t#'}",
                                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700, fontSize: 24),
                                  ),
                                  (data.pricngList?.length ?? 0) > 1
                                      ? InkWell(
                                          onTap: () {
                                            selectedIdx = isSelected ? -1 : index;
                                            flightDetails = false;
                                            setState(() {});
                                          },
                                          child: Text(
                                            "More Fares",
                                            style: TextStyle(color: primaryColor),
                                          ),
                                        )
                                      : SizedBox()
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Icon(
                                Icons.luggage_outlined,
                                color: Colors.grey.shade600,
                                size: 20,
                              ),
                              Text(data.freeBaggage ?? "N/A")
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            isSelected
                ? Container(
                    color: Color.fromARGB(87, 156, 172, 192),
                    child: flightDetails ? SizedBox() : moreFare(context),
                  )
                // TODO : Flight Details
                : const SizedBox(),
          ],
        );
      },
    );
  }

  Column moreFare(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(8),
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
                Text("Saver"),
              ],
            ),
            Text('#45010'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/ReviewFlight');
                },
                child: Text("Select"),
              ),
            )
          ]),
          fareRuleValue == "Saver" ? fareRule(context, 10) : SizedBox(),
        ]),
      ),
      Container(
        margin: EdgeInsets.all(8),
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
                Text("Flexi"),
              ],
            ),
            Text('#65310'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/ReviewFlight');
                },
                child: Text("Select"),
              ),
            )
          ]),
          fareRuleValue == "Flexi" ? fareRule(context, 20) : SizedBox(),
        ]),
      ),
      Container(
        margin: EdgeInsets.all(8),
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
                Text("Flexi plus"),
              ],
            ),
            Text('#45010'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/ReviewFlight');
                },
                child: Text("Select"),
              ),
            )
          ]),
          fareRuleValue == "Flexi plus" ? fareRule(context, 30) : SizedBox(),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.business_center),
                    ),
                    Text("Cabin Bag"),
                  ],
                )),
            SizedBox(width: MediaQuery.of(context).size.width / 2 - 20, child: Text("7 Kgs")),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.luggage_outlined),
                    ),
                    Text("Check-in"),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.restaurant),
                    ),
                    Text("Meal"),
                  ],
                )),
            SizedBox(width: MediaQuery.of(context).size.width / 2 - 20, child: Text("7 Kgs")),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.airline_seat_recline_extra),
                    ),
                    Text("Seat"),
                  ],
                )),
            SizedBox(width: MediaQuery.of(context).size.width / 2 - 20, child: Text("7 Kgs")),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.published_with_changes_sharp),
                    ),
                    Text("Cancellation"),
                  ],
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Text(
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.calendar_month_outlined),
                    ),
                    Text("Date Change"),
                  ],
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Text(
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
  List<Apisearchresponse> data;

  FlightFareCardListView({required this.data});
  @override
  State<FlightFareCardListView> createState() => _FlightFareCardListViewState();
}
