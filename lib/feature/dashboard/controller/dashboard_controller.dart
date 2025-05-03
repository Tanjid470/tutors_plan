import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/common_widget/custom_snack_bar.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/dashboard/data/course_categories_response_body.dart';
import 'package:tutors_plan/feature/dashboard/data/repository/dashboard_repository.dart';
import 'package:tutors_plan/feature/login/data/login_response_body.dart';
import 'package:tutors_plan/feature/login/data/repository/login_repository.dart';
import 'package:tutors_plan/feature/login/domain/login_body.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/route/app_pages.dart';
import 'package:tutors_plan/utils/network/api_result.dart';

class DashboardController extends GetxController{

  DashboardRepository dashboardRepository = DashboardRepository();

  List<CategoryListModel>? categoryList = [];

  RxBool isLoadingCategoryList = false.obs;

  Future<void> getCourseCategory() async {
    final result = await dashboardRepository.getCourseCategory(
      page: 1.toString(),
      limit:10.toString()
    );
    if (result != null) {
      isLoadingCategoryList.value = true;
      categoryList = result;
    }
  }

}