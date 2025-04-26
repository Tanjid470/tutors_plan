import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/common_widget/k_field.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/feature/register/controller/register_controller.dart';
import 'package:tutors_plan/common_widget/button.dart';
import 'package:tutors_plan/utils/extention/validator.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterController registerController = Get.put(RegisterController());



  @override
  void dispose() {
    Get.delete<RegisterController>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: ResponsiveScale.of(context).hp(5)),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new)),
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome to',
                              style: TextStyle(
                                  fontSize: TextSize.font24(context),
                                  fontFamily: 'HindSiliguri',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' TutorsPlan',
                              style: TextStyle(
                                  fontSize: TextSize.font24(context),
                                  color: ColorUtils.baseBlueColor,
                                  fontFamily: 'HindSiliguri',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            verticalGap(context, 2),
            allDataInputField(),
          ],
        ),
      ),
      floatingActionButton: registerButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget allDataInputField() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Obx((){
            return KField(
              headLine: 'Name',
              isRequiredField: true,
              hintText: 'Enter your name',
              controller: registerController.nameController,
              onTap: null,
              icon: Icons.person_2_outlined,
              keyboardType: TextInputType.emailAddress,
              errorText: registerController.nameError.value,
              onChanged: (_) => registerController.nameError.value = Validators.firstNameValidation(registerController.nameController.text),
            );
          }),
          Obx((){
            return KField(
              headLine: 'Email',
              hintText: 'Enter your email',
              controller: registerController.emailController,
              onTap: null,
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              errorText: registerController.emailError.value,
              onChanged: (_) => registerController.emailError.value = Validators.validateEmail(registerController.emailController.text) ?? '',
            );
          }),
          Obx((){
            return KField(
              headLine: 'Password',
              hintText: 'Enter your password',
              controller: registerController.passwordController,
              onTap: null,
              icon: Icons.lock_outlined,
              keyboardType: TextInputType.emailAddress,
              errorText: registerController.passwordError.value,
              onChanged: (_) => registerController.passwordError.value = Validators.validatePassword(registerController.passwordController.text) ?? '',
              showPassIcon: true,
            );
          }),



        ],
      ),
    );
  }

  Widget registerButton() {
    return SafeArea(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Button2(onClick: () {
        if (registerController.nameController.text.isEmpty) {
          registerController.nameError.value = 'Please enter name';
          return;
        }
        if (registerController.emailController.text.isEmpty) {
          registerController.emailError.value = 'Please enter email';
          return;
        }
        if (registerController.passwordController.text.isEmpty) {
          registerController.passwordError.value = 'Please enter password';
          return;
        }
        registerController.registerAccount(context);
        SmartDialog.showToast('not implemented yet');

      }, title: 'Register',),
    )
    );
  }


}
