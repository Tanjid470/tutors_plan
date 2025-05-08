import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/common_widget/custom_snack_bar.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/login/data/login_response_body.dart';
import 'package:tutors_plan/feature/login/data/repository/login_repository.dart';
import 'package:tutors_plan/feature/login/domain/login_body.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/route/app_pages.dart';
import 'package:tutors_plan/utils/network/api_result.dart';

class LoginController extends GetxController{
  final Rx<ScreenStates> screenStates = Rx<ScreenStates>(ScreenStates.DEFAULT);
  final Rx<ScreenStates> loaderState = Rx<ScreenStates>(ScreenStates.DEFAULT);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  LoginRepository loginRepository = LoginRepository();
  LoginBody loginBody = LoginBody();

  Future<void> login(BuildContext context) async {
    updateViewState(loadingState: ScreenStates.TRANSPARENT_LOADING_START);

    await insertLoginBody();
    final result = await loginRepository.fetchLoginResponse(loginBody);

    if (result is ApiSuccess<LoginResponseBody>) {
      final loginResponse = result.data;
      final headers = result.headers;
      if (loginResponse.status == 'SUCCESS') {
        preferences.setInt('initScreen', 1);
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar('Login successfully',context,subtitle: "Explore your journey TutorsPlan",color: ColorUtils.successSnackBarColor));
        Navigator.pushReplacementNamed(context, RouteNames.bottomNavigationWidget);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar('Login status : ${loginResponse.status}',context,subtitle: loginResponse.message,color: ColorUtils.errorSnackBarColor));
      }
      headers?.forEach((key, value) {
        debugPrint('Header: $key => $value');
      });
    }
    else if (result is ApiError) {
      final apiError = result as ApiError;
      ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar('Login failed...!',context,subtitle: apiError.message,color: ColorUtils.errorSnackBarColor)
      );
    }
    updateViewState(screenStates: ScreenStates.LOADING_COMPLETE);
  }

  insertLoginBody() {
   loginBody = LoginBody(
     email: emailController.text.trim(),
     password: passwordController.text.trim(),
   );
  }

  void validationCheck() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty) {
      emailError.value = 'Email is required';
      return;
    } else {
      emailError.value = '';
    }

    if (password.isEmpty) {
      passwordError.value = 'Password is required';
      return;
    } else {
      passwordError.value = '';
    }
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