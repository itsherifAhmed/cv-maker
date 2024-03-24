import 'package:flutter/material.dart';

Color headingTxt = Colors.black;

textStyle({Color? color}) {
  return TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: color ?? headingTxt,
  );
}

inputTextStyle({Color? color}) {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: color ?? headingTxt,
  );
}

miniText({Color? color, FontWeight? bold}) {
  return TextStyle(
    fontSize: 14,
    fontWeight: bold ?? FontWeight.w500,
    color: color ?? headingTxt,
  );
}

normalText({Color? color, FontWeight? bold}) {
  return TextStyle(
    fontSize: 16,
    fontWeight: bold ?? FontWeight.w500,
    color: color ?? headingTxt,
  );
}

ultraMiniText({Color? color, FontWeight? bold}) {
  return TextStyle(
    fontSize: 10,
    fontWeight: bold ?? FontWeight.w500,
    color: color ?? headingTxt,
  );
}

resumeBody({Color? color, FontWeight? bold, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 10,
    fontWeight: bold ?? FontWeight.w300,
    color: color ?? headingTxt,
  );
}

primaryText() {
  return const TextStyle(
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
