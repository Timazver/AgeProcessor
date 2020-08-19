
import 'package:flutter/rendering.dart';

class CustomColors {

  //Simple colors
  static Color textBlockSubtitle = Color.fromRGBO(152, 151, 151, 1);
  static Color proSignBg = Color.fromRGBO(35,120,219,1);
  static Color proSignTitle = Color.fromRGBO(255,221,102,1);

  //Gradient colors

  static LinearGradient textBlockGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(0, 0, 0, 0.675),
      Color.fromRGBO(0, 0, 0, 0.4125)
    ]
  );
}