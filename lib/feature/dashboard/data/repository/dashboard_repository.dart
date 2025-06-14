import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tutors_plan/const/url_const.dart';
import 'package:tutors_plan/feature/dashboard/data/course_get_response.dart';
import 'package:tutors_plan/feature/profile/data/profile_get_response.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/utils/network/api_client.dart';

import '../../../category/data/category_response.dart';

class DashboardRepository {
 Dio dio = Dio();

 Future<List<CourseModel>?> getCourse({int? page, int? limit,}) async {
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
       UrlConst.getCoursesEndpoint,
       options: Options(
         headers: {
           'Authorization': 'Bearer $accessToken',
         },
       ),
       //queryParameters: queryParameters,
     );
     CoursesResponse data = CoursesResponse.fromJson(response.data);
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

 Future<List<Category>?> getCategory({int? page, int? limit,}) async {
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
       UrlConst.getCourseCategoryEndpoint,
       options: Options(
         headers: {
           'Authorization': 'Bearer $accessToken',
         },
       ),
     );
     CategoryResponse data = CategoryResponse.fromJson(response.data);
     if (data.status == 200) {
       return data.categories;
     }
     else {
       return null;
     }
   } catch (e) {
     debugPrint(e.toString());
   }
   return null;
 }

 Future<ProfileGetResponse?> getUserProfile({String? page, String? limit,}) async {
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
     ProfileGetResponse data = ProfileGetResponse.fromJson(response.data);

     if (data.status == 200) {
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

}
