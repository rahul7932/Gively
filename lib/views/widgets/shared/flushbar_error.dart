import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushBarError extends StatelessWidget {
  FlushBarError({this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      message: message,
      duration: Duration(seconds: 3),
    )..show(context);
  }
}
