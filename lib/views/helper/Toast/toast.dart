import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toast({
  required String msg,
  Color? textColor,
  Color? backgroundColor,
}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor ?? Colors.green,
      textColor: textColor ?? Colors.white,
      fontSize: 16.0);
}
