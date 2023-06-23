import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';

class Helper {
  toastMessage(msg) {
    //  return SnackBar(content: Text(msg));
    Fluttertoast.showToast(
      msg: msg ?? "",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 3,
      backgroundColor: secondaryColor,
      //   backgroundColor: Color.fromARGB(255, 87, 87, 87),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
