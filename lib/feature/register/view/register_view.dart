import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/common_widget/k_field.dart';
import 'package:tutors_plan/common_widget/toggle_switch_tile.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/register/controller/register_controller.dart';
import 'package:tutors_plan/common_widget/button.dart';
import 'package:tutors_plan/feature/register/view/widget/user_role_card.dart';
import 'package:tutors_plan/utils/extention/validator.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterController registerController = Get.put(RegisterController());
  final methods = {
    'Student': 'assets/svg/graduation_cap.svg',
    'Tutor': 'assets/svg/graduation_cap.svg',
    'Gradient': 'assets/svg/graduation_cap.svg',
  };
  String? selectedMethod;


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
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: TextSize.dynamicGap2(context)),
        height: TextSize.dynamicGap10(context),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(0, -3),
                blurRadius: 30,
                spreadRadius: 2,
              ),
            ],
          ),
          child: registerButton()
      ),
    //  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }

  Widget allDataInputField() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Obx(() => KField(
              headLine: 'Username',
              hintText: 'Enter your username',
              isRequiredField: true,
              controller: registerController.userNameController,
              onTap: null,
              icon: Icons.person_pin,
              keyboardType: TextInputType.text,
              errorText: registerController.usernameError.value,
              onChanged: (_) => registerController.usernameError.value = Validators.validateName(registerController.userNameController.text) ?? '',
            )),
            Obx(() => KField(
              headLine: 'First Name',
              hintText: 'Enter your first name',
              controller: registerController.firstNameController,
              onTap: null,
              icon: Icons.account_circle_outlined,
              keyboardType: TextInputType.text,
              errorText: registerController.firstNameError.value,
              onChanged: (_) => registerController.firstNameError.value = Validators.firstNameValidation(registerController.firstNameController.text),
            )),
            Obx(() => KField(
              headLine: 'Last Name',
              hintText: 'Enter your last name',
              controller: registerController.lastNameController,
              onTap: null,
              icon: Icons.person_outline,
              keyboardType: TextInputType.text,
              errorText: registerController.lastNameError.value,
              onChanged: (_) => registerController.lastNameError.value = Validators.lastNameValidation(registerController.lastNameController.text),
            )),
            Obx(() => KField(
              headLine: 'Email',
              hintText: 'Enter your email',
              isRequiredField: true,
              controller: registerController.emailController,
              onTap: null,
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              errorText: registerController.emailError.value,
              onChanged: (_) => registerController.emailError.value = Validators.validateEmail(registerController.emailController.text) ?? '',
            )),
            Obx(() => KField(
              headLine: 'Phone Number',
              hintText: 'Enter your phone number',
              isRequiredField: true,
              controller: registerController.phoneController,
              onTap: null,
              icon: Icons.phone_android_outlined,
              keyboardType: TextInputType.phone,
              errorText: registerController.phoneError.value,
              onChanged: (_) => registerController.phoneError.value = Validators.validatePhone(registerController.phoneController.text) ?? '',
            )),
            Obx(() => KField(
              headLine: 'Password',
              hintText: 'Enter your password',
              isRequiredField: true,
              controller: registerController.passwordController,
              onTap: null,
              icon: Icons.lock_outline,
              keyboardType: TextInputType.text,
              errorText: registerController.passwordError.value,
              onChanged: (_) => registerController.passwordError.value = Validators.validatePassword(registerController.passwordController.text) ?? '',
              showPassIcon: true,
            )),
            // Row(
            //   spacing: 10,
            //   children: [
            //     UserRoleCard(
            //       context: context,
            //       onTap: () {
            //         registerController.selectedUserRole.value = 'Teacher';
            //       },
            //       color: ColorUtils.baseBlueColorLight,
            //       title: 'Student',
            //     ),
            //     UserRoleCard(
            //       context: context,
            //       onTap: () {
            //         registerController.selectedUserRole.value = 'Student';
            //       },
            //       color: ColorUtils.baseOrangeColorLight,
            //       title: 'Tutor',
            //     ),
            //     UserRoleCard(
            //       context: context,
            //       onTap: () {
            //         registerController.selectedUserRole.value = 'Student';
            //       },
            //       color: ColorUtils.basePurpleColorLight,
            //       title: 'Gradient',
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              spacing: 10,
              children: methods.entries.map((entry) {
                final isSelected = selectedMethod == entry.key;
                return Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedMethod = entry.key;
                      });
                    },
                    child: UserRoleCard(
                      context: context,
                      title: entry.key,
                      imageUrl: entry.value,
                      isSelected: isSelected,
                    ),
                  ),
                );
              }).toList(),
            ),
            ToggleSwitchTile(
                title: 'Account Lock',
                switchValue: registerController.isAccountLocked),
            ToggleSwitchTile(
              title: 'Active or Archive',
              switchValue: registerController.isActiveOrArchive,
            ),
            ToggleSwitchTile(
              title: 'Email Confirmed',
              switchValue: registerController.isEmailConfirmed,
            ),
            ToggleSwitchTile(
              title: 'Phone Number Confirmed',
              switchValue: registerController.isPhoneNumberConfirmed,
            ),
            ToggleSwitchTile(
              title: 'Two Factor Enabled',
              switchValue: registerController.isTwoFactorEnabled,
            ),
            ToggleSwitchTile(
              title: 'Lockout Enabled',
              switchValue: registerController.isLockoutEnabled,
            ),

          verticalGap(context, 10)
          ],
        ),
      ),
    );
  }

  Widget registerButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Button2(onClick: () {
            if (registerController.userNameController.text.isEmpty) {
              registerController.usernameError.value = 'Please enter name';
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
        ),
      ],
    );
  }


}
