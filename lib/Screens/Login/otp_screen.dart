import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
import 'package:travel_mytri_mobile_v1/data/api.dart';
import 'package:travel_mytri_mobile_v1/data/model/hive_class_functions.dart';
import 'dart:async';
import '../../Constants/colors.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../data/model/general_resp.dart';

class ScreenOtp extends StatefulWidget {
  const ScreenOtp({super.key});

  @override
  State<ScreenOtp> createState() => _ScreenOtpState();
}

class _ScreenOtpState extends State<ScreenOtp> with CodeAutoFill {
  TextEditingController otpController1 = TextEditingController();

  TextEditingController otpController2 = TextEditingController();

  TextEditingController otpController3 = TextEditingController();

  TextEditingController otpController4 = TextEditingController();

  TextEditingController otpController5 = TextEditingController();

  TextEditingController otpController6 = TextEditingController();

  String codeValue = "";

  @override
  void codeUpdated() async {
    print("Update code $code");
    setState(() {
      print("codeUpdated");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenOtp();
  }

  void listenOtp() async {
    await SmsAutoFill().unregisterListener();
    listenForCode();
    await SmsAutoFill().listenForCode;
    print("OTP listen Called");
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    print("unregisterListener");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String phoneNo = ModalRoute.of(context)?.settings.arguments as String;
    if (codeValue.length == 6) {
      print("codeValue : $codeValue");
      //  submitOtp(phoneNo);
    }
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
                Center(
                  child: PinFieldAutoFill(
                    currentCode: codeValue,
                    codeLength: 6,
                    onCodeChanged: (code) {
                      print("onCodeChanged $code");
                      setState(() {
                        codeValue = code.toString();
                      });
                    },
                    onCodeSubmitted: (val) {
                      print("onCodeSubmitted $val");
                    },
                  ),
                ),

                TimerScreen(phoneNo: phoneNo),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      log(codeValue);

                      AuthenticationApi().otpSubmit(mobileNo: phoneNo, otp: codeValue).then((value) {
                        Token toc = Token();
                        if (value?.token != null) {
                          toc.token = value?.token ?? '';
                          toc.isUser = value?.status ?? false;
                          toc.fullName = value?.objUser?.fullName ?? "";
                          toc.firstName = value?.objUser?.firstName ?? "";
                          toc.lastName = value?.objUser?.lastName ?? "";
                          toc.userId = value?.objUser?.userId ?? "";
                          // log((value!.objUser)toString());
                          log((value?.objUser).toString());
                          setToken(toc);
                        }
                        (value?.status ?? false)
                            ? Future.delayed(const Duration(seconds: 2), () {
                                int poppedCount = 0;
                                Navigator.popUntil(context, (route) {
                                  poppedCount++;
                                  return poppedCount > 2;
                                });
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                              })
                            : Helper().toastMessage(value?.responseMessage ?? "Go Back & Try Again");
                      });
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

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
    required this.codeValue,
  });

  final String codeValue;

  @override
  Widget build(BuildContext context) {
    return PinFieldAutoFill(
      codeLength: 6,
      currentCode: codeValue,
    );
  }
}

class TimerScreen extends StatefulWidget {
  TimerScreen({super.key, required this.phoneNo});

  String phoneNo = '';
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _secondsRemaining > 580
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Resend OTP",
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                )
              : TextButton(
                  onPressed: () async {
                    final String appSignatureID = await SmsAutoFill().getAppSignature.then((value) {
                      log("++++++");
                      log((value == '') ? "empty" : value);
                      return value;
                    });
                    log("${widget.phoneNo} ,$appSignatureID");

                    await AuthenticationApi().authenticate(mobileNo: widget.phoneNo, appSignature: appSignatureID);
                    _secondsRemaining = 600;
                  },
                  child: Text(
                    "Resend OTP",
                    style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w400),
                  )),
        ),
        Text(
          '${_secondsRemaining ~/ 60}:${_secondsRemaining % 60}',
          style: const TextStyle(fontSize: 20, color: Colors.red),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
