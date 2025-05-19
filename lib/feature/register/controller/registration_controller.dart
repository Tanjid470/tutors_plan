import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/common_widget/custom_snack_bar.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/register/data/registration_response_body.dart';
import 'package:tutors_plan/feature/register/data/repository/app_roles_get_body.dart';
import 'package:tutors_plan/feature/register/data/repository/registration_repository.dart';
import 'package:tutors_plan/feature/register/domain/register_post_body.dart';
import 'package:tutors_plan/feature/register/domain/user_role.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/route/app_pages.dart';
import 'package:tutors_plan/utils/network/api_result.dart';

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

  RxBool isActiveOrArchive = true.obs;
  RxBool isEmailConfirmed = true.obs;
  RxBool isAccountLocked = true.obs;
  RxBool isPhoneNumberConfirmed = true.obs;
  RxBool isTwoFactorEnabled = true.obs;
  RxBool isLockoutEnabled = true.obs;

  RxString selectedUserRole = ''.obs;

  RegistrationRepository registrationRepository = RegistrationRepository();
  RegistrationPostBody registrationPostBody = RegistrationPostBody();

  @override
  void onClose() {
    super.onClose();
    if (kDebugMode) {
      print("Controller disposed");
    }
  }

  List<AppRoles>? appRoles = [];

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

  Future<void> getAppRoles() async {
    final result = await registrationRepository.getAppRole(
        page: 1.toString(),
        limit:20.toString()
    );
    if (result != null) {
      appRoles = result;
      update();
    }
  }

  Future<void> registerAccount(BuildContext context) async{
    updateViewState(loadingState: ScreenStates.TRANSPARENT_LOADING_START);
    //validationCheck();
    await insertRegistrationBody();
    final response = await registrationRepository.fetchRegistrationResponse(registrationPostBody);
    if (response is ApiSuccess<RegistrationResponseBody>) {
      final loginResponse = response.data;
      final headers = response.headers;
      if (loginResponse.status == 'SUCCESS') {
        preferences.setInt('initScreen', 1);
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar('Register successfully',context,subtitle: "Explore your journey TutorsPlan",color: ColorUtils.successSnackBarColor));
        Navigator.pushReplacementNamed(context, RouteNames.bottomNavigationWidget);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar('Register status : ${loginResponse.status}',context,subtitle: loginResponse.message,color: ColorUtils.errorSnackBarColor));
      }
      headers?.forEach((key, value) {
        debugPrint('Header: $key => $value');
      });
    }
    else if (response is ApiError) {
      final apiError = response as ApiError;
      ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar('Login failed...!',context,subtitle: apiError.message,color: ColorUtils.errorSnackBarColor)
      );
    }
    updateViewState(screenStates: ScreenStates.LOADING_COMPLETE);
  }

  insertRegistrationBody() {
    registrationPostBody = RegistrationPostBody(
      username: userNameController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      phoneNumber: phoneController.text.trim(),
      activeOrArchive: isActiveOrArchive.value,
      emailConfirmed: isEmailConfirmed.value,
      accountLock: isAccountLocked.value,
      phoneNumberConfirmed: isPhoneNumberConfirmed.value,
      twoFactorEnabled: isTwoFactorEnabled.value,
      lockoutEnabled: isLockoutEnabled.value,
      email: emailController.text.trim(),
      roles: [appRoleId],
      passwordHash: passwordController.text.trim(),
    );
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