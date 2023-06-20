import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Timer _timer;
  int _secondsRemaining = 600;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_secondsRemaining <= 0) {
          timer.cancel();
          _showBottomSheet();
        } else {
          _secondsRemaining--;
        }
      });
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          // BottomSheet content
          height: 200,
          color: Colors.white,
          child: Center(
            child: Text(
              "Payment completed!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  String _formatTime() {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;
    String formattedTime = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    return formattedTime;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make Payment"),
        centerTitle: false,
        bottom: PreferredSize(
          child: Container(
            color: secondaryColor,
            height: 40,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "Time left to complete payment :  ${_formatTime()}",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          preferredSize: Size(double.infinity, 30),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            height: 60 * 2,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        "https://agents.alhind.com/images/logos/g9.gif",
                        /*${data.airlineName}.*/

                        fit: BoxFit.fitHeight,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text("No logo");
                        },
                      ),
                      Column(
                        children: [
                          Text(
                            "CCJ 22:30",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                          Text("Fri, 28 May"),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.arrow_forward),
                          Text("4h 20 min"),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "CCJ 22:30",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                          Text("Fri, 28 May"),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1 Traveller",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        "Base Fare",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
                      ),
                    ),
                    Text(
                      "Tax",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        "GST",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
                      ),
                    ),
                    Text(
                      "Cost",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        "Grand Total",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Color.fromARGB(255, 191, 87, 0)),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "1 Traveller",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        "Base Fare",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
                      ),
                    ),
                    Text(
                      "Tax",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        "GST",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
                      ),
                    ),
                    Text(
                      "Cost",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        "Grand Total",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Color.fromARGB(255, 191, 87, 0)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Amount to Pay : 99998",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.grey.shade300,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    "assets/icons/card.png",
                    height: 25,
                  ),
                ),
                Text(
                  "CREDIT / DEBIT CARD",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.grey.shade300,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    "assets/icons/upi.png",
                    height: 25,
                  ),
                ),
                Text(
                  "UPI PAYMENT METHOD",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/icons/phonepe.png",
                  height: 35,
                ),
                Image.asset(
                  "assets/icons/gpay.png",
                  height: 35,
                ),
                Image.asset(
                  "assets/icons/paytm.png",
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, right: 10),
                  child: Image.asset(
                    "assets/icons/amazonpay.png",
                    height: 25,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                    width: 20,
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    )),
                Text(" OR ", style: TextStyle(fontSize: 20)),
                SizedBox(
                    width: 20,
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Text(
              "Enter Virtual payment Address",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "username@bankname",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    "assets/icons/upi.png",
                    height: 10,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              color: secondaryColor,
              height: 60,
              alignment: Alignment.center,
              child: Text(
                "MAKE PAYMENT",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
