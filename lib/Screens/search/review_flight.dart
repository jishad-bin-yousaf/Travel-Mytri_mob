import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/search/confirmation.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
import 'package:travel_mytri_mobile_v1/data/api.dart';

import '../../data/model/Search/pricing_models.dart';
import 'traveller details/traveller_details.dart';

class ScreenReviewFlight extends StatelessWidget {
  ScreenReviewFlight({super.key});

  RepricingRequest req = RepricingRequest();
  TextEditingController contactController = TextEditingController();
  TextEditingController alternateContactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    PricingResponse data = ModalRoute.of(context)?.settings.arguments as PricingResponse;

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: SafeArea(
          child: ListView(
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
          Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Traveller Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                        builder: (context) => TavellerDetails(
                          data: data,
                        ),
                      ))
                          .then((value) {
                        req = value as RepricingRequest;
                      });
                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(color: Colors.grey.shade800),
                      ),
                    ),
                    child: Text("Add Travellers", style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                )
              ],
            ),
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
      )),
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
              baggageAndMeal(),
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
                      BookingRequest req = BookingRequest();
                      req.fareId = value.fareId;
                      req.fareIdR = value.fareIdR;
                      req.itinId = value.itinId;
                      req.itinIdR = value.itinIdR;
                      req.providerCode = value.providerCode;
                      req.providerCodeR = value.providerCodeR;
                      req.contactNumber = contactController.text;
                      req.alternateContactNumber = alternateContactController.text;
                      req.contactEmail = emailController.text;
                      PricingApi().bookTicket(req).then((value) {
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
            "5092",
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
                "du7886",
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
}
