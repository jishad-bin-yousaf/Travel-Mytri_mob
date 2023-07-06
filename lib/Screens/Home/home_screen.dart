import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/Login/login_pop_up.dart';
import 'package:travel_mytri_mobile_v1/bottom_navigation.dart';
import 'package:travel_mytri_mobile_v1/data/model/hive_class_functions.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  bool isLogged = false;
  String? userName = "";
  @override
  void initState() {
    getToken().then((value) {
      log(isLogged.toString());
      isLogged = value.isUser ?? false;
      userName = value.firstName ?? "User";
      log((userName).toString() + " userDetails");
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 180,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () {
              !isLogged ? loginBottomSheet(context, width) : null;
            },
            icon: const Icon(Icons.account_circle_outlined, color: Colors.white),
            label: Text(
              "Hi ${userName ?? ""}",
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 60),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/flights');
                        },
                        child: Container(
                          width: width * 0.25,
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
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: width * 0.25,
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
                          width: width * 0.25,
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
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 32, left: 10, bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Top Flight Deals",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 170,
                            viewportFraction: 0.5,
                            //  enlargeCenterPage: true,
                            //     autoPlay: true,
                            //     pauseAutoPlayOnManualNavigate: true,
                            animateToClosest: true,
                            autoPlayCurve: Curves.easeInOutCubicEmphasized,
                            autoPlayInterval: const Duration(seconds: 3),
                          ),
                          items: [
                            topFlightDealsCard(width),
                            topFlightDealsCard(width),
                            topFlightDealsCard(width),
                            topFlightDealsCard(width),
                            topFlightDealsCard(width),
                            topFlightDealsCard(width),
                            topFlightDealsCard(width),
                            // Add more items to the list if you need to display multiple containers
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 15,
                            left: 15,
                            bottom: 15,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Best Airline Deals",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 130,

                            viewportFraction: 0.5 /*,  enlargeCenterPage: true */,
                            // autoPlay: true,
                            //  pauseAutoPlayOnManualNavigate: true,
                            animateToClosest: true,
                            autoPlayCurve: Curves.easeInOutCubicEmphasized,
                            autoPlayInterval: const Duration(seconds: 3),
                          ),
                          items: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Image.asset('assets/airline_deals/Air11.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Image.asset('assets/airline_deals/Air21.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Image.asset('assets/airline_deals/Air31.png'),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 15,
                            left: 15,
                            bottom: 15,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Discover our best hotels to stay",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 0.5,
                            //     enlargeCenterPage: true,
                            //     autoPlay: true,
                            //     pauseAutoPlayOnManualNavigate: true,
                            animateToClosest: true,
                            autoPlayCurve: Curves.easeInOutCubicEmphasized,
                            autoPlayInterval: const Duration(seconds: 3),
                          ),
                          items: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                        child: Image.asset('assets/hotels/Hotel11.png'),
                                      ),
                                      Positioned(
                                        top: 5,
                                        left: 5,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: secondaryColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(5),
                                          child: const Text(
                                            " 18% off!",
                                            style: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 18),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(top: 10, bottom: 2.0),
                                            child: Text(
                                              "Marriott Hotel",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: const [
                                              Icon(Icons.location_on_outlined),
                                              Text(
                                                "Kochi",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        "19,983",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                        child: Image.asset('assets/hotels/Hotel21.png'),
                                      ),
                                      Positioned(
                                        top: 5,
                                        left: 5,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: secondaryColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(5),
                                          child: const Text(
                                            " 18% off!",
                                            style: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 18),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(top: 10, bottom: 2.0),
                                            child: Text(
                                              "Marriott Hotel",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: const [
                                              Icon(Icons.location_on_outlined),
                                              Text(
                                                "Kochi",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        "12,983",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                        child: Image.asset('assets/hotels/Hotel31.png'),
                                      ),
                                      Positioned(
                                        top: 5,
                                        left: 5,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: secondaryColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(5),
                                          child: const Text(
                                            " 18% off!",
                                            style: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 18),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(top: 10, bottom: 2.0),
                                            child: Text(
                                              "Marriott Hotel",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: const [
                                              Icon(Icons.location_on_outlined),
                                              Text(
                                                "Kochi",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        "14,983",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  color: white,
                                  border: Border.all(
                                    color: const Color.fromRGBO(186, 186, 186, 1),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      "Assured best fares",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.payments_outlined)
                                  ],
                                ),
                              ),
                              Container(
                                width: width / 3 - 10,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  color: white,
                                  border: Border.all(
                                    color: const Color.fromRGBO(186, 186, 186, 1),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      "Easy Booking",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.security_update_good_rounded)
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  color: white,
                                  border: Border.all(
                                    color: const Color.fromRGBO(186, 186, 186, 1),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      "Safe & secure",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.security_rounded)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container topFlightDealsCard(double width) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: secondaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(2.0),
            child: Text(
              "Flat 15% Off!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "TRV",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 11),
                                )),
                            Text(
                              "Trivandrum",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      Transform.rotate(
                        angle: 90 * 3.14 / 180, // 90 degrees in radians
                        child: Icon(Icons.airplanemode_active, color: Colors.grey.shade600),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "AUH",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 11),
                                )),
                            Text(
                              "Abudhabi",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Travel Between",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Mar 15,Tue - Apr 1,Wed",
                      style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 50),
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: const Text(
                        "87779",
                        style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
