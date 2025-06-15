import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tutors_plan/const/url_const.dart';
import 'package:tutors_plan/feature/course_details/data/course_module_response.dart';
import 'package:tutors_plan/feature/dashboard/data/course_get_response.dart';
import 'package:tutors_plan/feature/exam/data/exam_response.dart';
import 'package:tutors_plan/feature/my_course/data/my_course_response.dart';
import 'package:tutors_plan/feature/profile/data/profile_get_response.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/utils/network/api_client.dart';

class ExamRepository {
 Dio dio = Dio();

 Future<ExamData?> getExams({int? page, int? limit,}) async {
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
       UrlConst.getExamsEndpoint,
       options: Options(
         headers: {
           'Authorization': 'Bearer $accessToken',
         },
       ),
       //queryParameters: queryParameters,
     );
     ExamResponse data = ExamResponse.fromJson(response.data);
     if (data.status == 200) {
       return data.examData;
     }
     else {
       return null;
     }
   } catch (e) {
     debugPrint(e.toString());
   }
   return null;
 }

 Future<Modules?> getMyCourseModulesResponse(String courseId) async {
   try {
     dio = await ApiClient.dioClient(true);

     final queryParameters = {
       "courseId": courseId,
     };
     Response response = await dio.get(
         UrlConst.getCourseModulesEndpoint,
         queryParameters: queryParameters
     );
     CourseModulesResponse data = CourseModulesResponse.fromJson(response.data);
     if (data.status == 200) {
       return data.results;
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
