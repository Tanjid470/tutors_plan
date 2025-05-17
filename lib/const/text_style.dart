import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';

TextStyle whiteText(double fontSize,{fontWeight}){
  return  TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w700,
      color:Colors.white
  );
}
TextStyle blackText(double fontSize,{fontWeight}){
  return  TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w700,
      color:Colors.black
  );
}
TextStyle customTextStyle(context,{Color? color,double? fontSize,fontWeight}){
  return  TextStyle(
      fontSize: fontSize ?? TextSize.font14(context),
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? ColorUtils.baseColor
  );
}