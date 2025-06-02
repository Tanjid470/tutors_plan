import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/profile/data/profile_get_response_body.dart';
import 'package:tutors_plan/feature/profile/data/repository/profile_repository.dart';

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

  ProfileRepository profileRepository = ProfileRepository();
  ProfileGetResponseBody profileGetResponseBody = ProfileGetResponseBody();


  void pickImage() {
    Get.snackbar("Change Avatar", "Feature not implemented yet.");
  }
  Future<void> getUserProfile() async {
    updateViewState(loadingState: ScreenStates.TRANSPARENT_LOADING_START);

    final result = await profileRepository.getUserProfile();
    if (result != null) {
      profileGetResponseBody = result;
      setProfileData();
      update();
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

  void setProfileData() {
    final data = profileGetResponseBody.results;
    if (data != null) {
      firstNameController.text = data.firstName ?? '';
      lastNameController.text = data.lastName ?? '';
      usernameController.text = data.username ?? '';
      emailController.text = data.email ?? '';
      phoneController.text = data.phoneNumber ?? '';
      profilePicture.value = data.profilePicture ?? '';
      update();
    }
  }


}
