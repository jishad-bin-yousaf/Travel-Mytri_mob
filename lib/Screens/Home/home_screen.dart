import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/login_pop_up.dart';
import 'package:travel_mytri_mobile_v1/bottom_navigation.dart';

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
            onPressed: () {
              loginBottomSheet(context, width);
            },
            icon: const Icon(Icons.account_circle_outlined, color: Colors.white),
            label: const Text(
              "Hi User !",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25),
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
            Column(
              children: [
                SizedBox(
                    //        width: MediaQuery.of(context).,
                    height: width / height <= 0.67
                        ? height - (height * 0.75) - (width * 0.23) - 65
                        : (width / height > 0.67) && (width / height <= 0.92)
                            ? height - (height * 0.75) - (width * 0.23)
                            : width - (width * 0.75) - (height * 0.23)),
                Row(
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
                          height: width * 0.35,
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
                          top: 30,
                          left: 15,
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
                          height: width * 0.35,
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
                          height: width * 0.5,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              color: white,
                              border: Border.all(
                                color: Color.fromRGBO(186, 186, 186, 1),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "Assured best fares",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.payments_outlined)
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              color: white,
                              border: Border.all(
                                color: Color.fromRGBO(186, 186, 186, 1),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "Easy Booking",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.security_update_good_rounded)
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              color: white,
                              border: Border.all(
                                color: Color.fromRGBO(186, 186, 186, 1),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "Safe & secure",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.security_rounded)
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
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
                fontWeight: FontWeight.bold,
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
  // Color.fromARGB(255, 241, 131, 39)
}
