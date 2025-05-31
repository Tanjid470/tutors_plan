import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/common_widget/k_field.dart';
import 'package:tutors_plan/common_widget/loading_view_transparent.dart';
import 'package:tutors_plan/common_widget/toggle_switch_tile.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/register/controller/registration_controller.dart';
import 'package:tutors_plan/common_widget/base_button.dart';
import 'package:tutors_plan/feature/register/domain/user_role.dart';
import 'package:tutors_plan/feature/register/view/widget/user_role_card.dart';
import 'package:tutors_plan/utils/extention/validator.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegistrationController registerController = Get.put(RegistrationController());

  String? selectedMethod;


  @override
  void initState() {
    registerController.getAppRoles();
    super.initState();
  }
  @override
  void dispose() {
    Get.delete<RegistrationController>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                                      color: ColorUtils.baseColor,
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

        ),
        Obx(() {
          return registerController.loaderState.value == ScreenStates.TRANSPARENT_LOADING_START
              ? LoadingViewTransparent(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: ColorUtils.baseColor,
          ): SizedBox();
        })
      ],
    );
  }

  Widget allDataInputField() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
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
            Obx(() => KField(
              headLine: 'First Name',
              hintText: 'Enter your first name',
              controller: registerController.firstNameController,
              onTap: null,
              isRequiredField: true,
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
              headLine: 'Phone Number',
              hintText: 'Enter your phone number',
              isRequiredField: true,
              controller: registerController.phoneController,
              onTap: null,
              icon: Icons.phone_android_outlined,
              keyboardType: TextInputType.phone,
              errorText: registerController.phoneError.value,
              //onChanged: (_) => registerController.phoneError.value = Validators.validatePhone(registerController.phoneController.text) ?? '',
            )),

            Row(
              spacing: 5,
              children: [
                Text('Choose your role',
                    style: customTextStyle(
                      context,
                      fontSize: TextSize.font18(context),
                      color: ColorUtils.black,
                      fontWeight: FontWeight.w500,
                    )
                ),
                Text('*',
                    style: customTextStyle(
                      context,
                      fontSize: TextSize.font18(context),
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: registerController.userRoleTypeList.map((role) {
                final isSelected = selectedMethod == role.title;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedMethod = role.title;
                          registerController.roleSelect.value = '';
                          registerController.appRoleId = role.id ?? 4;
                          log(registerController.appRoleId.toString());
                        });
                      },
                      child: UserRoleCard(
                        context: context,
                        title: role.title,
                        imageUrl: role.imageUrl,
                        color: role.selectedColor,
                        bgColor: role.bgColor,
                        isSelected: isSelected,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Obx((){
              return registerController.roleSelect.value.isEmpty ?
                  Text('') : Text(registerController.roleSelect.value,style: customTextStyle(context,color: Colors.redAccent),);
            }),
            termsAndCondition(
              registerController.isChecked.value,
                  (bool? value) {
                setState(() {
                  registerController.isChecked.value = value ?? false;
                });
              },
            ),
            //toggleCardList(),

            verticalGap(context, 10)
          ],
        ),
      ),
    );
  }

  Widget termsAndCondition(bool isChecked, ValueChanged<bool?> onChanged) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          checkColor: Colors.white, // Check icon color (✓)
          fillColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.selected)) {
              return ColorUtils.baseColor; // When checked
            }
            return Colors.transparent; // When unchecked
          }),
          side: BorderSide(color: ColorUtils.baseColor, width: 2), // Border color
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 14, color: Colors.black),
              children: [
                TextSpan(text: 'I agree to the TutorsPlan '),
                TextSpan(
                  text: 'Terms of Service',
                  style: TextStyle(color: ColorUtils.baseColor,fontWeight: FontWeight.w500),
                ),
                TextSpan(text: ' & '),
                TextSpan(
                  text: 'Privacy Policy.',
                  style: TextStyle(color: ColorUtils.baseColor,fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }

  Widget toggleCardList(){
    return Column(
      children: [
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
      ],
    );
  }

  Widget registerButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BaseButton(onClick: () {
            if (registerController.emailController.text.isEmpty) {
              registerController.emailError.value = 'Please enter email';
              return;
            }
            if (registerController.passwordController.text.isEmpty) {
              registerController.passwordError.value = 'Please enter password';
              return;
            }
            if (registerController.appRoleId == 0) {
              registerController.roleSelect.value = 'Please chose your role';
              return;
            }
            registerController.registerAccount(context);

          }, title: 'Register',),
        ),
      ],
    );
  }


}
