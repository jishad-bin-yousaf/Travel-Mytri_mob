import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/payment/card_utilis.dart';
import 'package:travel_mytri_mobile_v1/data/model/Search/pricing_models.dart';

import '../search/confirmation.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({super.key, required this.data});
  BookingResponse data;
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Timer _timer;
  int _secondsRemaining = 600;
  TextEditingController cardNumberController = TextEditingController();
  CardType cardType = CardType.Invalid;

  void getCardFrmNum() {
    if (cardNumberController.text.length <= 6) {
      String cardNum = CardUtils.getCleanedNumber(cardNumberController.text);
      CardType type = CardUtils.getCardTypeFrmNumber(cardNum);
      if (type != cardType) {
        setState(() {
          cardType = type;
          print(cardType);
        });
      }
    }
  }

  @override
  void initState() {
    cardNumberController.addListener(() {
      getCardFrmNum();
    });
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_secondsRemaining <= 0) {
          timer.cancel();
          _showBottomSheet();
        } else {
          _secondsRemaining--;
        }
      });
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          // BottomSheet content
          height: 200,
          color: Colors.white,
          child: Center(
            child: Text(
              "Payment completed!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  String _formatTime() {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;
    String formattedTime = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    return formattedTime;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make Payment"),
        centerTitle: false,
        bottom: PreferredSize(
          child: Container(
            color: secondaryColor,
            height: 40,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "Time left to complete payment :  ${_formatTime()}",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          preferredSize: Size(double.infinity, 30),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              height: 60 * 2,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          "https://agents.alhind.com/images/logos/g9.gif",
                          /*${data.airlineName}.*/

                          fit: BoxFit.fitHeight,
                          errorBuilder: (context, error, stackTrace) {
                            return const Text("No logo");
                          },
                        ),
                        Column(
                          children: [
                            Text(
                              "CCJ 22:30",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            Text("Fri, 28 May"),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.arrow_forward),
                            Text("4h 20 min"),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "CCJ 22:30",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            Text("Fri, 28 May"),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "1 Traveller",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Text(
                          "Base Fare",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
                        ),
                      ),
                      Text(
                        "Tax",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Text(
                          "GST",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
                        ),
                      ),
                      Text(
                        "Cost",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          "Grand Total",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Color.fromARGB(255, 191, 87, 0)),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "1 Traveller",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Text(
                          "Base Fare",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
                        ),
                      ),
                      Text(
                        "Tax",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Text(
                          "GST",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
                        ),
                      ),
                      Text(
                        "Cost",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          "${widget.data.paidAmount ?? 0}",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Color.fromARGB(255, 191, 87, 0)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Amount to Pay : ${widget.data.paidAmount}",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.grey.shade300,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      "assets/icons/card.png",
                      height: 25,
                    ),
                  ),
                  Text(
                    "CREDIT / DEBIT CARD",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: cardNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(19),
                      CardNumberInputFormatter(),
                    ],
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardUtils.getCardIcon(cardType),
                      ),
                      border: OutlineInputBorder(),
                      label: Text("Enter your card No."),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.credit_card),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter Name your card "),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(Icons.account_circle_outlined),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                              CardMonthInputFormatter(),
                            ],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("MM/YY"),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Icon(Icons.calendar_month_outlined),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("CVV"),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Icon(Icons.lock_outline),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.grey.shade300,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      "assets/icons/upi.png",
                      height: 25,
                    ),
                  ),
                  Text(
                    "UPI PAYMENT METHOD",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/icons/phonepe.png",
                    height: 35,
                  ),
                  Image.asset(
                    "assets/icons/gpay.png",
                    height: 35,
                  ),
                  Image.asset(
                    "assets/icons/paytm.png",
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0, right: 10),
                    child: Image.asset(
                      "assets/icons/amazonpay.png",
                      height: 25,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                      width: 20,
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      )),
                  Text(" OR ", style: TextStyle(fontSize: 20)),
                  SizedBox(
                      width: 20,
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: Text(
                "Enter Virtual payment Address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "username@bankname",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      "assets/icons/upi.png",
                      height: 10,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ConfirmationScreen(data: widget.data),
                  ),
                );
              },
              child: Container(
                color: secondaryColor,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  "MAKE PAYMENT",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;
      if (index % 4 == 0 && inputData.length != index) {
        buffer.write("  ");
      }
    }
    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(
          offset: buffer.toString().length,
        ));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(text: string, selection: TextSelection.collapsed(offset: string.length));
  }
}
