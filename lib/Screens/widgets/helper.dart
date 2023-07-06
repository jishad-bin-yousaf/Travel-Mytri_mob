import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helper {
  toastMessage(msg) {
    //  return SnackBar(content: Text(msg));
    Fluttertoast.showToast(
      msg: msg ?? "",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 3,

      backgroundColor: Colors.black,
      //   backgroundColor: Color.fromARGB(255, 87, 87, 87),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
