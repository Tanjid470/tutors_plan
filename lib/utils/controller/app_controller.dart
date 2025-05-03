import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  AppController get to => Get.find();
  late SharedPreferences prefs;
  var isLoadingDept = true.obs;
}
