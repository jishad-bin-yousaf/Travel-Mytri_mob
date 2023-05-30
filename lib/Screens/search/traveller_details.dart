import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';

class TavellerDetails extends StatelessWidget {
  const TavellerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Travellers"),
        centerTitle: false,
      ),
      bottomSheet: InkWell(
          onTap: () {},
          child: Container(
            color: primaryColor,
            height: 80,
            width: double.infinity,
            child: Center(
                child: Text(
              "CONTINUE",
              style: TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.w600),
            )),
          )),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.grey.shade300,
            child: Text(
              "Adults",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 300 * 3,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Adult${index + 1}", style: TextStyle(fontSize: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: TextField(decoration: InputDecoration(border: OutlineInputBorder())),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
