import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/text_style.dart';

SnackBar customSnackBar(String title, BuildContext context,{Color? color, String? subtitle}) {
  return SnackBar(
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: whiteText(TextSize.font18(context)),),
        Text(subtitle ?? '',style: whiteText(TextSize.font14(context),fontWeight: FontWeight.w400),)
      ],
    ),
    duration: const Duration(seconds: 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    backgroundColor: color ?? Colors.grey.shade300,
  );
}