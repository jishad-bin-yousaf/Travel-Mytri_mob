import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
import 'package:travel_mytri_mobile_v1/data/api.dart';
import 'dart:async';
import '../../Constants/colors.dart';

class ScreenOtp extends StatelessWidget {
  ScreenOtp({super.key});
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();
  TextEditingController otpController5 = TextEditingController();
  TextEditingController otpController6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String phoneNo = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              // height: double.infinity    ,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                //    const SizedBox(height: 50),
                Material(
                  shape: const CircleBorder(),
                  color: Colors.transparent,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(
                        side: BorderSide(color: Colors.grey, width: 3),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.phone_android_sharp,
                        size: 60,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    "We have send you an OTP on your Mobile",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    "+91 $phoneNo",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    otpField(context, otpController1),
                    otpField(context, otpController2),
                    otpField(context, otpController3),
                    otpField(context, otpController4),
                    otpField(context, otpController5),
                    otpField(context, otpController6),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () async {
                        await AuthenticationApi().authenticate(mobileNo: phoneNo);
                      },
                      child: Text(
                        "Resend OTP",
                        style: TextStyle(color: Colors.grey.shade700, fontSize: 16, fontWeight: FontWeight.w400),
                      )),
                ),
                const TimerScreen(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      final otp = int.parse("${otpController1.text}${otpController2.text}${otpController3.text}${otpController4.text}${otpController5.text}${otpController6.text}");
                      final resp = await AuthenticationApi().otpSubmit(mobileNo: phoneNo, otp: otp);
                      if (resp?.status == true && resp?.token != null) {
                        gToken = resp!.token!;
                        Navigator.pushNamedAndRemoveUntil(context, '/home', ModalRoute.withName('/home'));
                      } else {
                        Helper().toastMessage(resp?.responseMessage ?? "");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text("Submit", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  otpField(BuildContext context, otpController) {
    return SizedBox(
        width: 50,
        height: 50,
        child: TextField(
          controller: otpController,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: (value) {
            otpController.text = value;
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
            }
          },
          decoration: const InputDecoration(hintText: "0"),
        ));
  }
}

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  TimerScreenState createState() => TimerScreenState();
}

class TimerScreenState extends State<TimerScreen> {
  int _secondsRemaining = 10 * 60; // 10 minutes in seconds

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          Navigator.pop(context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_secondsRemaining ~/ 60}:${_secondsRemaining % 60}',
      style: const TextStyle(fontSize: 20, color: Colors.red),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
