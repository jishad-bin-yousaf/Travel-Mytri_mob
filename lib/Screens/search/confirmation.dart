import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import '../../data/model/Search/pricing_models.dart';
import '../widgets/print_pdf.dart';

class ConfirmationScreen extends StatelessWidget {
  ConfirmationScreen({required this.data});

  BookingResponse data = const BookingResponse();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
            },
            icon: Icon(Icons.home)),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              "assets/icons/success.png",
              height: 100,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Your Booking Confirmed!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Text(
              "Thank you for booking with TravelMythri!",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "E-ticket has been sent to",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              data.email ?? "jishad123@hotmail.com",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 3,
                vertical: 8,
              ),
              child: OutlinedButton(
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PDFViewerScreen(pdfUrl: "https://uattm.jameer.xyz/data/TravelMythri_E-Ticket.pdf"),
                  ));
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  side: BorderSide(width: 2, color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  "Download Ticket",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Divider(thickness: 2),
            Text(
              "PNR / Booking ID:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    margin: EdgeInsets.all(10),
                    color: secondaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data.bookingReferenceId ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  data.bookingReferenceIdR != null
                      ? Card(
                          margin: EdgeInsets.all(10),
                          color: secondaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data.bookingReferenceIdR ?? '',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            flightDetailsSector(context),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 3.5,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                color: Color.fromRGBO(255, 255, 255, 1),
                border: Border.all(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  "Traveller Details",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 60 * (data.objPaxlist?.length ?? 0).toDouble(),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.objPaxlist?.length ?? 0,
                itemBuilder: (context, index) {
                  final value = data.objPaxlist?[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_2_outlined,
                              size: 40,
                            ),
                            Text(
                              value?.paxName ?? '',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          value?.paxType ?? '',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(thickness: 3),
              ),
            )
          ],
        ),
      ),
    );
  }

  flightDetailsSector(BuildContext context) {
    return SizedBox(
      height: (data.objSegmentList?.length ?? 0) * 200,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.objSegmentList?.length ?? 0,
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
                        "https://agents.alhind.com/images/logos/${data.objSegmentList?[index].airlineCode ?? ''}.gif",
                        /*${data.airlineName}.*/

                        fit: BoxFit.fitHeight,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text("No logo");
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(data.objSegmentList?[index].airlineName ?? ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 5),
                        child: Text(data.objSegmentList?[index].airlineFlightClass ?? ''),
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
                            data.objSegmentList?[index].departureCity ?? '',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "${data.objSegmentList?[index].departureAirportCode ?? ''} ${data.objSegmentList?[index].departureTime ?? ''}",
                              style: TextStyle(fontSize: 23),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              data.objSegmentList?[index].departureAirport ?? '',
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
                          data.objSegmentList?[index].travelDuration ?? '',
                        )
                      ],
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width / 2 - 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            data.objSegmentList?[index].arrivalCity ?? '',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "${data.objSegmentList?[index].arrivalAirportCode ?? ''} ${data.objSegmentList?[index].arrivalTime ?? ''}",
                              style: TextStyle(fontSize: 23),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              data.objSegmentList?[index].arrivalAirport ?? '',
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
    );
  }
}
