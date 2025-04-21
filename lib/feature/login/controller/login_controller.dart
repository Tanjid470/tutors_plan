import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/feature/login/data/login_response_body.dart';
import 'package:tutors_plan/feature/login/data/repository/login_repository.dart';
import 'package:tutors_plan/feature/login/domain/login_body.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/route/app_pages.dart';

class LoginController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  LoginRepository loginRepository = LoginRepository();
  LoginBody loginBody = LoginBody();

  Future<void> login(BuildContext context) async{
    try {
      //validationCheck();
      await insertLoginBody();
      LoginResponseBody? response = await loginRepository.fetchLoginResponse(loginBody);
      if (response?.status == 'SUCCESS') {
        preferences.setInt('initScreen', 1);
        Navigator.pushReplacementNamed(context, RouteNames.dashboardView);
      }
    } catch (e) {
      SmartDialog.dismiss();
      SmartDialog.showToast('Login failed: $e');
    }
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
}