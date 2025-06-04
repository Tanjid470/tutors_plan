import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tutors_plan/const/url_const.dart';
import 'package:tutors_plan/feature/register/data/otp_verify_response.dart';
import 'package:tutors_plan/feature/register/data/registration_response.dart';
import 'package:tutors_plan/feature/register/data/resend_otp_response.dart';
import 'package:tutors_plan/feature/register/domain/otp_verify_model.dart';
import 'package:tutors_plan/feature/register/domain/register_post_model.dart';
import 'package:tutors_plan/utils/network/api_client.dart';
import 'package:tutors_plan/utils/network/api_result.dart';

import '../user_roles_response.dart';

class RegistrationRepository {
  Dio dio = Dio();

  Future<ApiResult<RegistrationResponse>> fetchRegistrationResponse(RegistrationPostModel registrationPostBody) async {
    try {
      dio = await ApiClient.dioClient(false);
      final response = await dio.post(
        UrlConst.registerEndpoint,
        data: registrationPostBody.toJson(),
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 208 && response.data is Map<String, dynamic>) {
        var registrationResponse = RegistrationResponse.fromJson(response.data);
        var headers = response.headers.map.map((key, value) => MapEntry(key, value.join(',')));
        return ApiSuccess(registrationResponse, headers: headers);
      }
      else {
        return ApiError(
          statusCode: response.statusCode,
          message: (response.data is Map<String, dynamic>)
              ? response.data['message']?.toString() ?? 'Unknown Error'
              : response.data?.toString() ?? 'Unknown Error',
        );
      }
    }
    catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;

        if (responseData is Map<String, dynamic>) {
          final message = responseData['message']?.toString() ?? 'Unknown Error';
          return ApiError(
            statusCode: e.response?.statusCode ?? 500,
            message: message,
          );
        } else {
          return ApiError(
            statusCode: e.response?.statusCode ?? 500,
            message: responseData?.toString() ?? 'Unknown Error',
          );
        }
      }
      return const ApiError(
        statusCode: 500,
        message: "Network or unexpected error",
      );
    }
  }

  Future<ApiResult<OtpVerifyResponse>> fetchOTPResponse(OtpVerifyModel otpBody) async {
    try {
      dio = await ApiClient.dioClient(false);
      final response = await dio.post(
        UrlConst.otpEndpoint,
        data: otpBody.toJson(),
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201 && response.data is Map<String, dynamic>) {
        var otpResponse = OtpVerifyResponse.fromJson(response.data);
        var headers = response.headers.map.map((key, value) => MapEntry(key, value.join(',')));
        return ApiSuccess(otpResponse, headers: headers);
      }
      else {
        return ApiError(
          statusCode: response.statusCode,
          message: (response.data is Map<String, dynamic>)
              ? response.data['message']?.toString() ?? 'Unknown Error'
              : response.data?.toString() ?? 'Unknown Error',
        );
      }
    }
    catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;

        if (responseData is Map<String, dynamic>) {
          final message = responseData['message']?.toString() ?? 'Unknown Error';
          return ApiError(
            statusCode: e.response?.statusCode ?? 500,
            message: message,
          );
        } else {
          return ApiError(
            statusCode: e.response?.statusCode ?? 500,
            message: responseData?.toString() ?? 'Unknown Error',
          );
        }
      }
      return const ApiError(
        statusCode: 500,
        message: "Network or unexpected error",
      );
    }
  }

  Future<ResendOTPResponse?> resendOTPResponse(String email) async {
    try {
      dio = await ApiClient.dioClient(false);
      final response = await dio.post(
        UrlConst.resendOtpEndpoint,
        data: {
          "email": email,
        },
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201 && response.data is Map<String, dynamic>) {
        var resendOtpResponse = ResendOTPResponse.fromJson(response.data);
        return resendOtpResponse;
      }
    }
    catch (e) {
     return null;
    }
    return null;
  }

  Future<List<AppRoles>?> getAppRole() async {
    try {

      dio = await ApiClient.dioClient(true);

      Response response = await dio.get(
        UrlConst.appRolesEndpoint,
      );
      UserRolesResponse data = UserRolesResponse.fromJson(response.data);

      if (data.status == 200) {
        return data.results?.data;
      }
      else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}