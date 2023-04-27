import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helper {
  toastMessage(msg) {
    Fluttertoast.showToast(
      msg: msg ?? "",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Color.fromARGB(255, 150, 0, 0),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
