import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/traveller%20details/baggage.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/traveller%20details/meals.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/traveller%20details/passport.dart';
import 'package:travel_mytri_mobile_v1/data/model/Search/flight_search_model.dart';

class TavellerDetails extends StatelessWidget {
  final List<CountryList> cntryList = [
    CountryList(name: 'United States'),
    CountryList(name: 'Canada'),
    CountryList(name: 'Australia'),
    CountryList(name: 'India'),
    CountryList(name: 'Uae'),
    CountryList(name: 'Germany'),
    CountryList(name: 'France'),
    // Add more countries as needed
  ];

  TavellerDetails({super.key});
  @override
  Widget build(BuildContext context) {
    PricingResponse data = ModalRoute.of(context)?.settings.arguments as PricingResponse;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Travellers"),
        centerTitle: false,
      ),
      bottomSheet: InkWell(
          onTap: () {},
          child: Container(
            color: primaryColor,
            height: 80,
            width: double.infinity,
            child: const Center(
                child: Text(
              "CONTINUE",
              style: TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.w600),
            )),
          )),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.grey.shade300,
            child: const Text(
              "Adults",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          (data.objAdtPaxList?.length ?? 0) != 0
              ? SizedBox(
                  height: 245 * (data.objAdtPaxList?.length ?? 0).toDouble(),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.objAdtPaxList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return adultDetails(index, context, data.objAdtPaxList?[index]);
                    },
                  ),
                )
              : const SizedBox(),
          (data.objChdPaxList?.length ?? 0) != 0
              ? Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey.shade300,
                  child: const Text(
                    "Child",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                )
              : SizedBox(),
          (data.objChdPaxList?.length ?? 0) != 0
              ? SizedBox(
                  height: 325 * (data.objChdPaxList?.length ?? 0).toDouble(),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.objChdPaxList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return childDetails(index, context, data.objChdPaxList?[index]);
                    },
                  ),
                )
              : SizedBox(),
          (data.objInfPaxList?.length ?? 0) != 0
              ? Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey.shade300,
                  child: const Text(
                    "Infants",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                )
              : SizedBox(),
          (data.objInfPaxList?.length ?? 0) != 0
              ? SizedBox(
                  height: 325 * 3,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return infantDetails(index, context);
                    },
                  ),
                )
              : SizedBox(),
          const SizedBox(height: 75)
        ],
      ),
    );
  }

  infantDetails(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Infant ${index + 1}", style: const TextStyle(fontSize: 18)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text("First Name"))),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Last Name"))),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Date of Birth"))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                      builder: (context) => PassportDetailsPage(cntryList: cntryList),
                    ))
                    .then((value) => print(value));
              },
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text("Passport"),
              ),
            ),
          ],
        )
      ],
    );
  }

  childDetails(int index, BuildContext context, PricingPaxlist? data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Child${index + 1}", style: const TextStyle(fontSize: 18)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text("First Name"))),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Last Name"))),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Date of Birth"))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                      builder: (context) => PassportDetailsPage(
                        cntryList: cntryList,
                      ),
                    ))
                    .then((value) => print(value));
              },
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text("Passport"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                      builder: (context) => BaggageDetailsPage(data?.objbaggageseglist),
                    ))
                    .then((value) => print(value));
              },
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text("Baggage"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                      builder: (context) => MealDetailsPage(data?.objmealseglist),
                    ))
                    .then((value) => print(value));
              },
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text("Meal"),
              ),
            ),
          ],
        )
      ],
    );
  }

  adultDetails(int index, BuildContext context, PricingPaxlist? data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Adult${index + 1}", style: const TextStyle(fontSize: 18)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text("First Name"))),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Last Name"))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                      builder: (context) => PassportDetailsPage(cntryList: cntryList),
                    ))
                    .then((value) => print(value));
              },
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text("Passport"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                      builder: (context) => BaggageDetailsPage(data?.objbaggageseglist),
                    ))
                    .then((value) => print(value));
              },
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text("Baggage"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                      builder: (context) => MealDetailsPage(data?.objmealseglist),
                    ))
                    .then((value) => print(value));
              },
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text("Meal"),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CountryList {
  String name;
  CountryList({required this.name});
}
