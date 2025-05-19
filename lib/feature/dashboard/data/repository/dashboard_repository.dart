import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tutors_plan/const/url_const.dart';
import 'package:tutors_plan/feature/dashboard/data/course_categories_response_body.dart';
import 'package:tutors_plan/feature/dashboard/data/course_get_response_body.dart';
import 'package:tutors_plan/feature/profile/data/profile_get_response_body.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/utils/network/api_client.dart';
import 'package:tutors_plan/utils/network/api_result.dart';

class DashboardRepository {
 Dio dio = Dio();
  Future<List<CategoryListModel>?> getCourseCategory({
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
        '${UrlConst.getCoursesEndpoint}/',
        queryParameters: queryParameters,
      );
      CourseCategoriesResponseBody data = CourseCategoriesResponseBody.fromJson(response.data);

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

 Future<ProfileGetResponseBody?> getUserProfile({
   String? page,
   String? limit,
 }) async {
   try {
     dio = await ApiClient.dioClient(true);
     var accessToken = preferences.getString('accessToken');
     Response response = await dio.get(
       UrlConst.getProfileEndpoint,
       options: Options(
         headers: {
           'Authorization': 'Bearer $accessToken',
         },
       ),
     );
     ProfileGetResponseBody data = ProfileGetResponseBody.fromJson(response.data);

     if (data.status == 'SUCCESS') {
       return data;
     }
     else {
       return null;
     }
   } catch (e) {
     debugPrint(e.toString());
   }
   return null;
 }

 Future<ApiResult<CourseGetResponseBody>> getCourse() async {
   try {
     dio = await ApiClient.dioClient(false);
     var accessToken = preferences.getString('accessToken');
     final response = await dio.get(
       UrlConst.coursesEndpoint,
       options: Options(
         headers: {
           'Authorization': 'Bearer $accessToken',
         },
         validateStatus: (status) => status != null && status < 500,
       ),
     );
     if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
       var loginResponse = CourseGetResponseBody.fromJson(response.data);
       var headers = response.headers.map.map((key, value) => MapEntry(key, value.join(',')));
       return ApiSuccess(loginResponse, headers: headers);
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

}
