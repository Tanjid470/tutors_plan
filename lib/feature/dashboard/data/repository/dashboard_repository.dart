import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tutors_plan/const/url_const.dart';
import 'package:tutors_plan/feature/dashboard/data/course_categories_response_body.dart';
import 'package:tutors_plan/feature/login/data/login_response_body.dart';
import 'package:tutors_plan/feature/login/domain/login_body.dart';
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
}
