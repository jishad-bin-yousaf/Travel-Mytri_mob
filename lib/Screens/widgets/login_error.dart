import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Screens/Login/login_pop_up.dart';

import '../../Constants/colors.dart';

class LoginErrorPage extends StatelessWidget {
  const LoginErrorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/login.png",
              height: 150,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Login to Continue",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "You need to login to access this page",
                maxLines: 2,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                onPressed: () {
                  loginBottomSheet(context, MediaQuery.of(context).size.width);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 50),
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text("LOGIN", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
