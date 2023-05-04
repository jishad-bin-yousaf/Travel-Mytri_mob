import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';

class ScreenFlightSearchResult extends StatelessWidget {
  const ScreenFlightSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SizedBox(
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
          ),
          Divider()
        ],
      ),
    );
  }
}
