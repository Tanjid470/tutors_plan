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
  final Rx<ScreenStates> screenStates = Rx<ScreenStates>(ScreenStates.DEFAULT);
  final Rx<ScreenStates> loaderState = Rx<ScreenStates>(ScreenStates.DEFAULT);

  DashboardRepository dashboardRepository = DashboardRepository();

  List<CategoryListModel>? categoryList = [];

  Future<void> getCourseCategory() async {
    updateViewState(loadingState: ScreenStates.TRANSPARENT_LOADING_START);
    final result = await dashboardRepository.getCourseCategory(
      page: 1.toString(),
      limit:10.toString()
    );
    if (result != null) {
      categoryList = result;
    }
    updateViewState(screenStates: ScreenStates.LOADING_COMPLETE);
  }

  void updateViewState({ScreenStates? screenStates, ScreenStates? loadingState}) {
    if (screenStates != null) {
      this.screenStates.value = screenStates;
      loaderState.value = ScreenStates.LOADING_COMPLETE;
    }
    if (loadingState != null) loaderState.value = loadingState;
    update();
  }
}