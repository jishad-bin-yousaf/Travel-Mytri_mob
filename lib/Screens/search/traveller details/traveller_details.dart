import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/traveller%20details/baggage.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/traveller%20details/meals.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/traveller%20details/passport.dart';
import '../../../data/model/Search/pricing_models.dart';

class ListOfBookingPaxDetails {
  List<BookingPaxdetails> adultPaxList;
  List<BookingPaxdetails> childPaxList;
  List<BookingPaxdetails> infantPaxList;
  ListOfBookingPaxDetails({
    required this.adultPaxList,
    required this.childPaxList,
    required this.infantPaxList,
  });
}

typedef ListCallback = void Function(String);

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

  List<BookingPaxdetails> paxList = [];
  late List<BookingPaxdetails> adultPaxList;
  late List<BookingPaxdetails> childPaxList;
  late List<BookingPaxdetails> infantPaxList;
  ListOfBookingPaxDetails paxDetailsList;

  TavellerDetails({required this.data, required this.paxDetailsList}) {
    initializePaxLists();
  }

  void initializePaxLists() {
    adultPaxList = List.generate(data.objApiResponse?.objAdtPaxList?.length ?? 0, (index) => paxDetailsList.adultPaxList[index]);
    childPaxList = List.generate(data.objApiResponse?.objChdPaxList?.length ?? 0, (index) => paxDetailsList.childPaxList[index]);
    infantPaxList = List.generate(data.objApiResponse?.objInfPaxList?.length ?? 0, (index) => paxDetailsList.infantPaxList[index]);
  }

  @override
  Widget build(BuildContext context) {
    // log((paxDetailsList).toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Travellers"),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      bottomSheet: InkWell(
          onTap: () {
            paxList.addAll(adultPaxList);
            paxList.addAll(childPaxList);
            paxList.addAll(infantPaxList);
            log(paxDetailsList.toString());
            Navigator.pop(context, ListOfBookingPaxDetails(adultPaxList: adultPaxList, childPaxList: childPaxList, infantPaxList: infantPaxList));
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
          (data.objApiResponse?.objAdtPaxList?.length ?? 0) != 0
              ? SizedBox(
                  height: 250 * (data.objApiResponse?.objAdtPaxList?.length ?? 0).toDouble(),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.objApiResponse?.objAdtPaxList?.length ?? 0,
                    itemBuilder: (context, index) {
                      adultPaxList[index].paxKey = data.objApiResponse?.objAdtPaxList?[index].paxKey ?? '';
                      adultPaxList[index].paxType = 'Adult';
                      return adultDetails(
                        index,
                        context,
                        data.objApiResponse?.objAdtPaxList?[index],
                      );
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
                  height: 335 * (data.objApiResponse?.objChdPaxList?.length ?? 0).toDouble(),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.objApiResponse?.objChdPaxList?.length ?? 0,
                    itemBuilder: (context, index) {
                      childPaxList[index].paxKey = data.objApiResponse?.objChdPaxList?[index].paxKey ?? '';
                      childPaxList[index].paxType = 'child';
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
                  height: 335 * (data.objApiResponse?.objInfPaxList?.length ?? 0).toDouble(),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      infantPaxList[index].paxKey = data.objApiResponse?.objInfPaxList?[index].paxKey ?? '';
                      infantPaxList[index].paxType = 'infant';

                      return infantDetails(index, context);
                    },
                  ),
                )
              : SizedBox(),
          const SizedBox(height: 75),
        ],
      ),
    );
  }

  infantDetails(int index, BuildContext context) {
    TextEditingController dobController = TextEditingController(text: paxDetailsList.infantPaxList[index].dateofBirth);
    TextEditingController firstNameController = TextEditingController(text: paxDetailsList.infantPaxList[index].firstName);
    TextEditingController lastNameController = TextEditingController(text: paxDetailsList.infantPaxList[index].lastName);
    infantPaxList[index].title ?? (infantPaxList[index].title = "Mstr");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Infant (${index + 1})", style: const TextStyle(fontSize: 18)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            children: [
              MinorDropDown(
                dropdownValue: childPaxList[index].title ?? "Mstr",
                callBack: (p0) {
                  infantPaxList[index].title = p0;
                },
              ),
              Expanded(
                child: TextField(
                  controller: firstNameController,
                  onChanged: (value) {
                    infantPaxList[index].firstName = value;
                  },
                  decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("First Name")),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            controller: lastNameController,
            onChanged: (value) {
              infantPaxList[index].lastName = value;
            },
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
                //   infantPaxList[index].dateofBirth = DateFormat("dd MMM yyy").format(pickedFromDate ?? DateTime.now());
                infantPaxList[index].dateofBirth = dobController.text;
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                TextEditingController passportNoController = TextEditingController();
                TextEditingController nationalityController = TextEditingController();
                TextEditingController dobController = TextEditingController();
                TextEditingController countryOfIssueController = TextEditingController();
                TextEditingController dateOfExpiryController = TextEditingController();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  passportNoController.text = infantPaxList[index].documentNumber ?? '';
                  countryOfIssueController.text = infantPaxList[index].countryofIssue ?? '';
                  nationalityController.text = infantPaxList[index].nationality ?? '';
                  dobController.text = infantPaxList[index].dateofBirth ?? '';
                  dateOfExpiryController.text = infantPaxList[index].dateOfExpiry ?? "";
                  return PassportDetailsPage(
                    cntryList: cntryList,
                    countryOfIssueController: countryOfIssueController,
                    dateOfExpiryController: dateOfExpiryController,
                    dobController: dobController,
                    nationalityController: nationalityController,
                    passportNoController: passportNoController,
                  );
                })).then((value) {
                  final data = value as PassportDetails;
                  passportNoController = data.passportNoController;

                  print(passportNoController.text);
                  infantPaxList[index].documentNumber = data.passportNoController.text;
                  infantPaxList[index].countryofIssue = data.countryOfIssueController.text;
                  infantPaxList[index].nationality = data.nationalityController.text;
                  infantPaxList[index].dateofBirth = data.dobController.text;
                  infantPaxList[index].dateOfExpiry = data.dateOfExpiryController.text;
                });
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
    TextEditingController dobController = TextEditingController(text: paxDetailsList.childPaxList[index].dateofBirth);
    TextEditingController firstNameController = TextEditingController(text: paxDetailsList.childPaxList[index].firstName);
    TextEditingController lastNameController = TextEditingController(text: paxDetailsList.childPaxList[index].lastName);
    childPaxList[index].title ?? (childPaxList[index].title = "Mstr");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Child (${index + 1})", style: const TextStyle(fontSize: 18)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            children: [
              MinorDropDown(
                dropdownValue: childPaxList[index].title ?? "Mstr",
                callBack: (p0) {
                  childPaxList[index].title = p0;
                },
              ),
              Expanded(
                child: TextField(
                  controller: firstNameController,
                  onChanged: (value) {
                    childPaxList[index].firstName = value;
                  },
                  decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("First Name")),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            controller: lastNameController,
            onChanged: (value) {
              childPaxList[index].lastName = value;
            },
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
                  firstDate: DateTime.now().subtract(Duration(days: 12 * 365)), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime.now().subtract(Duration(days: 2 * 365)),
                );

                pickedFromDate != null ? dobController.text = DateFormat('dd MMMM yyyy').format(pickedFromDate) : '';
                infantPaxList[index].dateofBirth = dobController.text;
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                TextEditingController passportNoController = TextEditingController();
                TextEditingController nationalityController = TextEditingController();
                TextEditingController dobController = TextEditingController();
                TextEditingController countryOfIssueController = TextEditingController();
                TextEditingController dateOfExpiryController = TextEditingController();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  passportNoController.text = childPaxList[index].documentNumber ?? '';
                  countryOfIssueController.text = childPaxList[index].countryofIssue ?? '';
                  nationalityController.text = childPaxList[index].nationality ?? '';
                  dobController.text = childPaxList[index].dateofBirth ?? '';
                  dateOfExpiryController.text = childPaxList[index].dateOfExpiry ?? "";
                  return PassportDetailsPage(
                    cntryList: cntryList,
                    countryOfIssueController: countryOfIssueController,
                    dateOfExpiryController: dateOfExpiryController,
                    dobController: dobController,
                    nationalityController: nationalityController,
                    passportNoController: passportNoController,
                  );
                })).then((value) {
                  final data = value as PassportDetails;
                  passportNoController = data.passportNoController;

                  print(passportNoController.text);
                  childPaxList[index].documentNumber = data.passportNoController.text;
                  childPaxList[index].countryofIssue = data.countryOfIssueController.text;
                  childPaxList[index].nationality = data.nationalityController.text;
                  childPaxList[index].dateofBirth = data.dobController.text;
                  childPaxList[index].dateOfExpiry = data.dateOfExpiryController.text;
                });

                /*          showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    passportNoController.text = childPaxList[index].documentNumber ?? '';
                    countryOfIssueController.text = childPaxList[index].countryofIssue ?? '';
                    nationalityController.text = childPaxList[index].nationality ?? '';
                    dobController.text = childPaxList[index].dateofBirth ?? '';
                    dateOfExpiryController.text = childPaxList[index].dateOfExpiry ?? "";
                    return passportBottomSheet(passportNoController, nationalityController, dobController, countryOfIssueController, dateOfExpiryController);
                  },
                ).then((value) {
                  final data = value as PassportDetails;
                  passportNoController = data.passportNoController;

                  print(passportNoController.text);
                  adultPaxList[index].documentNumber = data.passportNoController.text;
                  adultPaxList[index].countryofIssue = data.countryOfIssueController.text;
                  adultPaxList[index].nationality = data.nationalityController.text;
                  adultPaxList[index].dateofBirth = data.dobController.text;
                  adultPaxList[index].dateOfExpiry = data.dateOfExpiryController.text;
                });
            */
              },
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text("Passport"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //         List<SSRBaggage> baggageList = List.generate(data?.objbaggageseglist?.length ?? 0, (index) => SSRBaggage(amount: 0, key: '', name: '', segmentCode: '', tripMode: ''));

                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => BaggageDetailsPage(data: data?.objbaggageseglist ?? []),
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
    TextEditingController firstNameController = TextEditingController(text: paxDetailsList.adultPaxList[index].firstName);
    TextEditingController lastNameController = TextEditingController(text: paxDetailsList.adultPaxList[index].lastName);
    adultPaxList[index].title ?? (adultPaxList[index].title = "Mr");

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Adult (${index + 1})", style: const TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: [
                AdultDropDown(
                  dropdownValue: adultPaxList[index].title ?? "Mr",
                  callBack: (p0) {
                    adultPaxList[index].title = p0;
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: firstNameController,
                    onChanged: (value) {
                      adultPaxList[index].firstName = value;
                    },
                    decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("First Name")),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              controller: lastNameController,
              onChanged: (value) {
                adultPaxList[index].lastName = value;
              },
              decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("Last Name")),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  TextEditingController passportNoController = TextEditingController();
                  TextEditingController nationalityController = TextEditingController();
                  TextEditingController dobController = TextEditingController();
                  TextEditingController countryOfIssueController = TextEditingController();
                  TextEditingController dateOfExpiryController = TextEditingController();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    passportNoController.text = adultPaxList[index].documentNumber ?? '';
                    countryOfIssueController.text = adultPaxList[index].countryofIssue ?? '';
                    nationalityController.text = adultPaxList[index].nationality ?? '';
                    dobController.text = adultPaxList[index].dateofBirth ?? '';
                    dateOfExpiryController.text = adultPaxList[index].dateOfExpiry ?? "";
                    return PassportDetailsPage(
                      cntryList: cntryList,
                      countryOfIssueController: countryOfIssueController,
                      dateOfExpiryController: dateOfExpiryController,
                      dobController: dobController,
                      nationalityController: nationalityController,
                      passportNoController: passportNoController,
                    );
                  })).then((value) {
                    final data = value as PassportDetails;
                    passportNoController = data.passportNoController;
                    print(passportNoController.text);
                    adultPaxList[index].documentNumber = data.passportNoController.text;
                    adultPaxList[index].countryofIssue = data.countryOfIssueController.text;
                    adultPaxList[index].nationality = data.nationalityController.text;
                    adultPaxList[index].dateofBirth = data.dobController.text;
                    adultPaxList[index].dateOfExpiry = data.dateOfExpiryController.text;
                  });
                },

                // onPressed: () {
                //   Navigator.of(context)
                //       .push(MaterialPageRoute(
                //         builder: (context) => PassportDetailsPage(cntryList: cntryList),
                //       ))
                //       .then((value) {});
                // },
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text("Passport"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  //         adultPaxList[index].objBaggage = List.generate(data?.objbaggageseglist?.length ?? 0, (index) => SSRBaggage(amount: 0, key: '', name: '', segmentCode: '', tripMode: ''));

                  Navigator.of(context)
                      .push(MaterialPageRoute(
                    builder: (context) => BaggageDetailsPage(data: data?.objbaggageseglist ?? []),
                  ))
                      .then((value) {
                    adultPaxList[index].objBaggage = value ?? [] as List<SSRBaggage>?;
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
                  //     adultPaxList[index].objMealList = List.generate(data?.objbaggageseglist?.length ?? 0, (index) => SSRMeal(amount: 0, key: '', name: '', segmentCode: '', tripMode: ''));

                  Navigator.of(context)
                      .push(MaterialPageRoute(
                    builder: (context) => MealDetailsPage(data?.objmealseglist),
                  ))
                      .then((value) {
                    adultPaxList[index].objMealList = value ?? [] as List<SSRMeal>?;
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
      ),
    );
  }
}

class CountryList {
  String name;
  CountryList({required this.name});
}

class PassportDetails {
  TextEditingController passportNoController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController countryOfIssueController = TextEditingController();
  TextEditingController dateOfExpiryController = TextEditingController();

  PassportDetails({
    required this.passportNoController,
    required this.nationalityController,
    required this.dobController,
    required this.countryOfIssueController,
    required this.dateOfExpiryController,
  });
}

class AdultDropDown extends StatefulWidget {
  final ListCallback callBack;
  String dropdownValue;
  AdultDropDown({super.key, required this.callBack, required this.dropdownValue});
  @override
  _AdultDropDownState createState() => _AdultDropDownState();
}

class _AdultDropDownState extends State<AdultDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: DropdownButton<String>(
        value: widget.dropdownValue,
        //  icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        //  style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          //  color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? newValue) {
          widget.callBack(newValue ?? '');
          setState(() {
            widget.dropdownValue = newValue ?? '';
          });
        },
        items: <String>['Mr', 'Ms', 'Mrs'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class MinorDropDown extends StatefulWidget {
  final ListCallback callBack;
  String dropdownValue;
  MinorDropDown({super.key, required this.callBack, required this.dropdownValue});
  @override
  _MinorDropDownState createState() => _MinorDropDownState();
}

class _MinorDropDownState extends State<MinorDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: DropdownButton<String>(
        value: widget.dropdownValue,
        //  icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        //  style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          //  color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? newValue) {
          widget.callBack(newValue ?? '');
          setState(() {
            widget.dropdownValue = newValue ?? '';
          });
        },
        items: <String>['Mstr', 'Miss'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
