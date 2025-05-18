import 'package:flutter/material.dart';

class ColorUtils{
  ColorUtils._();
  // Blue Shades
  static Color baseColor = Color(0xff4f46e5); // Base color

// Lighter shade with opacity (used for backgrounds, light UI)
  static Color baseBlueColorLight = baseColor.withOpacity(0.1);

// Custom shades based on baseBlueColor — darker as the shade number increases
  static Color baseBlueColorShade100 = Color(0xff726af0); // Lighter tone
  static Color baseBlueColorShade300 = Color(0xff6159eb);
  static Color baseBlueColorShade500 = baseColor; // Original
  static Color baseBlueColorShade700 = Color(0xff3e38b7);
  static Color baseBlueColorShade900 = Color(0xff2e2b8c); // Darker tone


  // Orange Shades
  static Color baseOrangeColor = Color(0xfff26410);
  static Color baseOrangeColorLight = Color(0xfff26410).withOpacity(0.1);

  // Purple Shades
  static Color basePurpleColor = Color(0xff8c00db);
  static Color basePurpleColorLight = Color(0xff8c00db).withOpacity(0.1);

  static Color grey = Colors.grey;
  static Color grey300 = Colors.grey.shade300;

  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color black54 = Colors.black54;
  static Color black87 = Colors.black87;


  static Color inputBorderColor = Colors.grey.shade300;
  static Color errorBorderColor = Colors.red;
  static Color competeBorderColor = baseColor;

  static Color successSnackBarColor = Color(0xFFC8E6C9); // green.shade100
  static Color errorSnackBarColor = Color(0xFFFFCDD2);   // red.shade100

}