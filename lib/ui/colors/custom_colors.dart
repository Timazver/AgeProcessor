
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomColors {

  //Simple colors
  static Color textBlockSubtitle = Color.fromRGBO(152, 151, 151, 1);
  static Color proSignBg = Color.fromRGBO(35,120,219,1);
  static Color proSignTitle = Color.fromRGBO(255,221,102,1);
  static Color initialStatusPanelSubtitle = Color.fromRGBO(74, 74, 74, 0.9);
  static Color blueBtn = Color.fromRGBO(35,120,219,1);
  static Color littleText = Color.fromRGBO(210, 210, 210, 0.9);
  static Color processingText = Color.fromRGBO(210, 210, 210, 1);
  static Color stopButtonRed = Color.fromRGBO(219,35,76, 1);
  static Color stopButtonBlack = Color.fromRGBO(41,39,39, 1);
  static Color textBlockBorder = Color.fromRGBO(79,91,146,1);
  //Gradient colors

  static LinearGradient textBlockGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(0, 0, 0, 0.765),
      Color.fromRGBO(0, 0, 0, 0.4675)
    ]
  );

  static LinearGradient resultTextBlockGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.fromRGBO(0, 0, 0, 0.9),
      Color.fromRGBO(0, 0, 0, 0.55)
    ]
  );

  static LinearGradient bGGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(14,78,92,100),
      Colors.black.withOpacity(0.52),
      Color.fromRGBO(14,78,92,100),
    ]
    );
}