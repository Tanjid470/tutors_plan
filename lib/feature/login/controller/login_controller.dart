import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/const/enums.dart';


class LoginController extends GetxController{
  final Rx<ScreenStates> screenStates = Rx<ScreenStates>(ScreenStates.DEFAULT);
  final Rx<ScreenStates> loaderState = Rx<ScreenStates>(ScreenStates.DEFAULT);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;


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