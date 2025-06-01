import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/feature/bottom_navigator/view/bottom_navigation_view.dart';
import 'package:tutors_plan/feature/category/view/category_view.dart';
import 'package:tutors_plan/feature/dashboard/view/dashboard_view.dart';
import 'package:tutors_plan/feature/learning/view/library_view.dart';
import 'package:tutors_plan/feature/login/view/login_view.dart';
import 'package:tutors_plan/feature/onboard/view/onboard_view.dart';
import 'package:tutors_plan/feature/register/view/registration_view.dart';
import 'package:tutors_plan/feature/register/view/widget/otp_view.dart';
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
      name:_Paths.libraryView,
      page: () => const LibraryView(),
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
    GetPage(
      name:_Paths.registerView,
      page: () =>  const RegisterView(),
      transition: Transition.rightToLeft,
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name:_Paths.otpView,
      page: () =>  const OtpView(),
      transition: Transition.rightToLeft,
      curve: Curves.fastOutSlowIn,
    ),
    // GetPage(
    //   name:_Paths.categoryView,
    //   page: () =>  const CategoryView(),
    //   transition: Transition.rightToLeft,
    //   curve: Curves.fastOutSlowIn,
    // ),
  ];
}