import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tutors_plan/const/url_const.dart';
import 'package:tutors_plan/feature/dashboard/data/course_get_response_body.dart';
import 'package:tutors_plan/feature/my_course/data/my_course_response.dart';
import 'package:tutors_plan/feature/profile/data/profile_get_response_body.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/utils/network/api_client.dart';

class MyCourseRepository {
 Dio dio = Dio();

 Future<List<MyCourse>?> getMyCourse({int? page, int? limit,}) async {
   try {
     final int currentPage = page ?? 1;
     final queryParameters = {
       "pagination": "true",
       "page": "$currentPage",
       "limit": "${(limit ?? 10) * currentPage}",
     };

     dio = await ApiClient.dioClient(true);
     var accessToken = preferences.getString('accessToken');
     Response response = await dio.get(
       UrlConst.getMyCoursesEndpoint,
       options: Options(
         headers: {
           'Authorization': 'Bearer $accessToken',
         },
       ),
       //queryParameters: queryParameters,
     );
     MyCourseResponse data = MyCourseResponse.fromJson(response.data);
     if (data.status == 200) {
       return data.results?.myCourses;
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
