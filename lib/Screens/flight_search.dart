import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';

class ScreenFlightSearchResult extends StatelessWidget {
  const ScreenFlightSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        actions: [IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.edit_outlined))],
        title: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: const [
                Text(
                  'DEL\t',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                Text(
                  '\tBOM',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ]),
              const Text(
                "5 April",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              const Text(
                "1 Traveller",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              const Text(
                "Economy",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          fareOnDateListView(context),
          Divider(),
          Expanded(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return fightFareCard(context, index);
            },
          ))
        ],
      ),
    );
  }

  fightFareCard(context, index) {
    return InkWell(
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
                          Icon(Icons.arrow_forward, size: 30),
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
              children: [
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
    ));
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
