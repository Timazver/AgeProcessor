
import 'package:age_processor/ui/colors/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextStyle {

  static TextStyle textBlockSubtitle = TextStyle(
    fontSize: 10,
    fontStyle: FontStyle.normal,
    color: CustomColors.textBlockSubtitle,
    fontWeight: FontWeight.bold
  );

  static TextStyle textBlockTitle = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    color: Colors.white,
    fontWeight: FontWeight.bold
  );

  static TextStyle screenTitle = TextStyle(
    fontSize: 38,
    fontStyle: FontStyle.normal,
    color: Colors.white,
    fontWeight: FontWeight.w500
  );

  static TextStyle dateTitle = TextStyle(
    fontSize: 12,
    fontStyle: FontStyle.normal,
    color: Colors.white,
    fontWeight: FontWeight.normal
  );

  static TextStyle proSignTitle = TextStyle(
    fontSize: 10,
    fontStyle: FontStyle.normal,
    color: CustomColors.proSignTitle,
    fontWeight: FontWeight.bold
  );
}