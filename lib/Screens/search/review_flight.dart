import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/data/model/Search/flight_search_model.dart';

class ScreenReviewFlight extends StatelessWidget {
  const ScreenReviewFlight({super.key});

  @override
  Widget build(BuildContext context) {
    PricingResponse data = ModalRoute.of(context)?.settings.arguments as PricingResponse;

    return Scaffold(
      bottomSheet: Container(
        height: 100,
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
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column();
                          },
                        );
                      },
                      label: Icon(
                        Icons.info_outline,
                        color: white,
                      ),
                      icon: Text("${data.finalAmount ?? ""}", style: TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.bold)))
                ],
              ),
              ElevatedButton(
                onPressed: () {},
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
      appBar: AppBar(
        title: Text("Review Flight"),
        centerTitle: false,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: (data.objSegList?.length ?? 0) * 210,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.objSegList?.length ?? 0,
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
                              "https://agents.alhind.com/images/logos/${data.objSegList?[index].airlineCode ?? ''}.gif",
                              /*${data.airlineName}.*/

                              fit: BoxFit.fitHeight,
                              errorBuilder: (context, error, stackTrace) {
                                return const Text("No logo");
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(data.objSegList?[index].airlineName ?? ''),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, right: 5),
                              child: Text(data.objSegList?[index].airlineFlightClass ?? ''),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, right: 25),
                              child: Text(data.objSegList?[index].cabinBaggage ?? ''),
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
                                  data.objSegList?[index].departureCity ?? '',
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    "${data.objSegList?[index].departureAirportCode ?? ''} ${data.objSegList?[index].departureTime ?? ''}",
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    data.objSegList?[index].departureAirport ?? '',
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
                                data.objSegList?[index].travelDuration ?? '',
                              )
                            ],
                          ),
                          Expanded(
                            // width: MediaQuery.of(context).size.width / 2 - 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  data.objSegList?[index].arrivalCity ?? '',
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    "${data.objSegList?[index].arrivalAirportCode ?? ''} ${data.objSegList?[index].arrivalTime ?? ''}",
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    data.objSegList?[index].arrivalAirport ?? '',
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
                      Navigator.of(context).pushNamed('/travellerDetails');
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
            decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Contact Number")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Alternate Contact Number")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Email ID")),
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
              decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Contact Number")),
            ),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Alternate Contact Number")),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Email ID")),
          ),
        ),
      ],
    );
  }
}
