import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/feature/bottom_navigator/bottom_navigation_view.dart';
import 'package:tutors_plan/feature/dashboard/view/dashboard_view.dart';
import 'package:tutors_plan/feature/login/view/login_view.dart';
import 'package:tutors_plan/feature/onboard/onboard_view.dart';
import 'package:tutors_plan/main.dart';
part 'app_routes.dart';
class AppPages{
  AppPages._();

  static String INITIAL = isInitScreen == 0 || isInitScreen == null
      ? RouteNames.onboardView
      : RouteNames.bottomNavigationWidget;
  static final routes =[
    GetPage(
      name:_Paths.bottomNavigationWidget,
      page: () => const BottomNavigationWidget(),
      transition: Transition.leftToRight,
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name:_Paths.onboardView,
      page: () => const OnboardingView(),
      transition: Transition.leftToRight,
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name:_Paths.dashboardView,
      page: () => const DashboardView(),
      transition: Transition.leftToRight,
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name:_Paths.loginView,
      page: () =>  const LoginView(),
      transition: Transition.rightToLeft,
      curve: Curves.fastOutSlowIn,
    ),
  ];
}