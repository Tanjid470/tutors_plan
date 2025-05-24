
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/register/view/widget/user_role.dart';

class RegistrationController extends GetxController{
  final Rx<ScreenStates> screenStates = Rx<ScreenStates>(ScreenStates.DEFAULT);
  final Rx<ScreenStates> loaderState = Rx<ScreenStates>(ScreenStates.DEFAULT);

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  int appRoleId = 0;

  RxBool isChecked = false.obs;
  RxString usernameError = ''.obs;
  RxString firstNameError = ''.obs;
  RxString lastNameError = ''.obs;
  RxString emailError = ''.obs;
  RxString phoneError = ''.obs;
  RxString passwordError = ''.obs;
  RxString roleSelect = ''.obs;

  RxBool isActiveOrArchive = true.obs;
  RxBool isEmailConfirmed = true.obs;
  RxBool isAccountLocked = true.obs;
  RxBool isPhoneNumberConfirmed = true.obs;
  RxBool isTwoFactorEnabled = true.obs;
  RxBool isLockoutEnabled = true.obs;

  RxString selectedUserRole = ''.obs;



  final List<UserRole> userRoleTypeList = [
    UserRole(
      title: 'Student',
      imageUrl: 'assets/svg/graduation_cap.svg',
      selectedColor: ColorUtils.baseColor,
      bgColor: ColorUtils.baseBlueColorLight,
      id: 4,
    ),
    UserRole(
      title: 'Tutor',
      imageUrl: 'assets/svg/graduation_cap.svg',
      selectedColor: ColorUtils.baseOrangeColor,
      bgColor: ColorUtils.baseOrangeColorLight,
      id: 3,
    ),
    UserRole(
      title: 'Guardian',
      imageUrl: 'assets/svg/graduation_cap.svg',
      selectedColor: ColorUtils.basePurpleColor,
      bgColor: ColorUtils.basePurpleColorLight,
      id: 5,
    ),
  ];

  void updateViewState({ScreenStates? screenStates, ScreenStates? loadingState}) {
    if (screenStates != null) {
      this.screenStates.value = screenStates;
      loaderState.value = ScreenStates.LOADING_COMPLETE;
    }
    if (loadingState != null) loaderState.value = loadingState;
    update();
  }
}