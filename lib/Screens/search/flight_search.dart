import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/search_widgets.dart';
import 'package:travel_mytri_mobile_v1/bottom_navigation.dart';

class ScreenFlightSearchResult extends StatelessWidget {
  const ScreenFlightSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: flightSearchAppBar(context),
      bottomNavigationBar: BottomNavigationBar(backgroundColor: const Color.fromARGB(255, 221, 227, 234), fixedColor: Colors.black, items: [
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
          fareOnDateListView(context),
          Divider(),
          Expanded(child: FlightFareCardListView()),
        ],
      ),
    );
  }

  SizedBox fareOnDateListView(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "14,Mar",
              ),
              Text(
                "₹45517",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return VerticalDivider(
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        bool isSelected = selectedIdx == index;
        return Column(
          children: [
            InkWell(
                onTap: () {
                  selectedIdx = isSelected ? -1 : index;

                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(10)),
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5.0,
                              right: 20,
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    "assets/images/T21.png",
                                    height: 60,
                                    width: 60,
                                  ),
                                ),
                                Text(
                                  "AI 234",
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("05:20", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 4.0),
                                            child: Text("2 hr"),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(Icons.arrow_forward, size: 30),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.business_center,
                                                size: 18,
                                              ),
                                              Text(
                                                "\t20KG ",
                                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey.shade700),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("07:25", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 4.0),
                                            child: Text("Non-Stop"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "₹4517",
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                "Extra 765 off",
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            isSelected
                ? Container(
                    color: Colors.green,
                  )
                : SizedBox(),
          ],
        );
      },
    );
  }
}

class FlightFareCardListView extends StatefulWidget {
  const FlightFareCardListView({
    super.key,
  });

  @override
  State<FlightFareCardListView> createState() => _FlightFareCardListViewState();
}
