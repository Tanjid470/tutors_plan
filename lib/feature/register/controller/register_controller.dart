import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/register/data/repository/register_repository.dart';
import 'package:tutors_plan/feature/register/domain/register_data_body.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/route/app_pages.dart';
class RegisterController extends GetxController{
  final Rx<ScreenStates> screenStates = Rx<ScreenStates>(ScreenStates.DEFAULT);
  final Rx<ScreenStates> loaderState = Rx<ScreenStates>(ScreenStates.DEFAULT);

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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

  RegisterRepository registerRepository = RegisterRepository();
  RegistrationDataBody registerDataBody = RegistrationDataBody();
  @override
  void onClose() {
    super.onClose();
    if (kDebugMode) {
      print("Controller disposed");
    }
  }
  Future<void> registerAccount(BuildContext context) async{
    updateViewState(loadingState: ScreenStates.TRANSPARENT_LOADING_START);
    //validationCheck();
    await insertLoginBody();
    //LoginResponseBody? response = await loginRepository.fetchLoginResponse(loginBody);
    // if (response?.status == 'SUCCESS') {
    //   preferences.setInt('initScreen', 1);
    //   Navigator.pushReplacementNamed(context, RouteNames.dashboardView);
    // }
    updateViewState(screenStates: ScreenStates.LOADING_COMPLETE);
  }

  insertLoginBody() {
    registerDataBody = RegistrationDataBody(
      email: emailController.text.trim(),
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