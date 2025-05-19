import 'package:dio/dio.dart' show Dio, DioException, Options;

import 'package:tutors_plan/const/url_const.dart' show UrlConst;
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/services/data/crourse_enrollemnt.dart';
import 'package:tutors_plan/utils/network/api_client.dart';
import 'package:tutors_plan/utils/network/api_result.dart';

class CourseEnrollment {
  Dio _dio = Dio();
  var accessToken = preferences.getString('accessToken');
  Future<ApiResult<CourseSuccessRes>> fetchLoginResponse({String? intentId, int? courseId, int? studentId}) async {
    try {
      _dio = await ApiClient.dioClient(false);
      final response = await _dio.post(
        UrlConst.courseEnrollmentEndpoint,
        data: {"intent_id": intentId, "course_id": courseId, "student_id": studentId},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $accessToken',
          },
          validateStatus: (status) => status != null && status < 500,
        ),
      );
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        var loginResponse = CourseSuccessRes.fromJson(response.data);
        var headers = response.headers.map.map((key, value) => MapEntry(key, value.join(',')));
        return ApiSuccess(loginResponse, headers: headers);
      } else {
        return ApiError(
          statusCode: response.statusCode,
          message: (response.data is Map<String, dynamic>)
              ? response.data['message']?.toString() ?? 'Unknown Error'
              : response.data?.toString() ?? 'Unknown Error',
        );
      }
    } catch (e) {
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
}
