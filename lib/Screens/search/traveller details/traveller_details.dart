/* import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/traveller%20details/baggage.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/traveller%20details/meals.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/traveller%20details/passport.dart';
import '../../../data/model/Search/pricing_models.dart';

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
  final PricingResponse data;
  final RepricingRequest requestingData = RepricingRequest();
  late List<RePricingPaxlist> adultPaxList;
  late List<RePricingPaxlist> childPaxList;
  late List<RePricingPaxlist> infantPaxList;

  TavellerDetails({required this.data}) {
    initializePaxLists();
  }

  void initializePaxLists() {
    adultPaxList = List.generate(data.objApiResponse?.objAdtPaxList?.length ?? 0, (index) => RePricingPaxlist());
    childPaxList = List.generate(data.objApiResponse?.objChdPaxList?.length ?? 0, (index) => RePricingPaxlist());
    infantPaxList = List.generate(data.objApiResponse?.objInfPaxList?.length ?? 0, (index) => RePricingPaxlist());
  }

  @override
  Widget build(BuildContext context) {
    log(jsonEncode(data).toString());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Travellers"),
          centerTitle: false,
          automaticallyImplyLeading: false,
        ),
        bottomSheet: InkWell(
            onTap: () {
              requestingData.objAdtPaxList = adultPaxList;
              requestingData.objChdPaxList = childPaxList;
              requestingData.objInfPaxList = infantPaxList;
              Navigator.pop(context, requestingData);
            },
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
        body: travellerDetails());
  }

  ListView travellerDetails() {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.grey.shade300,
          child: const Text(
            "Adults",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        (data.objApiResponse?.objAdtPaxList?.length ?? 0) != 0
            ? SizedBox(
                height: 245 * (data.objApiResponse?.objAdtPaxList?.length ?? 0).toDouble(),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.objApiResponse?.objAdtPaxList?.length ?? 0,
                  itemBuilder: (context, index) {
                    adultPaxList[index].paxKey = data.objApiResponse?.objAdtPaxList?[index].paxKey ?? '';
                    return adultDetails(index, context, data.objApiResponse?.objAdtPaxList?[index]);
                  },
                ),
              )
            : const SizedBox(),
        (data.objApiResponse?.objChdPaxList?.length ?? 0) != 0
            ? Container(
                padding: const EdgeInsets.all(8),
                color: Colors.grey.shade300,
                child: const Text(
                  "Child",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              )
            : SizedBox(),
        (data.objApiResponse?.objChdPaxList?.length ?? 0) != 0
            ? SizedBox(
                height: 325 * (data.objApiResponse?.objChdPaxList?.length ?? 0).toDouble(),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.objApiResponse?.objChdPaxList?.length ?? 0,
                  itemBuilder: (context, index) {
                    childPaxList[index].paxKey = data.objApiResponse?.objChdPaxList?[index].paxKey ?? '';

                    return childDetails(index, context, data.objApiResponse?.objChdPaxList?[index]);
                  },
                ),
              )
            : SizedBox(),
        (data.objApiResponse?.objInfPaxList?.length ?? 0) != 0
            ? Container(
                padding: const EdgeInsets.all(8),
                color: Colors.grey.shade300,
                child: const Text(
                  "Infants",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              )
            : SizedBox(),
        (data.objApiResponse?.objInfPaxList?.length ?? 0) != 0
            ? SizedBox(
                height: 325 * 3,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    //  infantPaxList[index].paxKey = data.objInfPaxList?[index].paxKey ?? '';

                    return infantDetails(index, context);
                  },
                ),
              )
            : SizedBox(),
        const SizedBox(height: 75)
      ],
    );
  }

  infantDetails(int index, BuildContext context) {
    TextEditingController dobController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Infant ${index + 1}", style: const TextStyle(fontSize: 18)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            controller: firstNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("First Name"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            controller: lastNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Last Name"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
              controller: dobController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Date of Birth"),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedFromDate = await showDatePicker(
                    context: context,
                    currentDate: DateTime.now().subtract(Duration(days: 2 * 365)),
                    initialDate: DateTime.now().subtract(Duration(days: 2 * 365)) /* .subtract(const Duration(days: 30)) */, //get today's date
                    firstDate: DateTime.now().subtract(Duration(days: 2 * 365)), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime.now());
                pickedFromDate != null ? dobController.text = DateFormat('dd MMMM yyyy').format(pickedFromDate) : '';
              }),
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
    TextEditingController dobController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Child${index + 1}", style: const TextStyle(fontSize: 18)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            controller: firstNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("First Name"),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            controller: lastNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Last Name"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Date of Birth"),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedFromDate = await showDatePicker(
                  context: context,
                  currentDate: DateTime.now().subtract(Duration(days: 2 * 365)),
                  initialDate: DateTime.now().subtract(Duration(days: 2 * 365)) /* .subtract(const Duration(days: 30)) */, //get today's date
                  firstDate: DateTime.now().subtract(Duration(days: 12 * 365)), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime.now().subtract(Duration(days: 2 * 365)),
                );
                pickedFromDate != null ? dobController.text = DateFormat('dd MMMM yyyy').format(pickedFromDate) : '';
              }),
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
                    .then((value) {
                  childPaxList[index].objBaggage = value as List<SSRBaggage>?;
                });
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
                    .then((value) {
                  childPaxList[index].objMealList = value as List<SSRMeal>?;
                });
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
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Adult${index + 1}", style: const TextStyle(fontSize: 18)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            controller: firstNameController,
            decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("First Name")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            controller: lastNameController,
            decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("Last Name")),
          ),
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
                    .then((value) {});
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
                    .then((value) {
                  adultPaxList[index].objBaggage = value as List<SSRBaggage>?;
                });
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
                    .then((value) {
                  adultPaxList[index].objMealList = value as List<SSRMeal>?;
                });
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
 */
class CountryList {
  String name;
  CountryList({required this.name});
}
