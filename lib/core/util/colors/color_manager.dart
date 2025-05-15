import 'package:flutter/material.dart';

class ColorManager{

  static Gradient primaryColor = LinearGradient(
      colors: [
        Color.fromRGBO(17, 32, 149, 1.0),
        Color.fromRGBO(9, 32, 82, 1.0),
      ],
      stops: [0,1],
      end: Alignment.bottomRight
  );

  static Color secondaryColor = Colors.white;

  static Gradient containerColor= LinearGradient(
      colors: [
        myBlue,
        Color.fromRGBO(69, 94, 181, 1.0)
      ],
      stops: [0,1],
      end: Alignment.bottomRight
  );

  static Color indigoColor = Color.fromRGBO(12, 33,101, 1);

  static Color myBlue =Color.fromRGBO(101,214,252,1);

  static Color darkBlue =Color.fromRGBO(0,99,133,.9);

}