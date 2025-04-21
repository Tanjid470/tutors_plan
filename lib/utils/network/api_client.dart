import 'dart:async';
import 'dart:convert';
import 'dart:io' as IO;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:tutors_plan/const/shared_pref_const.dart';
import 'package:tutors_plan/const/shared_preference.dart';
import 'package:tutors_plan/utils/network/url_helper.dart';

class ApiClient {
  static Future<dynamic> get(String url, dynamic parameters, bool isJWTRequired, {bool isGeoCoding = false, Map<String, String>? headers}) async {
    try {
      Dio dio = await dioClient(isJWTRequired, isGeoCoding: isGeoCoding, headers: headers);
      Response response = await dio.get(url, queryParameters: parameters).catchError((error) => throw error);
      return _response(response, url);
    } on DioException catch (e) {
      throwError(e);
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> post(String url, dynamic params, dynamic body, bool isJWTRequired, {Map<String, String>? headers}) async {
    try {
      Dio dio = await dioClient(isJWTRequired, headers: headers);
      Response response = await dio.post(url, queryParameters: params, data: body).catchError((error) => throw error);
      return _response(response, url);
    } on DioException catch (e) {
      throwError(e);
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> put(String url, dynamic params, dynamic body, bool isJWTRequired, {String featureName = ""}) async {
    try {
      Dio dio = await dioClient(isJWTRequired);
      Response response = await dio.put(url, queryParameters: params, data: body).catchError((error) => throw error);
      return _response(response, url);
    } on DioException catch (e) {
      throwError(e);
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> delete(String url, dynamic params, dynamic body, bool isJWTRequired) async {
    try {
      Dio dio = await dioClient(isJWTRequired);
      Response response = await dio.delete(url, queryParameters: params, data: body);
      return _response(response, url);
    } on DioException catch (e) {
      throwError(e);
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> upload(String url, dynamic body, bool isJWTRequired, {String featureName = ""}) async {
    try {
      Dio dio = await dioClient(isJWTRequired);
      Response response = await dio.post(
        url,
        data: FormData.fromMap(body),
      );
      return _response(response, url);
    } on DioException catch (e) {
      throwError(e);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Dio> dioClient(bool isJWTRequired, {bool isGeoCoding = false, Map<String, String>? headers}) async {
    String? token = "";
    if (isJWTRequired) {
      token = await Prefs.getValue(SharedPreferenceConstant.jwt);
    }
    Dio dio = Dio(await _options(token, isJWTRequired, isGeoCoding, headers));
    isProduction(dio);
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (IO.HttpClient client) {
      client.badCertificateCallback = (IO.X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio;
  }

  static Future<BaseOptions> _options(String token, bool isJWTRequired, bool isGeoCoding, Map<String, String>? headers) async {
    var header = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    if (headers != null) {
      header.addAll(headers);
    }

    if (isJWTRequired) {
      header['Authorization'] = 'Bearer $token';
    }

    return BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: header,
    );
  }

  static dynamic _response(Response response, String url) {
    try {
      var responseJson = json.decode(response.toString());
      switch (response.statusCode) {
        case 200:
        case 201:
        case 412:
          return responseJson;
        case 401:
          throw throwResponseError(response);
        case 403:
        case 404:
        case 417:
        case 422:
        case 500:
        case 503:
          throw throwResponseError(response);
        default:
          throw throwResponseError(response);
      }
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  static void throwError(Exception e) {
    if (e is DioException) {
      if (e.error is SocketException) {
        throw "Check your internet connection";
      } else {
        if (e.response != null) {
          String? errorMsg;
          if (e.response?.data["message"]?.isNotEmpty == true) {
            errorMsg = e.response?.data["message"];
          }
          if (e.response?.statusMessage?.isNotEmpty == true) {
            errorMsg = e.response?.statusMessage;
          }
          throw errorMsg ?? 'Something went wrong';
        } else {
          throw e.error.toString();
        }
      }
    } else {
      throw 'Something went wrong';
    }
  }

  static dynamic throwResponseError(Response<dynamic> response) {
    try {
      var responseJson = json.decode(response.toString());
      return responseJson;
    } on DioException catch (e) {
      throwError(e);
    } catch (e) {
      throw e.toString();
    }
  }
  //
  // static Future<String> getClientInfo() async {
  //   String? deviceData;
  //   DeviceInfoPlugin? deviceInfoPlugin = DeviceInfoPlugin();
  //   try {
  //     if (IO.Platform.isAndroid) {
  //       AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
  //       deviceData = "${androidDeviceInfo.model} ${androidDeviceInfo.version.codename} ${androidDeviceInfo.manufacturer}";
  //     } else if (IO.Platform.isIOS) {
  //       IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
  //       deviceData = "${iosDeviceInfo.model} ${iosDeviceInfo.systemName} ${iosDeviceInfo.systemVersion}";
  //     }
  //   } catch (e) {
  //     deviceData = "$e";
  //   }
  //   return deviceData!;
  // }
}
