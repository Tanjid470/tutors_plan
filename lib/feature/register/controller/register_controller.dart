import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class RegisterController extends GetxController{

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxString nameError = ''.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;



  @override
  void onClose() {
    super.onClose();
    if (kDebugMode) {
      print("Controller disposed");
    }
  }

}