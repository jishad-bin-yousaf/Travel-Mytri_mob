import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScreenReviewFlight extends StatelessWidget {
  const ScreenReviewFlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review Flight"),
        centerTitle: false,
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("New Delhi",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              ),
              Icon(Icons.arrow_forward, size: 25),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Bombay",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 5),
                child: Text("Economy"),
              ),
              Icon(
                Icons.circle,
                size: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text("Non-Stop"),
              ),
              Icon(
                Icons.circle,
                size: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text("3h"),
              ),
              Icon(
                Icons.circle,
                size: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text("Thu 24 April"),
              ),
            ],
          ),
          Card(
            color: Colors.grey.shade300,
            elevation: 0,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/T21.png",
                  width: 100,
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("Air Arabia AI 838"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 14, top: 15, bottom: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New Delhi",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "DEL 21:40",
                            style: TextStyle(fontSize: 23),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            "Indira gandhi international AIRPORT",
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          "Terminal - 1",
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.access_time_outlined),
                      ),
                      Text("2h 48m")
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Kozhikkode",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "CCJ 21:40",
                            style: TextStyle(fontSize: 23),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            "Kozhikkode international AIRPORT",
                            maxLines: 2,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Text(
                          "Terminal - 1",
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          Divider(thickness: 1, color: Colors.black),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 12),
            child: Text(
              "Traveller Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 12),
            child: Text(
              "Traveller Contact",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: travellerDetails(),
          // ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: travellerContact(),
          ),
        ],
      )),
    );
  }

  Column travellerContact() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text("Contact Number")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Alternate Contact Number")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text("Email ID")),
          ),
        ),
      ],
    );
  }

  travellerDetails() {
    return Column(
      children: [
        Row(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Contact Number")),
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Alternate Contact Number")),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text("Email ID")),
          ),
        ),
      ],
    );
  }
}
