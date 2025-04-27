import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackBar customSnackBar(String title,{Color? color, String? message}) {
  return SnackBar(
    content: Text(title),
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: 'Close',
      onPressed: () {
        Get.back();
      },),
    backgroundColor: color ?? Colors.red,

  );
}