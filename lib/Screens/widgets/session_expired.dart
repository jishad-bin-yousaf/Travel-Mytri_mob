import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Screens/Login/login_pop_up.dart';

import '../../Constants/colors.dart';
import '../../data/api.dart';
import '../../data/model/hive_class_functions.dart';

class SessionExpiredPage extends StatelessWidget {
  const SessionExpiredPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Center(
            child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/session_expired.png",
                  height: 150,
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Something went wrong",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.all(15.0),
                //   child: Text(
                //     "Oops! There is no Network Connection.\ncheck your Network Settings.",
                //     maxLines: 2,
                //     style: TextStyle(fontSize: 16),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: ElevatedButton(
                        onPressed: () {
                          loginBottomSheet(context);
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 50),
                          backgroundColor: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text("LOGIN", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: ElevatedButton(
                        onPressed: () {
                          AuthenticationApi().noUserLogin().then((value) {
                            Token toc = Token();
                            if (value?.token != null) {
                              toc.token = value?.token ?? '';
                              toc.isUser = false;
                              setToken(toc);
                            }
                            (value?.status ?? false)
                                ? Future.delayed(const Duration(seconds: 2), () {
                                    getToken().then((value) {
                                      Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName('/'));
                                    });
                                  }
                                    //  () => Navigator.pushNamedAndRemoveUntil(context, '/FlightSearchResult', ModalRoute.withName('/FlightSearchResult')),
                                    )
                                : Future.delayed(const Duration(seconds: 2), () {
                                    getToken().then((value) {
                                      Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName('/'));
                                    });
                                  }
                                    // Future.delayed(const Duration(seconds: 5), () {
                                    //     getToken().then((value) {
                                    //       Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName('/'));
                                    //     });
                                    //   }
                                    //  () => Navigator.pushNamedAndRemoveUntil(context, '/FlightSearchResult', ModalRoute.withName('/FlightSearchResult')),
                                    );
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 50),
                          backgroundColor: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text("Home", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
