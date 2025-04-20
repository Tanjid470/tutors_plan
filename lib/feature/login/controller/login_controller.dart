import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/feature/domain/login_body.dart';
import 'package:tutors_plan/feature/login/data/repository/login_repository.dart';

class LoginController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  LoginRepository loginRepository = LoginRepository();
  LoginBody loginBody = LoginBody();

  Future<void> login() async{
    try {
      validationCheck();
      await insertLoginBody();
      //final response = await loginRepository.fetchLoginResponse(loginBody);
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