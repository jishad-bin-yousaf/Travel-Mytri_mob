import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/confirmation.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
import 'package:travel_mytri_mobile_v1/data/api.dart';

import '../../data/model/Search/pricing_models.dart';
import 'traveller details/baggage.dart';
import 'traveller details/meals.dart';
import 'traveller details/traveller_details.dart';

class ScreenReviewFlight extends StatefulWidget {
  ScreenReviewFlight({super.key});

  @override
  State<ScreenReviewFlight> createState() => _ScreenReviewFlightState();
}

class _ScreenReviewFlightState extends State<ScreenReviewFlight> {
  RepricingRequest req = RepricingRequest();
  BookingRequest bookingRequest = BookingRequest();

  TextEditingController contactController = TextEditingController();

  TextEditingController alternateContactController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  bool travelDetails = false;

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
  late List<BookingPaxdetails> adultPaxList;
  late List<BookingPaxdetails> childPaxList;
  late List<BookingPaxdetails> infantPaxList;

  final RepricingRequest requestingData = RepricingRequest();

  num totalBaggageAndMealAmount = 0;

  @override
  Widget build(BuildContext context) {
    PricingResponse data = ModalRoute.of(context)?.settings.arguments as PricingResponse;

    adultPaxList = List.generate(data.objApiResponse?.objAdtPaxList?.length ?? 0, (index) => BookingPaxdetails());
    childPaxList = List.generate(data.objApiResponse?.objChdPaxList?.length ?? 0, (index) => BookingPaxdetails());
    infantPaxList = List.generate(data.objApiResponse?.objInfPaxList?.length ?? 0, (index) => BookingPaxdetails());

    return Scaffold(
      /*     bottomSheet: Container(
        height: 80,
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  TextButton.icon(
                      onPressed: () {
                        pricingBottomSheet(context, data);
                      },
                      label: Icon(
                        Icons.info_outline,
                        color: white,
                      ),
                      icon: Text("${data.objApiResponse?.finalAmount ?? ""}", style: TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.bold)))
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  req.fareId = data.fareId;
                  req.fareIdR = data.fareIdR;
                  req.itinId = data.itinId;
                  req.itinIdR = data.itinIdR;
                  req.providerCode = data.providerCode;
                  req.providerCodeR = data.providerCodeR;
                  PricingApi().getRepricing(req).then((value) {
                    if ((value?.status == true) && value != null) {
                      rePricingBottomSheet(context, value, data);
                    } else {
                      Helper().toastMessage("Try Again");
                      Navigator.pushNamedAndRemoveUntil(context, "/flights", (route) => false);
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 50),
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text("CONTINUE", style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ), */
      appBar: AppBar(
        title: Text("Review Flight"),
        centerTitle: false,
      ),
      floatingActionButton: travelDetails
          ? FloatingActionButton(
              child: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                travelDetails = false;
                setState(() {});
              },
            )
          : null,
      body: ListView(
        //  physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: (data.objApiResponse?.objSegList?.length ?? 0) * 230,
            child: reviewArea(data, context),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Traveller Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //   child: OutlinedButton(
                //     onPressed: () {
                //       travelDetails = true;
                //       setState(() {});
                //     },
                //     style: ButtonStyle(
                //       side: MaterialStateProperty.all(
                //         BorderSide(color: Colors.grey.shade800),
                //       ),
                //     ),
                //     child: Text("Add Travellers", style: TextStyle(color: Colors.black, fontSize: 20)),
                //   ),
                // )
              ],
            ),
          ),
          SizedBox(
            height: (300 * (data.objApiResponse?.objAdtPaxList?.length ?? 0).toDouble()) + (335 * (data.objApiResponse?.objChdPaxList?.length ?? 0).toDouble()) + (335 * (data.objApiResponse?.objInfPaxList?.length ?? 0).toDouble()),
            child: travellerDetails(data, context),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 12),
            child: Text(
              "Traveller Contact",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: travellerContact(),
          ),
          Container(
            //    height: 80,
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            pricingBottomSheet(context, data);
                          },
                          label: Icon(
                            Icons.info_outline,
                            color: white,
                          ),
                          icon: Text("${data.objApiResponse?.finalAmount ?? ""}", style: TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.bold)))
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      req.fareId = data.fareId;
                      req.fareIdR = data.fareIdR;
                      req.itinId = data.itinId;
                      req.itinIdR = data.itinIdR;
                      req.providerCode = data.providerCode;
                      req.providerCodeR = data.providerCodeR;

                      bookingRequest.fareId = data.fareId;
                      bookingRequest.fareIdR = data.fareIdR;
                      bookingRequest.itinId = data.itinId;
                      bookingRequest.itinIdR = data.itinIdR;
                      bookingRequest.providerCode = data.providerCode;
                      bookingRequest.providerCodeR = data.providerCodeR;
                      bookingRequest.contactEmail = emailController.text;
                      bookingRequest.alternateContactNumber = alternateContactController.text;
                      bookingRequest.contactNumber = contactController.text;
                      PricingApi().getRepricing(req).then((value) {
                        if ((value?.status == true) && value != null) {
                          rePricingBottomSheet(context, value, data);
                        } else {
                          Helper().toastMessage("Try Again");
                          Navigator.pushNamedAndRemoveUntil(context, "/flights", (route) => false);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 50),
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text("CONTINUE", style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView travellerDetails(PricingResponse data, BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
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
                height: 325 * (data.objApiResponse?.objInfPaxList?.length ?? 0).toDouble(),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.objApiResponse?.objInfPaxList?.length ?? 0,
                  itemBuilder: (context, index) {
                    infantPaxList[index].paxKey = data.objApiResponse?.objInfPaxList?[index].paxKey ?? '';

                    return infantDetails(index, context);
                  },
                ),
              )
            : SizedBox(),
        const SizedBox(height: 75),
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
            onChanged: (value) {
              infantPaxList[index].firstName = value;
            },
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
                infantPaxList[index].dateofBirth = pickedFromDate.toString();
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
                showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    passportNoController.text = infantPaxList[index].documentNumber ?? '';
                    countryOfIssueController.text = infantPaxList[index].countryofIssue ?? '';
                    nationalityController.text = infantPaxList[index].nationality ?? '';
                    dobController.text = infantPaxList[index].dateofBirth ?? '';
                    dateOfExpiryController.text = infantPaxList[index].dateOfExpiry ?? "";
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
            onChanged: (value) {
              childPaxList[index].firstName = value;
            },
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
                showModalBottomSheet(
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
              },
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text("Passport"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                List<SSRBaggage> baggageList = List.generate(data?.objbaggageseglist?.length ?? 0, (index) => SSRBaggage(amount: 0, key: '', name: '', segmentCode: '', tripMode: ''));

                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => BaggageDetailsPage(data: data?.objbaggageseglist ?? [], baggageList: baggageList),
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
            onChanged: (value) {
              adultPaxList[index].firstName = value;
            },
            decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("First Name")),
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
                showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    passportNoController.text = adultPaxList[index].documentNumber ?? '';
                    countryOfIssueController.text = adultPaxList[index].countryofIssue ?? '';
                    nationalityController.text = adultPaxList[index].nationality ?? '';
                    dobController.text = adultPaxList[index].dateofBirth ?? '';
                    dateOfExpiryController.text = adultPaxList[index].dateOfExpiry ?? "";
                    return passportBottomSheet(passportNoController, nationalityController, dobController, countryOfIssueController, dateOfExpiryController);
                  },
                ).then((value) {
                  final data = value as PassportDetails?;

                  adultPaxList[index].documentNumber = data?.passportNoController.text ?? "";
                  adultPaxList[index].countryofIssue = data?.countryOfIssueController.text ?? "";
                  adultPaxList[index].nationality = data?.nationalityController.text ?? "";
                  adultPaxList[index].dateofBirth = data?.dobController.text ?? "";
                  adultPaxList[index].dateOfExpiry = data?.dateOfExpiryController.text ?? "";
                  firstNameController.text = adultPaxList[index].firstName ?? 'value is null';
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
                adultPaxList[index].objBaggage = List.generate(data?.objbaggageseglist?.length ?? 0, (index) => SSRBaggage(amount: 0, key: '', name: '', segmentCode: '', tripMode: ''));

                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => BaggageDetailsPage(data: data?.objbaggageseglist ?? [], baggageList: adultPaxList[index].objBaggage ?? []),
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

  SafeArea reviewArea(PricingResponse data, BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: (data.objApiResponse?.objSegList?.length ?? 0) * 210,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.objApiResponse?.objSegList?.length ?? 0,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 10),
                      Card(
                        color: Colors.grey.shade300,
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                "https://agents.alhind.com/images/logos/${data.objApiResponse?.objSegList?[index].airlineCode ?? ''}.gif",
                                /*${data.airlineName}.*/

                                fit: BoxFit.fitHeight,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Text("No logo");
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(data.objApiResponse?.objSegList?[index].airlineName ?? ''),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0, right: 5),
                                child: Text(data.objApiResponse?.objSegList?[index].airlineFlightClass ?? ''),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0, right: 25),
                                child: Text(data.objApiResponse?.objSegList?[index].cabinBaggage ?? ''),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 14, top: 15, bottom: 15),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Expanded(
                            //  width: MediaQuery.of(context).size.width / 2 - 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.objApiResponse?.objSegList?[index].departureCity ?? '',
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    "${data.objApiResponse?.objSegList?[index].departureAirportCode ?? ''} ${data.objApiResponse?.objSegList?[index].departureTime ?? ''}",
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    data.objApiResponse?.objSegList?[index].departureAirport ?? '',
                                    maxLines: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    data.objApiResponse?.objSegList?[index].departureDate ?? '',
                                    maxLines: 2,
                                  ),
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
                              Text(
                                data.objApiResponse?.objSegList?[index].travelDuration ?? '',
                              )
                            ],
                          ),
                          Expanded(
                            // width: MediaQuery.of(context).size.width / 2 - 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  data.objApiResponse?.objSegList?[index].arrivalCity ?? '',
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    "${data.objApiResponse?.objSegList?[index].arrivalAirportCode ?? ''} ${data.objApiResponse?.objSegList?[index].arrivalTime ?? ''}",
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    data.objApiResponse?.objSegList?[index].arrivalAirport ?? '',
                                    maxLines: 2,
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    data.objApiResponse?.objSegList?[index].arrivalDate ?? '',
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  );
                }),
          ),
          Divider(thickness: 1, color: Colors.black),
        ],
      ),
    );
  }

  pricingBottomSheet(BuildContext context, PricingResponse data) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fare Summary",
                    style: TextStyle(fontSize: 23),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close)),
                ],
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                height: 70,
                color: primaryColor,
                child: Text(
                  "₹ ${data.objApiResponse?.finalAmount ?? ''}",
                  //  textAlign: TextAlign.center,
                  style: TextStyle(color: white, fontWeight: FontWeight.w800, fontSize: 30),
                ),
              ),
              baseFare(data),
              taxesAndFee(data),
              //   baggageAndMeal(),
              Card(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 70,
                  //  color: Colors.grey.shade400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "You Pay",
                        //  textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                      ),
                      Text(
                        "₹ ${data.objApiResponse?.finalAmount ?? ''}",
                        //  textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  rePricingBottomSheet(BuildContext context, RepriceResponse data, PricingResponse value) {
    return showModalBottomSheet(
      // isScrollControlled: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fare Summary",
                    style: TextStyle(fontSize: 23),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close)),
                ],
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                height: 70,
                color: primaryColor,
                child: Text(
                  "₹ ${data.finalAmount ?? ''}",
                  //  textAlign: TextAlign.center,
                  style: TextStyle(color: white, fontWeight: FontWeight.w800, fontSize: 30),
                ),
              ),
              rePricingBaseFare(data),
              rePricingTaxesAndFee(data),
              baggageAndMeal(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "You Pay",
                    //  textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                  ),
                  Text(
                    "₹ ${data.finalAmount ?? ''}",
                    //  textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    "Are you sure you want to continue the booking?",
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      PricingApi().bookTicket(bookingRequest).then((value) {
                        if (value != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ConfirmationScreen(data: value),
                            ),
                          );
                        } else {
                          Helper().toastMessage("Sorry Not Booked");
                          Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
                        }
                      });
                    },
                    child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width / 2 - 10,
                        color: secondaryColor,
                        child: Center(
                            child: Text(
                          "PROCEED TO PAYMENT",
                          style: TextStyle(
                            fontSize: 17,
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                        ))),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width / 2 - 10,
                        color: Colors.grey,
                        child: Center(
                            child: Text(
                          "CANCEL",
                          style: TextStyle(
                            fontSize: 17,
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                        ))),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Padding baseFare(PricingResponse data) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Base Fare (${(data.adult ?? 0) + (data.child ?? 0) + (data.infant ?? 0)} Travellers)",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "${(data.objApiResponse?.adultBasic ?? 0) + (data.objApiResponse?.childBasic ?? 0) + (data.objApiResponse?.infantBasic ?? 0)}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Adult X ${data.adult ?? 0}",
                  //        style: TextStyle(fontSize: 18),
                ),
                Text(
                  "${(data.objApiResponse?.adultBasic ?? 0) * (data.adult ?? 0)}",
                  //   style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Child X ${data.child ?? 0}",
                  // style: TextStyle(fontSize: 18),
                ),
                Text(
                  "${data.objApiResponse?.childBasic ?? 0}",
                  //     style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Infant X ${data.infant ?? 0}",
                  //    style: TextStyle(fontSize: 18),
                ),
                Text(
                  "${data.objApiResponse?.infantBasic ?? 0}",
                  //    style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding taxesAndFee(PricingResponse data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Taxes & Fees",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "${data.objApiResponse?.totalTax ?? '7886'}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 25 * (data.objApiResponse?.taxList?.length ?? 0).toDouble(),
            child: ListView.builder(
              itemCount: data.objApiResponse?.taxList?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.objApiResponse?.taxList?[index].taxCode ?? '',
                        //    style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${data.objApiResponse?.taxList?[index].amount ?? 0}",
                        //    style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Padding baggageAndMeal() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Baggage & Meals",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "Rs ${totalBaggageAndMealAmount}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Padding rePricingBaseFare(RepriceResponse data) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Base Fare (${(data.adult ?? 0) + (data.child ?? 0) + (data.infant ?? 0)} Travellers)",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "${(data.adultBasic ?? 0) + (data.childBasic ?? 0) + (data.infantBasic ?? 0)}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Adult X ${data.adult ?? 0}",
                  //        style: TextStyle(fontSize: 18),
                ),
                Text(
                  "${(data.adultBasic ?? 0) * (data.adult ?? 0)}",
                  //   style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Child X ${data.child ?? 0}",
                  // style: TextStyle(fontSize: 18),
                ),
                Text(
                  "${data.childBasic ?? 0}",
                  //     style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Infant X ${data.infant ?? 0}",
                  //    style: TextStyle(fontSize: 18),
                ),
                Text(
                  "${data.infantBasic ?? 0}",
                  //    style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding rePricingTaxesAndFee(RepriceResponse data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Taxes & Fees",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "${data.totalTax ?? 0}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 25 * (data.taxList?.length ?? 0).toDouble(),
            child: ListView.builder(
              itemCount: data.taxList?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.taxList?[index].taxCode ?? '',
                        //    style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${data.taxList?[index].amount ?? 0}",
                        //    style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Column travellerContact() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: contactController,
            decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Contact Number")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: alternateContactController,
            decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Alternate Contact Number")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Email ID")),
          ),
        ),
      ],
    );
  }

  ListView passportBottomSheet(TextEditingController passportNoController, nationalityController, dobController, countryOfIssueController, dateOfExpiryController) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "Note : Traveller's passport should be valid for 6 months from the date of travel.",
            maxLines: 2,
            style: TextStyle(color: Colors.red),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TypeAheadField<CountryList>(
              hideSuggestionsOnKeyboardHide: true,
              debounceDuration: const Duration(milliseconds: 500),
              suggestionsCallback: (query) async => getList(query),
              itemBuilder: (context, itemData) => SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        itemData.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
              textFieldConfiguration: TextFieldConfiguration(
                controller: nationalityController,
                autofocus: true,
                //  controller: departureController,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  label: Text("Nationality"),
                  border: OutlineInputBorder(),
                ),
              ),
              noItemsFoundBuilder: (context) => const SizedBox(
                    height: 80,
                    child: Center(child: Text("No Airports Found")),
                  ),
              onSuggestionSelected: (suggestion) {
                nationalityController.text = suggestion.name;
                // originCode = suggestion.cityCode ?? '';
                // originCountry = suggestion.countryCode ?? '';
                // departureController.text = "${suggestion.cityName?.toUpperCase() ?? ''} - ${suggestion.cityCode?.toUpperCase() ?? ''}";
                // departure = departureController.text;
                // deptAirportName = suggestion.airportName ?? '';
                // showDepTypeField = true;
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            controller: passportNoController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Passport Number"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
              readOnly: true,
              controller: dobController,
              onTap: () async {
                DateTime? pickedFromDate = await showDatePicker(
                  context: context,
                  currentDate: DateTime.now(),
                  initialDate: DateTime.now() /* .subtract(const Duration(days: 30)) */, //get today's date
                  firstDate: DateTime(1920), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime.now(),
                );

                pickedFromDate != null ? dobController.text = DateFormat('dd MMMM yyyy').format(pickedFromDate) : '';
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.date_range_outlined),
                border: OutlineInputBorder(),
                label: Text("Date of birth"),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TypeAheadField<CountryList>(
              hideSuggestionsOnKeyboardHide: true,
              debounceDuration: const Duration(milliseconds: 500),
              suggestionsCallback: (query) async => getList(query),
              itemBuilder: (context, itemData) => SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        itemData.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
              textFieldConfiguration: TextFieldConfiguration(
                controller: countryOfIssueController,
                autofocus: true,
                //  controller: departureController,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  label: Text("Country of Issue"),
                  border: OutlineInputBorder(),
                ),
              ),
              noItemsFoundBuilder: (context) => const SizedBox(
                    height: 80,
                    child: Center(child: Text("Not Found")),
                  ),
              onSuggestionSelected: (suggestion) {
                countryOfIssueController.text = suggestion.name;
                // originCode = suggestion.cityCode ?? '';
                // originCountry = suggestion.countryCode ?? '';
                // departureController.text = "${suggestion.cityName?.toUpperCase() ?? ''} - ${suggestion.cityCode?.toUpperCase() ?? ''}";
                // departure = departureController.text;
                // deptAirportName = suggestion.airportName ?? '';
                // showDepTypeField = true;
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
              readOnly: true,
              controller: dateOfExpiryController,
              onTap: () async {
                DateTime? pickedFromDate = await showDatePicker(
                  context: context,
                  currentDate: DateTime.now(),
                  initialDate: DateTime.now() /* .subtract(const Duration(days: 30)) */, //get today's date
                  firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2100),
                );

                pickedFromDate != null ? dateOfExpiryController.text = DateFormat('dd MMMM yyyy').format(pickedFromDate) : '';
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.date_range_outlined),
                border: OutlineInputBorder(),
                label: Text("Date of expiry"),
              )),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
            onPressed: () {
              print(passportNoController.text);
              Navigator.pop(
                  context,
                  PassportDetails(
                    passportNoController: passportNoController,
                    countryOfIssueController: countryOfIssueController,
                    dateOfExpiryController: dateOfExpiryController,
                    dobController: dobController,
                    nationalityController: nationalityController,
                  ));
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width - 50, 50),
              backgroundColor: secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text("Submit"))
      ],
    );
  }

  Future<List<CountryList>> getList(String query) async {
    List<CountryList> filteredFlights = [];

    final cityCodeList = cntryList.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
    filteredFlights.addAll(cityCodeList);
    log(filteredFlights.toString());
    return filteredFlights;
  }
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

/* 
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/confirmation.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
import 'package:travel_mytri_mobile_v1/data/api.dart';

import '../../data/model/Search/pricing_models.dart';
import 'traveller details/baggage.dart';
import 'traveller details/meals.dart';
import 'traveller details/traveller_details.dart';

class ScreenReviewFlight extends StatefulWidget {
  ScreenReviewFlight({super.key});

  @override
  State<ScreenReviewFlight> createState() => _ScreenReviewFlightState();
}

class _ScreenReviewFlightState extends State<ScreenReviewFlight> {
  RepricingRequest req = RepricingRequest();
  BookingRequest bookingRequest = BookingRequest();

  TextEditingController contactController = TextEditingController();

  TextEditingController alternateContactController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  bool travelDetails = false;

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
  late List<BookingPaxdetails> adultPaxList;
  late List<BookingPaxdetails> childPaxList;
  late List<BookingPaxdetails> infantPaxList;

  final RepricingRequest requestingData = RepricingRequest();

  num totalBaggageAndMealAmount = 0;

  @override
  Widget build(BuildContext context) {
    PricingResponse data = ModalRoute.of(context)?.settings.arguments as PricingResponse;

    adultPaxList = List.generate(data.objApiResponse?.objAdtPaxList?.length ?? 0, (index) => BookingPaxdetails());
    childPaxList = List.generate(data.objApiResponse?.objChdPaxList?.length ?? 0, (index) => BookingPaxdetails());
    infantPaxList = List.generate(data.objApiResponse?.objInfPaxList?.length ?? 0, (index) => BookingPaxdetails());

    return Scaffold(
      /*     bottomSheet: Container(
        height: 80,
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  TextButton.icon(
                      onPressed: () {
                        pricingBottomSheet(context, data);
                      },
                      label: Icon(
                        Icons.info_outline,
                        color: white,
                      ),
                      icon: Text("${data.objApiResponse?.finalAmount ?? ""}", style: TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.bold)))
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  req.fareId = data.fareId;
                  req.fareIdR = data.fareIdR;
                  req.itinId = data.itinId;
                  req.itinIdR = data.itinIdR;
                  req.providerCode = data.providerCode;
                  req.providerCodeR = data.providerCodeR;
                  PricingApi().getRepricing(req).then((value) {
                    if ((value?.status == true) && value != null) {
                      rePricingBottomSheet(context, value, data);
                    } else {
                      Helper().toastMessage("Try Again");
                      Navigator.pushNamedAndRemoveUntil(context, "/flights", (route) => false);
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 50),
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text("CONTINUE", style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ), */
      appBar: AppBar(
        title: Text("Review Flight"),
        centerTitle: false,
      ),
      floatingActionButton: travelDetails
          ? FloatingActionButton(
              child: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                travelDetails = false;
                setState(() {});
              },
            )
          : null,
      body: ListView(
        //  physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: (data.objApiResponse?.objSegList?.length ?? 0) * 230,
            child: reviewArea(data, context),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Traveller Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //   child: OutlinedButton(
                //     onPressed: () {
                //       travelDetails = true;
                //       setState(() {});
                //     },
                //     style: ButtonStyle(
                //       side: MaterialStateProperty.all(
                //         BorderSide(color: Colors.grey.shade800),
                //       ),
                //     ),
                //     child: Text("Add Travellers", style: TextStyle(color: Colors.black, fontSize: 20)),
                //   ),
                // )
              ],
            ),
          ),
          SizedBox(
            height: (300 * (data.objApiResponse?.objAdtPaxList?.length ?? 0).toDouble()) + (335 * (data.objApiResponse?.objChdPaxList?.length ?? 0).toDouble()) + (335 * (data.objApiResponse?.objInfPaxList?.length ?? 0).toDouble()),
            child: travellerDetails(data, context),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 12),
            child: Text(
              "Traveller Contact",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: travellerContact(),
          ),
          Container(
            //    height: 80,
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            pricingBottomSheet(context, data);
                          },
                          label: Icon(
                            Icons.info_outline,
                            color: white,
                          ),
                          icon: Text("${data.objApiResponse?.finalAmount ?? ""}", style: TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.bold)))
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      req.fareId = data.fareId;
                      req.fareIdR = data.fareIdR;
                      req.itinId = data.itinId;
                      req.itinIdR = data.itinIdR;
                      req.providerCode = data.providerCode;
                      req.providerCodeR = data.providerCodeR;

                      bookingRequest.fareId = data.fareId;
                      bookingRequest.fareIdR = data.fareIdR;
                      bookingRequest.itinId = data.itinId;
                      bookingRequest.itinIdR = data.itinIdR;
                      bookingRequest.providerCode = data.providerCode;
                      bookingRequest.providerCodeR = data.providerCodeR;
                      bookingRequest.contactEmail = emailController.text;
                      bookingRequest.alternateContactNumber = alternateContactController.text;
                      bookingRequest.contactNumber = contactController.text;
                      PricingApi().getRepricing(req).then((value) {
                        if ((value?.status == true) && value != null) {
                          rePricingBottomSheet(context, value, data);
                        } else {
                          Helper().toastMessage("Try Again");
                          Navigator.pushNamedAndRemoveUntil(context, "/flights", (route) => false);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 50),
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text("CONTINUE", style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView travellerDetails(PricingResponse data, BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
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
                height: 325 * (data.objApiResponse?.objInfPaxList?.length ?? 0).toDouble(),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.objApiResponse?.objInfPaxList?.length ?? 0,
                  itemBuilder: (context, index) {
                    infantPaxList[index].paxKey = data.objApiResponse?.objInfPaxList?[index].paxKey ?? '';

                    return infantDetails(index, context);
                  },
                ),
              )
            : SizedBox(),
        const SizedBox(height: 75),
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
            onChanged: (value) {
              infantPaxList[index].firstName = value;
            },
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
                infantPaxList[index].dateofBirth = pickedFromDate.toString();
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
                showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    passportNoController.text = infantPaxList[index].documentNumber ?? '';
                    countryOfIssueController.text = infantPaxList[index].countryofIssue ?? '';
                    nationalityController.text = infantPaxList[index].nationality ?? '';
                    dobController.text = infantPaxList[index].dateofBirth ?? '';
                    dateOfExpiryController.text = infantPaxList[index].dateOfExpiry ?? "";
                    return passportBottomSheet(passportNoController, nationalityController, dobController, countryOfIssueController, dateOfExpiryController);
                  },
                ).then((value) {
                  final data = value as PassportDetails;
                  passportNoController = data.passportNoController;

                  print(passportNoController.text);
                  infantPaxList[index].documentNumber = data.passportNoController.text;
                  infantPaxList[index].countryofIssue = data.countryOfIssueController.text;
                  infantPaxList[index].nationality = data.nationalityController.text;
                  infantPaxList[index].dateofBirth = data.dobController.text;
                  infantPaxList[index].dateOfExpiry = data.dateOfExpiryController.text;
                  firstNameController.text = infantPaxList[index].firstName ?? "";
                  lastNameController.text = infantPaxList[index].lastName ?? "";
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
            onChanged: (value) {
              childPaxList[index].firstName = value;
              firstNameController.text = childPaxList[index].firstName ?? "";
            },
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
            onChanged: (value) {
              childPaxList[index].lastName = value;

              lastNameController.text = childPaxList[index].lastName ?? "";
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
                showModalBottomSheet(
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
                  firstNameController.text = childPaxList[index].firstName ?? "";
                  lastNameController.text = childPaxList[index].lastName ?? "";
                  dobController.text = childPaxList[index].dateofBirth ?? "";
                  adultPaxList[index].documentNumber = data.passportNoController.text;
                  adultPaxList[index].countryofIssue = data.countryOfIssueController.text;
                  adultPaxList[index].nationality = data.nationalityController.text;
                  adultPaxList[index].dateofBirth = data.dobController.text;
                  adultPaxList[index].dateOfExpiry = data.dateOfExpiryController.text;
                });
              },
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text("Passport"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                List<SSRBaggage> baggageList = List.generate(data?.objbaggageseglist?.length ?? 0, (index) => SSRBaggage(amount: 0, key: '', name: '', segmentCode: '', tripMode: ''));

                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => BaggageDetailsPage(data: data?.objbaggageseglist ?? [], baggageList: baggageList),
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
            onChanged: (value) {
              adultPaxList[index].firstName = value;
              //    firstNameController.text = adultPaxList[index].firstName ?? "";
            },
            decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("First Name")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            controller: lastNameController,
            onChanged: (value) {
              adultPaxList[index].lastName = value;

              //    lastNameController.text = adultPaxList[index].lastName ?? "";
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

                showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    Future.microtask(() {
                      passportNoController.text = adultPaxList[index].documentNumber ?? '';
                      countryOfIssueController.text = adultPaxList[index].countryofIssue ?? '';
                      nationalityController.text = adultPaxList[index].nationality ?? '';
                      dobController.text = adultPaxList[index].dateofBirth ?? '';
                      dateOfExpiryController.text = adultPaxList[index].dateOfExpiry ?? "";
                      firstNameController.text = adultPaxList[index].firstName ?? "";
                      lastNameController.text = adultPaxList[index].lastName ?? "";
                    });
                    return passportBottomSheet(passportNoController, nationalityController, dobController, countryOfIssueController, dateOfExpiryController);
                  },
                ).then((value) {
                  final data = value as PassportDetails?;

                  setState(() {
                    adultPaxList[index].documentNumber = data?.passportNoController.text ?? "";
                    adultPaxList[index].countryofIssue = data?.countryOfIssueController.text ?? "";
                    adultPaxList[index].nationality = data?.nationalityController.text ?? "";
                    adultPaxList[index].dateofBirth = data?.dobController.text ?? "";
                    adultPaxList[index].dateOfExpiry = data?.dateOfExpiryController.text ?? "";
                  });
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
                adultPaxList[index].objBaggage = List.generate(data?.objbaggageseglist?.length ?? 0, (index) => SSRBaggage(amount: 0, key: '', name: '', segmentCode: '', tripMode: ''));

                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => BaggageDetailsPage(data: data?.objbaggageseglist ?? [], baggageList: adultPaxList[index].objBaggage ?? []),
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

  SafeArea reviewArea(PricingResponse data, BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: (data.objApiResponse?.objSegList?.length ?? 0) * 210,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.objApiResponse?.objSegList?.length ?? 0,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 10),
                      Card(
                        color: Colors.grey.shade300,
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                "https://agents.alhind.com/images/logos/${data.objApiResponse?.objSegList?[index].airlineCode ?? ''}.gif",
                                /*${data.airlineName}.*/

                                fit: BoxFit.fitHeight,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Text("No logo");
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(data.objApiResponse?.objSegList?[index].airlineName ?? ''),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0, right: 5),
                                child: Text(data.objApiResponse?.objSegList?[index].airlineFlightClass ?? ''),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0, right: 25),
                                child: Text(data.objApiResponse?.objSegList?[index].cabinBaggage ?? ''),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 14, top: 15, bottom: 15),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Expanded(
                            //  width: MediaQuery.of(context).size.width / 2 - 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.objApiResponse?.objSegList?[index].departureCity ?? '',
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    "${data.objApiResponse?.objSegList?[index].departureAirportCode ?? ''} ${data.objApiResponse?.objSegList?[index].departureTime ?? ''}",
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    data.objApiResponse?.objSegList?[index].departureAirport ?? '',
                                    maxLines: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    data.objApiResponse?.objSegList?[index].departureDate ?? '',
                                    maxLines: 2,
                                  ),
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
                              Text(
                                data.objApiResponse?.objSegList?[index].travelDuration ?? '',
                              )
                            ],
                          ),
                          Expanded(
                            // width: MediaQuery.of(context).size.width / 2 - 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  data.objApiResponse?.objSegList?[index].arrivalCity ?? '',
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    "${data.objApiResponse?.objSegList?[index].arrivalAirportCode ?? ''} ${data.objApiResponse?.objSegList?[index].arrivalTime ?? ''}",
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    data.objApiResponse?.objSegList?[index].arrivalAirport ?? '',
                                    maxLines: 2,
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    data.objApiResponse?.objSegList?[index].arrivalDate ?? '',
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  );
                }),
          ),
          Divider(thickness: 1, color: Colors.black),
        ],
      ),
    );
  }

  pricingBottomSheet(BuildContext context, PricingResponse data) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fare Summary",
                    style: TextStyle(fontSize: 23),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close)),
                ],
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                height: 70,
                color: primaryColor,
                child: Text(
                  "₹ ${data.objApiResponse?.finalAmount ?? ''}",
                  //  textAlign: TextAlign.center,
                  style: TextStyle(color: white, fontWeight: FontWeight.w800, fontSize: 30),
                ),
              ),
              baseFare(data),
              taxesAndFee(data),
              //   baggageAndMeal(),
              Card(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 70,
                  //  color: Colors.grey.shade400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "You Pay",
                        //  textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                      ),
                      Text(
                        "₹ ${data.objApiResponse?.finalAmount ?? ''}",
                        //  textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  rePricingBottomSheet(BuildContext context, RepriceResponse data, PricingResponse value) {
    return showModalBottomSheet(
      // isScrollControlled: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fare Summary",
                    style: TextStyle(fontSize: 23),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close)),
                ],
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                height: 70,
                color: primaryColor,
                child: Text(
                  "₹ ${data.finalAmount ?? ''}",
                  //  textAlign: TextAlign.center,
                  style: TextStyle(color: white, fontWeight: FontWeight.w800, fontSize: 30),
                ),
              ),
              rePricingBaseFare(data),
              rePricingTaxesAndFee(data),
              baggageAndMeal(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "You Pay",
                    //  textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                  ),
                  Text(
                    "₹ ${data.finalAmount ?? ''}",
                    //  textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    "Are you sure you want to continue the booking?",
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      PricingApi().bookTicket(bookingRequest).then((value) {
                        if (value != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ConfirmationScreen(data: value),
                            ),
                          );
                        } else {
                          Helper().toastMessage("Sorry Not Booked");
                          Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
                        }
                      });
                    },
                    child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width / 2 - 10,
                        color: secondaryColor,
                        child: Center(
                            child: Text(
                          "PROCEED TO PAYMENT",
                          style: TextStyle(
                            fontSize: 17,
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                        ))),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width / 2 - 10,
                        color: Colors.grey,
                        child: Center(
                            child: Text(
                          "CANCEL",
                          style: TextStyle(
                            fontSize: 17,
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                        ))),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Padding baseFare(PricingResponse data) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Base Fare (${(data.adult ?? 0) + (data.child ?? 0) + (data.infant ?? 0)} Travellers)",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "${(data.objApiResponse?.adultBasic ?? 0) + (data.objApiResponse?.childBasic ?? 0) + (data.objApiResponse?.infantBasic ?? 0)}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Adult X ${data.adult ?? 0}",
                  //        style: TextStyle(fontSize: 18),
                ),
                Text(
                  "${(data.objApiResponse?.adultBasic ?? 0) * (data.adult ?? 0)}",
                  //   style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Child X ${data.child ?? 0}",
                  // style: TextStyle(fontSize: 18),
                ),
                Text(
                  "${data.objApiResponse?.childBasic ?? 0}",
                  //     style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Infant X ${data.infant ?? 0}",
                  //    style: TextStyle(fontSize: 18),
                ),
                Text(
                  "${data.objApiResponse?.infantBasic ?? 0}",
                  //    style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding taxesAndFee(PricingResponse data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Taxes & Fees",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "${data.objApiResponse?.totalTax ?? '7886'}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 25 * (data.objApiResponse?.taxList?.length ?? 0).toDouble(),
            child: ListView.builder(
              itemCount: data.objApiResponse?.taxList?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.objApiResponse?.taxList?[index].taxCode ?? '',
                        //    style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${data.objApiResponse?.taxList?[index].amount ?? 0}",
                        //    style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Padding baggageAndMeal() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Baggage & Meals",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "Rs ${totalBaggageAndMealAmount}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Padding rePricingBaseFare(RepriceResponse data) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Base Fare (${(data.adult ?? 0) + (data.child ?? 0) + (data.infant ?? 0)} Travellers)",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "${(data.adultBasic ?? 0) + (data.childBasic ?? 0) + (data.infantBasic ?? 0)}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Adult X ${data.adult ?? 0}",
                  //        style: TextStyle(fontSize: 18),
                ),
                Text(
                  "${(data.adultBasic ?? 0) * (data.adult ?? 0)}",
                  //   style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Child X ${data.child ?? 0}",
                  // style: TextStyle(fontSize: 18),
                ),
                Text(
                  "${data.childBasic ?? 0}",
                  //     style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Infant X ${data.infant ?? 0}",
                  //    style: TextStyle(fontSize: 18),
                ),
                Text(
                  "${data.infantBasic ?? 0}",
                  //    style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding rePricingTaxesAndFee(RepriceResponse data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Taxes & Fees",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "${data.totalTax ?? 0}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 25 * (data.taxList?.length ?? 0).toDouble(),
            child: ListView.builder(
              itemCount: data.taxList?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.taxList?[index].taxCode ?? '',
                        //    style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${data.taxList?[index].amount ?? 0}",
                        //    style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Column travellerContact() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: contactController,
            decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Contact Number")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: alternateContactController,
            decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Alternate Contact Number")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Email ID")),
          ),
        ),
      ],
    );
  }

  ListView passportBottomSheet(TextEditingController passportNoController, nationalityController, dobController, countryOfIssueController, dateOfExpiryController) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "Note : Traveller's passport should be valid for 6 months from the date of travel.",
            maxLines: 2,
            style: TextStyle(color: Colors.red),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TypeAheadField<CountryList>(
              hideSuggestionsOnKeyboardHide: true,
              debounceDuration: const Duration(milliseconds: 500),
              suggestionsCallback: (query) async => getList(query),
              itemBuilder: (context, itemData) => SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        itemData.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
              textFieldConfiguration: TextFieldConfiguration(
                controller: nationalityController,
                autofocus: true,
                //  controller: departureController,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  label: Text("Nationality"),
                  border: OutlineInputBorder(),
                ),
              ),
              noItemsFoundBuilder: (context) => const SizedBox(
                    height: 80,
                    child: Center(child: Text("No Airports Found")),
                  ),
              onSuggestionSelected: (suggestion) {
                nationalityController.text = suggestion.name;
                // originCode = suggestion.cityCode ?? '';
                // originCountry = suggestion.countryCode ?? '';
                // departureController.text = "${suggestion.cityName?.toUpperCase() ?? ''} - ${suggestion.cityCode?.toUpperCase() ?? ''}";
                // departure = departureController.text;
                // deptAirportName = suggestion.airportName ?? '';
                // showDepTypeField = true;
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            controller: passportNoController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Passport Number"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
              readOnly: true,
              controller: dobController,
              onTap: () async {
                DateTime? pickedFromDate = await showDatePicker(
                  context: context,
                  currentDate: DateTime.now(),
                  initialDate: DateTime.now() /* .subtract(const Duration(days: 30)) */, //get today's date
                  firstDate: DateTime(1920), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime.now(),
                );

                pickedFromDate != null ? dobController.text = DateFormat('dd MMMM yyyy').format(pickedFromDate) : '';
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.date_range_outlined),
                border: OutlineInputBorder(),
                label: Text("Date of birth"),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TypeAheadField<CountryList>(
              hideSuggestionsOnKeyboardHide: true,
              debounceDuration: const Duration(milliseconds: 500),
              suggestionsCallback: (query) async => getList(query),
              itemBuilder: (context, itemData) => SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        itemData.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
              textFieldConfiguration: TextFieldConfiguration(
                controller: countryOfIssueController,
                autofocus: true,
                //  controller: departureController,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  label: Text("Country of Issue"),
                  border: OutlineInputBorder(),
                ),
              ),
              noItemsFoundBuilder: (context) => const SizedBox(
                    height: 80,
                    child: Center(child: Text("Not Found")),
                  ),
              onSuggestionSelected: (suggestion) {
                countryOfIssueController.text = suggestion.name;
                // originCode = suggestion.cityCode ?? '';
                // originCountry = suggestion.countryCode ?? '';
                // departureController.text = "${suggestion.cityName?.toUpperCase() ?? ''} - ${suggestion.cityCode?.toUpperCase() ?? ''}";
                // departure = departureController.text;
                // deptAirportName = suggestion.airportName ?? '';
                // showDepTypeField = true;
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
              readOnly: true,
              controller: dateOfExpiryController,
              onTap: () async {
                DateTime? pickedFromDate = await showDatePicker(
                  context: context,
                  currentDate: DateTime.now(),
                  initialDate: DateTime.now() /* .subtract(const Duration(days: 30)) */, //get today's date
                  firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2100),
                );

                pickedFromDate != null ? dateOfExpiryController.text = DateFormat('dd MMMM yyyy').format(pickedFromDate) : '';
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.date_range_outlined),
                border: OutlineInputBorder(),
                label: Text("Date of expiry"),
              )),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
            onPressed: () {
              print(passportNoController.text);
              Navigator.pop(
                  context,
                  PassportDetails(
                    passportNoController: passportNoController,
                    countryOfIssueController: countryOfIssueController,
                    dateOfExpiryController: dateOfExpiryController,
                    dobController: dobController,
                    nationalityController: nationalityController,
                  ));
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width - 50, 50),
              backgroundColor: secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text("Submit"))
      ],
    );
  }

  Future<List<CountryList>> getList(String query) async {
    List<CountryList> filteredFlights = [];

    final cityCodeList = cntryList.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
    filteredFlights.addAll(cityCodeList);
    log(filteredFlights.toString());
    return filteredFlights;
  }
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
 */