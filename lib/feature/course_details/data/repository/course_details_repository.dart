import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tutors_plan/const/url_const.dart';
import 'package:tutors_plan/feature/course_details/data/course_details_response_body.dart';
import 'package:tutors_plan/feature/course_details/data/repository/course_module_response.dart';
import 'package:tutors_plan/feature/dashboard/data/course_get_response_body.dart';
import 'package:tutors_plan/feature/profile/data/profile_get_response_body.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/utils/network/api_client.dart';

class CourseDetailsRepository {
  Dio dio = Dio();

  Future<CourseDetails?> getCourseDetailsResponse(String courseId, {int? page, int? limit,}) async {
    try {
      dio = await ApiClient.dioClient(true);

      Response response = await dio.get('${UrlConst.getCourseDetailsEndpoint}/$courseId',);
      CourseDetailResponseBody data = CourseDetailResponseBody.fromJson(response.data);
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

  Future<Modules?> getCourseModulesResponse(String courseId) async {
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
