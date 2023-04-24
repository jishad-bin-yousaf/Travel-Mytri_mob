import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

loginBottomSheet(BuildContext context, double width) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Login or Create Account",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    "Enter your mobile number",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: Size(width, 50),
                backgroundColor: secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text("CONTINUE", style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
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
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/google.png",
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(width: 5, height: 40),
                  const Text(
                    "Google",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
