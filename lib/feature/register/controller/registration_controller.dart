import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/common_widget/custom_snack_bar.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/register/data/otp_response_body.dart';
import 'package:tutors_plan/feature/register/data/registration_response_body.dart';
import 'package:tutors_plan/feature/register/data/app_roles_get_body.dart';
import 'package:tutors_plan/feature/register/data/repository/registration_repository.dart';
import 'package:tutors_plan/feature/register/domain/otp_body.dart';
import 'package:tutors_plan/feature/register/domain/register_post_body.dart';
import 'package:tutors_plan/feature/register/domain/user_role.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/route/app_pages.dart';
import 'package:tutors_plan/utils/network/api_result.dart';

class RegistrationController extends GetxController{
  final Rx<ScreenStates> screenStates = Rx<ScreenStates>(ScreenStates.DEFAULT);
  final Rx<ScreenStates> loaderState = Rx<ScreenStates>(ScreenStates.DEFAULT);

  TextEditingController otpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? appRoleId;

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

  RegistrationRepository registrationRepository = RegistrationRepository();
  RegistrationPostBody registrationPostBody = RegistrationPostBody();
  OTPBody otpBody = OTPBody();

  @override
  void onClose() {
    super.onClose();
    if (kDebugMode) {
      print("Controller disposed");
    }
  }

  List<AppRoles>? appRoles = [];

  final RxList<UserRole> userRoleTypeList = <UserRole>[].obs;

  Future<void> getAppRoles() async {
    final result = await registrationRepository.getAppRole();
    if (result != null) {
      appRoles = result;

      final filteredRoles = appRoles!.where((role) {
        final roleName = role.name?.toLowerCase();
        return roleName == 'tutor' || roleName == 'student' || roleName == 'guardian';
      }).map((role) => UserRole(
        title: role.name ?? '',
        imageUrl: 'assets/svg/graduation_cap.svg',
        id: role.id,
        selectedColor: _getColorByRoleName(role.name),
        bgColor: _getBgColorByRoleName(role.name),
      )).toList();

      userRoleTypeList.assignAll(filteredRoles);
      update();
    }
  }


  Color _getColorByRoleName(String? name) {
    switch (name?.toLowerCase()) {
      case 'student':
        return ColorUtils.baseColor;
      case 'tutor':
        return ColorUtils.baseOrangeColor;
      case 'guardian':
        return ColorUtils.basePurpleColor;
      default:
        return Colors.grey;
    }
  }

  Color _getBgColorByRoleName(String? name) {
    switch (name?.toLowerCase()) {
      case 'student':
        return ColorUtils.baseBlueColorLight;
      case 'tutor':
        return ColorUtils.baseOrangeColorLight;
      case 'guardian':
        return ColorUtils.basePurpleColorLight;
      default:
        return Colors.grey.shade200;
    }
  }


  Future<void> registerAccount(BuildContext context) async{
    updateViewState(loadingState: ScreenStates.TRANSPARENT_LOADING_START);
    await insertRegistrationBody();
    final response = await registrationRepository.fetchRegistrationResponse(registrationPostBody);
    if (response is ApiSuccess<RegistrationResponseBody>) {
      final loginResponse = response.data;
      if (loginResponse.status == 201) {
        preferences.setInt('initScreen', 1);
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar('OTP sent successfully',context,subtitle: "Verify your email address",color: ColorUtils.successSnackBarColor));
        Navigator.pushNamed(context, RouteNames.otpView);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar('OTO status : ${loginResponse.status}',context,subtitle: loginResponse.message,color: ColorUtils.errorSnackBarColor));
      };
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
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      profilePicture: "",
      phone: phoneController.text.trim(),
      roles: [appRoleId ?? ''],
    );
  }


  Future<void> otpVerify(BuildContext context) async{
    updateViewState(loadingState: ScreenStates.TRANSPARENT_LOADING_START);
    await insertOTPBody();
    final response = await registrationRepository.fetchOTPResponse(otpBody);
    if (response is ApiSuccess<OtpResponseBody>) {
      final otpResponse = response.data;
      final headers = response.headers;
      if (otpResponse.status == 201) {
        preferences.setInt('initScreen', 1);
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar('Register successfully',context,subtitle: "Email verified",color: ColorUtils.successSnackBarColor));
        Navigator.pushReplacementNamed(context, RouteNames.bottomNavigationWidget);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar('Register status : ${otpResponse.status}',context,subtitle: otpResponse.message,color: ColorUtils.errorSnackBarColor));
      }
      headers?.forEach((key, value) {
        debugPrint('Header: $key => $value');
      });
    }
    else if (response is ApiError) {
      final apiError = response as ApiError;
      ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar('Email verification failed...!',context,subtitle: apiError.message,color: ColorUtils.errorSnackBarColor)
      );
    }
    updateViewState(screenStates: ScreenStates.LOADING_COMPLETE);
  }

  insertOTPBody() {
    otpBody = OTPBody(
      email: emailController.text.trim(),
      otp: otpController.text.trim(),
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