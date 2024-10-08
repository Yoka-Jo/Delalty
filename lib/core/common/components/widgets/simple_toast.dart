import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastStates { success, error, warning }

extension ToastBGColorX on ToastStates {
  Color color() {
    switch (this) {
      case ToastStates.success:
        return Colors.green;
      case ToastStates.warning:
        return Colors.amber;

      case ToastStates.error:
        return Colors.red;
    }
  }
}

class SimpleToast {
  static void showSimpleToast({
    required String msg,
    Color? color,
    Color? textColor,
    ToastStates state = ToastStates.error,
    Toast toastLength = Toast.LENGTH_SHORT,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color ?? state.color(),
      textColor: textColor ?? Colors.white,
      fontSize: 16.0,
    );
  }
}
