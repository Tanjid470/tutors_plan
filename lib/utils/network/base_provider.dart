import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tutors_plan/const/http_Logger.dart';
import 'package:tutors_plan/route/app_pages.dart';
import 'package:tutors_plan/utils/controller/app_controller.dart';
class BaseProviders extends GetConnect {

  late SharedPreferences preferences;
  AppController appController=Get.put(AppController());

  @override
  void onInit() {httpClient.baseUrl = 'YOUR-API-URL';}

  Map<String, String> headerData = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-APP-KEY': '${AppController().to.prefs.getString('imei_number')}',
    'Authorization':
    'Bearer ${AppController().to.prefs.getString('access_token')}',
  };

  Map<String, String> deleteHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization':
    'Bearer ${AppController().to.prefs.getString('access_token')}',
  };

  Future<http.Response?> getAllResponse({required String url}) async {
    try {
      var response = await httpLog.get(Uri.parse(url), headers: headerData);
      final map = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 401) {
        AppController().to.prefs.clear();
        Get.toNamed(RouteNames.loginView);
      }
      else if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        Get.snackbar(map['status'],map['message'],
            duration: const Duration(seconds: 3),
            backgroundColor: const Color(0xffFFCECE),
            colorText: Colors.black,
            icon: const Icon(Icons.error_outline,color: Color(0xffEF4444),),
            snackPosition: SnackPosition.TOP);
        return null;
      }
    } catch (exception) {
      Get.snackbar('Error','$exception',
          duration: const Duration(seconds: 3),
          backgroundColor: const Color(0xfff1d799),
          colorText: Colors.black,
          icon: const Icon(Icons.wifi_tethering_error,color: Color(0xffEF4444),),
          snackPosition: SnackPosition.TOP);
    }
    return null;
  }

  Future<http.Response?> postAllResponse({required String url, required dynamic body}) async {
    try {
      var response = await httpLog.post(Uri.parse(url),
          body: jsonEncode(body), headers: headerData);
      if (response.statusCode == 401) {
        AppController().to.prefs.clear();
        Get.toNamed(RouteNames.onboardView);
      }
      else if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<http.Response?> postDownload({required String url, required dynamic body}) async {
    try {
      var response = await httpLog.post(Uri.parse(url),
          body: jsonEncode(body), headers: headerData);
      if (response.statusCode == 401) {
        AppController().to.prefs.clear();
        Get.toNamed(RouteNames.onboardView);
      }
      else if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        return response;
      }
    } catch (e) {
      return null;
    }

    Future<Response?> putAllResponse({required String url, required dynamic body}) async {
      try {
        var response = await put(url, body, headers: headerData);
        if (response.statusCode == 401) {
          AppController().to.prefs.clear();
          Get.toNamed(RouteNames.onboardView);
        } else if (response.statusCode == 200 || response.statusCode == 201) {

          return response;
        } else {
          return null;
        }
      } catch (e) {
        // print('not fount notebook list $erro');
      }
      return null;
    }
    return null;
  }

  Future<http.Response?> deleteAllResponse({required String url,required String id}) async {
    try {
      var body = {
        "id":id,
      };
      var response = await httpLog.delete(Uri.parse(url),body: jsonEncode(body), headers: headerData);
      if (response.statusCode == 401) {
        AppController().to.prefs.clear();
        Get.toNamed(RouteNames.onboardView);
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
