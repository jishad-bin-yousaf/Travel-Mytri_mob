import 'package:flutter/material.dart';

import '../../Constants/colors.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
  });

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
                Image.asset("assets/images/error.png"),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "We're Sorry!",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "No Flights Found for this route",
                    maxLines: 2,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/home");
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 50),
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text("Back to Home", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
