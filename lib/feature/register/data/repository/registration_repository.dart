import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tutors_plan/const/url_const.dart';
import 'package:tutors_plan/feature/register/data/registration_response_body.dart';
import 'package:tutors_plan/feature/register/domain/register_post_body.dart';
import 'package:tutors_plan/utils/network/api_client.dart';
import 'package:tutors_plan/utils/network/api_result.dart';

import '../app_roles_get_body.dart';

class RegistrationRepository {
  Dio dio = Dio();

  Future<ApiResult<RegistrationResponseBody>> fetchRegistrationResponse(RegistrationPostBody registrationPostBody) async {
    try {
      dio = await ApiClient.dioClient(false);
      final queryParameters = {
        "tokenonly": true,
      };
      final response = await dio.post(
        UrlConst.registerEndpoint,
        //queryParameters: queryParameters,
        data: registrationPostBody.toJson(),
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201 && response.data is Map<String, dynamic>) {
        var registrationResponse = RegistrationResponseBody.fromJson(response.data);
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

  Future<List<AppRoles>?> getAppRole({
    String? page,
    String? limit,
  }) async {
    try {
      final queryParameters = {
        "pagination": true,
        "page": page ?? "1",
        "limit": limit ?? "",
      };
      dio = await ApiClient.dioClient(true);

      Response response = await dio.get(
        '${UrlConst.appRolesEndpoint}/',
        queryParameters: queryParameters,
      );
      AppRolesGetBody data = AppRolesGetBody.fromJson(response.data);

      if (data.status == 'SUCCESS') {
        return data.data;
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