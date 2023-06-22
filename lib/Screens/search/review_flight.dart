import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/payment/payment.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
import 'package:travel_mytri_mobile_v1/data/api.dart';

import '../../data/model/Search/pricing_models.dart';
import 'traveller details/traveller_details.dart';

class ScreenReviewFlight extends StatefulWidget {
  ScreenReviewFlight({super.key});

  @override
  State<ScreenReviewFlight> createState() => _ScreenReviewFlightState();
}

class _ScreenReviewFlightState extends State<ScreenReviewFlight> {
  bool addGst = false;

  RepricingRequest req = RepricingRequest();

  BookingRequest bookingRequest = BookingRequest();

  ListOfBookingPaxDetails paxDetailsList = ListOfBookingPaxDetails(adultPaxList: [], childPaxList: [], infantPaxList: []);

  TextEditingController contactController = TextEditingController();

  TextEditingController alternateContactController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController gstNumberController = TextEditingController();

  TextEditingController gstCompanyNameController = TextEditingController();

  TextEditingController gstEmailController = TextEditingController();

  TextEditingController gstMobileController = TextEditingController();

  TextEditingController gstAddressController = TextEditingController();

  TextEditingController gstCityController = TextEditingController();

  TextEditingController gstPinCodeController = TextEditingController();

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

  final RepricingRequest requestingData = RepricingRequest();

  num totalBaggageAndMealAmount = 0;

  List<RePricingPaxlist> rePricingAdtList = [];

  List<RePricingPaxlist> rePricingChdList = [];

  List<RePricingPaxlist> rePricingInfList = [];

  // @override
  @override
  Widget build(BuildContext context) {
    PricingResponse data = ModalRoute.of(context)?.settings.arguments as PricingResponse;
    paxDetailsList.adultPaxList = List.generate(data.objApiResponse?.objAdtPaxList?.length ?? 0, (index) => BookingPaxdetails());
    paxDetailsList.childPaxList = List.generate(data.objApiResponse?.objChdPaxList?.length ?? 0, (index) => BookingPaxdetails());
    paxDetailsList.infantPaxList = List.generate(data.objApiResponse?.objInfPaxList?.length ?? 0, (index) => BookingPaxdetails());

    return Scaffold(
      bottomSheet: bottomSheet(context, data),
      appBar: AppBar(
        title: const Text("Review Flight"),
        centerTitle: false,
      ),
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
                const Text(
                  "Traveller Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          log(paxDetailsList.toString());
                          return TavellerDetails(data: data, paxDetailsList: paxDetailsList);
                        },
                      )).then((value) {
                        List<BookingPaxdetails> pax = [];
                        paxDetailsList = value ??
                            ListOfBookingPaxDetails(
                              adultPaxList: List.generate(data.objApiResponse?.objAdtPaxList?.length ?? 0, (index) => BookingPaxdetails()),
                              childPaxList: List.generate(data.objApiResponse?.objChdPaxList?.length ?? 0, (index) => BookingPaxdetails()),
                              infantPaxList: List.generate(data.objApiResponse?.objChdPaxList?.length ?? 0, (index) => BookingPaxdetails()),
                            );
                        pax.addAll(paxDetailsList.adultPaxList);
                        pax.addAll(paxDetailsList.childPaxList);
                        pax.addAll(paxDetailsList.infantPaxList);
                        log(pax.toString());
                        bookingRequest.objPaxList = pax;
                        for (BookingPaxdetails bookingPax in pax) {
                          if (bookingPax.objMealList != null) {
                            for (SSRMeal meal in bookingPax.objMealList!) {
                              totalBaggageAndMealAmount += meal.amount ?? 0.0;
                            }
                          }
                          if (bookingPax.objBaggage != null) {
                            for (SSRBaggage baggage in bookingPax.objBaggage!) {
                              totalBaggageAndMealAmount += baggage.amount ?? 0.0;
                            }
                          }
                        }
                      });
                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(color: Colors.grey.shade800),
                      ),
                    ),
                    child: const Text("Add Travellers", style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12.0, bottom: 12),
            child: Text(
              "Traveller Contact",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: travellerContact(),
          ),
          Row(
            children: [
              Checkbox.adaptive(
                value: addGst,
                onChanged: (value) {
                  setState(() => addGst = !addGst);
                },
              ),
              InkWell(
                onTap: () {
                  setState(() => addGst = !addGst);
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 12.0,
                  ),
                  child: Text(
                    "I would like to add my GSTIN (optional)",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          addGst ? gstDetails() : SizedBox(),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Padding gstDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: gstNumberController,
              decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("GST Number")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: gstCompanyNameController,
              decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("Company Name")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: gstEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("Email ID")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: gstMobileController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("Mobile Number")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: gstAddressController,
              decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("Address")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: gstCityController,
              decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("City")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: gstPinCodeController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(6),
              ],
              decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("Pincode")),
            ),
          ),
        ],
      ),
    );
  }

  Container bottomSheet(BuildContext context, PricingResponse data) {
    return Container(
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
                    label: const Icon(
                      Icons.info_outline,
                      color: white,
                    ),
                    icon: Text("${data.objApiResponse?.finalAmount ?? ""}", style: const TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.bold)))
              ],
            ),
            ElevatedButton(
              onPressed: () {
                for (BookingPaxdetails bookingPax in paxDetailsList.adultPaxList) {
                  RePricingPaxlist rePricingPax = RePricingPaxlist(
                    paxKey: bookingPax.paxKey,
                    objMealList: bookingPax.objMealList,
                    objBaggage: bookingPax.objBaggage,
                    //     objSeatList: bookingPax.objSeatList,
                  );
                  rePricingAdtList.add(rePricingPax);
                }
                for (BookingPaxdetails bookingPax in paxDetailsList.childPaxList) {
                  RePricingPaxlist rePricingPax = RePricingPaxlist(
                    paxKey: bookingPax.paxKey,
                    objMealList: bookingPax.objMealList,
                    objBaggage: bookingPax.objBaggage,
                    //     objSeatList: bookingPax.objSeatList,
                  );
                  rePricingChdList.add(rePricingPax);
                }
                for (BookingPaxdetails bookingPax in paxDetailsList.infantPaxList) {
                  RePricingPaxlist rePricingPax = RePricingPaxlist(
                    paxKey: bookingPax.paxKey,
                    objMealList: bookingPax.objMealList,
                    objBaggage: bookingPax.objBaggage,
                    //      objSeatList: bookingPax.objSeatList,
                  );
                  rePricingInfList.add(rePricingPax);
                }
                req.fareId = data.fareId;
                req.fareIdR = data.fareIdR;
                req.itinId = data.itinId;
                req.itinIdR = data.itinIdR;
                req.providerCode = data.providerCode;
                req.providerCodeR = data.providerCodeR;
                req.objAdtPaxList = rePricingAdtList;
                req.objChdPaxList = rePricingChdList;
                req.objInfPaxList = rePricingInfList;

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
                    //   Navigator.pushNamedAndRemoveUntil(context, "/flights", (route) => false);
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 50),
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
    );
  }

  SafeArea reviewArea(PricingResponse data, BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: (data.objApiResponse?.objSegList?.length ?? 0) * 210,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.objApiResponse?.objSegList?.length ?? 0,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 10),
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
                                    style: const TextStyle(fontSize: 23),
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
                              const Padding(
                                padding: EdgeInsets.all(4.0),
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
                                    style: const TextStyle(fontSize: 23),
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
          const Divider(thickness: 1, color: Colors.black),
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
                  const Text(
                    "Fare Summary",
                    style: TextStyle(fontSize: 23),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close)),
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
                  style: const TextStyle(color: white, fontWeight: FontWeight.w800, fontSize: 30),
                ),
              ),
              baseFare(data),
              taxesAndFee(data),
              baggageAndMeal(),
              Card(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 70,
                  //  color: Colors.grey.shade400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "You Pay",
                        //  textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                      ),
                      Text(
                        "₹ ${data.objApiResponse?.finalAmount ?? ''}",
                        //  textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
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
    totalBaggageAndMealAmount = data.ssrTotal ?? 0.0;
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
                  const Text(
                    "Fare Summary",
                    style: TextStyle(fontSize: 23),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close)),
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
                  style: const TextStyle(color: white, fontWeight: FontWeight.w800, fontSize: 30),
                ),
              ),
              rePricingBaseFare(data),
              rePricingTaxesAndFee(data),
              baggageAndMeal(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "You Pay",
                    //  textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                  ),
                  Text(
                    "₹ ${data.finalAmount ?? ''}",
                    //  textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
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
                      if (addGst) {
                        bookingRequest.objGst = BookingGstDetails(
                          address: gstAddressController.text,
                          city: gstCityController.text,
                          companyName: gstCompanyNameController.text,
                          email: gstEmailController.text,
                          gstNumber: gstNumberController.text,
                          mobile: gstMobileController.text,
                          pincode: int.tryParse(gstPinCodeController.text),
                        );
                      } else {
                        bookingRequest.objGst = BookingGstDetails(
                          address: "",
                          city: "",
                          companyName: "",
                          email: "",
                          gstNumber: "",
                          mobile: "",
                          pincode: 0,
                        );
                      }
                      PricingApi().bookTicket(bookingRequest).then((value) {
                        if (value != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PaymentPage(data: value),
                            ),
                          );
                        } else {
                          Helper().toastMessage("Sorry Not Booked");
                          //   Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
                        }
                      });
                    },
                    child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width / 2 - 10,
                        color: secondaryColor,
                        child: const Center(
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
                        child: const Center(
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
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "${(data.objApiResponse?.adultBasic ?? 0) + (data.objApiResponse?.childBasic ?? 0) + (data.objApiResponse?.infantBasic ?? 0)}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
              const Text(
                "Taxes & Fees",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "${data.objApiResponse?.totalTax ?? '7886'}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
          const Text(
            "Baggage & Meals",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "Rs ${totalBaggageAndMealAmount}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "${(data.adultBasic ?? 0) + (data.childBasic ?? 0) + (data.infantBasic ?? 0)}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
              const Text(
                "Taxes & Fees",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "${data.totalTax ?? 0}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Contact Number"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: alternateContactController,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Alternate Contact Number"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("Email ID")),
          ),
        ),
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
