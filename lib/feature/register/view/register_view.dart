import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/common_widget/k_field.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/feature/register/controller/register_controller.dart';
import 'package:tutors_plan/utils/extention/button.dart';


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
      floatingActionButton: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Button2(onClick: () {  }, title: 'Register',),
      )),
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
          KField(
            headLine: 'Name',
            hintText: 'Enter your name',
            controller: registerController.nameController,
            onTap: null,
            icon: Icons.person_2_outlined,
            keyboardType: TextInputType.emailAddress,
            errorText: null,
          ),
          KField(
            headLine: 'Email',
            hintText: 'Enter your email',
            controller: registerController.emailController,
            onTap: null,
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            errorText: null,
          ),
          KField(
            headLine: 'Password',
            hintText: 'Enter your password',
            controller: registerController.nameController,
            onTap: null,
            icon: Icons.lock_outlined,
            keyboardType: TextInputType.emailAddress,
            errorText: null,
          ),
        ],
      ),
    );
  }

}
