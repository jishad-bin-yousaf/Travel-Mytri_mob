import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/bottom_navigation.dart';
//import 'package:carousel_slider/carousel_slider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 180,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined, color: Colors.white),
            label: const Text(
              "Hi User !",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
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
                height: height * 0.75,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
              ),
            ),
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.075, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: width * 0.25,
                          height: width * 0.23,
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
                          height: width * 0.23,
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
                          height: width * 0.23,
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
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Top Flight Deals",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: width * 0.35,
                        viewportFraction: 0.5,

                        // enlargeCenterPage: true,
                        autoPlay: true,
                        pauseAutoPlayOnManualNavigate: true,
                        autoPlayInterval: const Duration(milliseconds: 100)),
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
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 15, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Best Airline Deals",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  topFlightDealsCard(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
                  fontWeight: FontWeight.bold,
                  color: white,
                  fontSize: 16,
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
                        child: Text(
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
      ),
    );
  }
  // Color.fromARGB(255, 241, 131, 39)
}
