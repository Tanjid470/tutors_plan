import 'package:flutter/material.dart';

class ColorUtils{
  ColorUtils._();
  // Blue Shades
  static Color baseBlueColor = Color(0xff209bc4);
  static Color baseBlueColorLight = Color(0xff209bc4).withOpacity(0.1);
  static Color baseBlueColorShade100 = Color(0xff1f99c3);
  static Color baseBlueColorShade300 = Color(0xff1e91ba);
  static Color baseBlueColorShade500 = Color(0xff1a7fa7);
  static Color baseBlueColorShade700 = Color(0xff156d94);
  static Color baseBlueColorShade900 = Color(0xff0e4d71);

  // Orange Shades
  static Color baseOrangeColor = Color(0xfff26410);
  static Color baseOrangeColorLight = Color(0xfff26410).withOpacity(0.1);
  static Color baseOrangeColorShade100 = Color(0xfff57d34);
  static Color baseOrangeColorShade300 = Color(0xfff79245);
  static Color baseOrangeColorShade500 = Color(0xfff87a2a);
  static Color baseOrangeColorShade700 = Color(0xffe85d13);
  static Color baseOrangeColorShade900 = Color(0xffd94a00);

  // Purple Shades
  static Color basePurpleColor = Color(0xff8c00db);
  static Color basePurpleColorLight = Color(0xff8c00db).withOpacity(0.1);
  static Color basePurpleColorShade100 = Color(0xff9b2dd6);
  static Color basePurpleColorShade300 = Color(0xffa84bcc);
  static Color basePurpleColorShade500 = Color(0xff9e1bd6);
  static Color basePurpleColorShade700 = Color(0xff8e1bc2);
  static Color basePurpleColorShade900 = Color(0xff70198f);

  static Color grey = Colors.grey;
  static Color grey300 = Colors.grey.shade300;

  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color black54 = Colors.black54;
  static Color black87 = Colors.black87;


  static Color inputBorderColor = Colors.grey.shade300;
  static Color errorBorderColor = Colors.red;
  static Color competeBorderColor = baseBlueColor;

  static Color successSnackBarColor = Colors.green.shade300;
  static Color errorSnackBarColor = Colors.red.shade300;
}