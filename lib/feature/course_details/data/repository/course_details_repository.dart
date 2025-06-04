import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tutors_plan/const/url_const.dart';
import 'package:tutors_plan/feature/course_details/data/course_details_response.dart';
import 'package:tutors_plan/feature/course_details/data/payment_response.dart';
import 'package:tutors_plan/feature/course_details/data/course_module_response.dart';
import 'package:tutors_plan/feature/dashboard/data/course_get_response.dart';
import 'package:tutors_plan/feature/profile/data/profile_get_response.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/utils/network/api_client.dart';

class CourseDetailsRepository {
  Dio dio = Dio();

  Future<CourseDetails?> getCourseDetailsResponse(String courseId, {int? page, int? limit}) async {
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

  Future<PaymentStripe?> courseEnrollPayment(String courseID) async {
    try {
      dio = await ApiClient.dioClient(true);
      var accessToken = preferences.getString('accessToken');
      Response response = await dio.post(
        UrlConst.courseEnrollmentEndpoint,
        data: {"productId": courseID},
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );
      PaymentResponse data = PaymentResponse.fromJson(response.data);
      if (data.status == 200) {
        return data.paymentStripe;
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
