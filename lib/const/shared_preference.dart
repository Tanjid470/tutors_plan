import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutors_plan/utils/extention/object.dart';

class Prefs {
  // static Future<String?> getValue(String key) async {
  //   const storage = FlutterSecureStorage();
  //   String? value = '';
  //   try {
  //     if (Platform.isAndroid) {
  //       value = await storage.read(key: key);
  //     } else {
  //       value = await getValueWithPref(key);
  //     }
  //   } on Exception {
  //     'custom exception is been obtained'.doPrint(level: 3);
  //   }
  //   if (value == null || value.trim().isEmpty) {
  //     return null;
  //   }
  //   return value;
  // }

  static Future<bool> setValue(String key, String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool saved = false;
    try {
      prefs.setString(key, value ?? "");
      saved = true;
    } on Exception {
      'custom exception is been obtained'.doPrint(level: 3);
    }
    return saved;
  }

  static Future<String> getValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = '';
    try {
      value = prefs.getString(key);
    } on Exception {
      'custom exception is been obtained'.doPrint(level: 3);
    }
    return value ?? "";
  }


  // static Future<bool> logout(BuildContext context) async {
  //   const storage = FlutterSecureStorage();
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool saved = false;
  //   await storage.deleteAll();
  //   await prefs.clear();
  //   saved = true;
  //   return saved;
  // }

  static Future<void> setDataAsObject(dynamic jsonString, String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final data = jsonEncode(jsonString);
      await prefs.setString(key, data);
    } catch (e) {
      e.doPrint(level: 3);
    }
  }

  static Future<dynamic> getDataAsObject(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic data;
    try {
      final jsonString =  prefs.getString(key);
      if (jsonString != null) {
        data = jsonDecode(jsonString);
      }
    } catch (e) {
      e.doPrint(level: 3);
    }
    return data;
  }
//
// static Future<void> removeSharedPreferenceItemUsingKey(String key) async {
//   try {
//     if (Platform.isAndroid) {
//       final storage = FlutterSecureStorage();
//       storage.delete(key: key);
//     } else {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.remove(key);
//     }
//   } catch (e) {
//     e.doPrint(prefix: "can not be removed", level: 3);
//   }
// }
}