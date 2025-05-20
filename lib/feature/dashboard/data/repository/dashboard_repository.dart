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
    int? page,
    int? limit,
  }) async {
    try {
      final int currentPage = page ?? 1;
      final queryParameters = {
        "pagination": "true",
        "page": "$currentPage",
        "limit": "${(limit ?? 10) * currentPage}",
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

 Future<CourseGetResponseBody?> getCourse({int? page, int? limit}) async {
   try {
     dio = await ApiClient.dioClient(false);
     final queryParameters = {
       "pagination": true,
       "page": page.toString(),
       "limit": limit.toString(),
     };
     var accessToken = preferences.getString('accessToken');
     final response = await dio.get(
       UrlConst.coursesEndpoint,
       queryParameters: queryParameters,
       options: Options(
         headers: {
           'Authorization': 'Bearer $accessToken',
         },
         validateStatus: (status) => status != null && status < 500,
       ),
     );
     if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
       var courseResponse = CourseGetResponseBody.fromJson(response.data);
       return courseResponse;
     }
     else {
       return null;
     }
   }
   catch (e) {
     if (e is DioException) {
       final responseData = e.response?.data;
       if (responseData is Map<String, dynamic>) {
         final message = responseData['message']?.toString() ?? 'Unknown Error';
         return null;
       } else {
         return null;
       }
     }
     return null;
   }
 }

}
