import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/const/enums.dart';

class ProfileController extends GetxController {
  final Rx<ScreenStates> screenStates = Rx<ScreenStates>(ScreenStates.DEFAULT);
  final Rx<ScreenStates> loaderState = Rx<ScreenStates>(ScreenStates.DEFAULT);

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  var profilePicture = ''.obs;
  final firstNameError = ''.obs;
  final lastNameError = ''.obs;
  final usernameError = ''.obs;
  final emailError = ''.obs;
  final phoneError = ''.obs;
  RxBool isEmailNotifications = true.obs;
  RxBool isAssignmentReminders = true.obs;
  RxBool isLiveClassAlerts = true.obs;
  RxBool isTwoFactorAuth = false.obs;
  RxBool isProfileVisible = true.obs;



  void updateViewState({ScreenStates? screenStates, ScreenStates? loadingState}) {
    if (screenStates != null) {
      this.screenStates.value = screenStates;
      loaderState.value = ScreenStates.LOADING_COMPLETE;
    }
    if (loadingState != null) loaderState.value = loadingState;
    update();
  }



}
