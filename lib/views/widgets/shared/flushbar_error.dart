import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

showFlushBar(
    {@required BuildContext context,@required String message,@required Color backgroundColor}) {
  Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    backgroundColor: backgroundColor,
    message: message,
    duration: Duration(seconds: 3),
  )..show(context);
}

Widget flushBarError (BuildContext context, String errorMessage) {
  return showFlushBar(
      context: context,
      message: errorMessage,
      backgroundColor: Colors.red);
}
