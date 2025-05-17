import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/common_widget/custom_snack_bar.dart';
import 'package:tutors_plan/common_widget/k_field.dart';
import 'package:tutors_plan/common_widget/loading_view_transparent.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/login/controller/login_controller.dart';
import 'package:tutors_plan/feature/register/view/registration_view.dart';
import 'package:tutors_plan/common_widget/base_button.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/route/app_pages.dart';
import 'package:tutors_plan/utils/extention/validator.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: _view(),
            )
        ),
        Obx(() {
          return loginController.loaderState.value == ScreenStates.TRANSPARENT_LOADING_START
          ? LoadingViewTransparent(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: ColorUtils.baseColor,
          ): SizedBox(); // or any other widget when the state doesn't match
        })

      ],
    );
  }

  Widget _view() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //appBar(),
        Expanded(child: _form()),
        //tosAndPp(),
      ],
    );
  }

  Widget appBar() {
    return  Text(
      'Login',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF353350),
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/tutorsPlan_logo_title.png',
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.height * 0.5,
            fit: BoxFit.contain,
          ),
          Obx((){
            return KField(
              headLine: 'Email Address',
              hintText: 'Your email address',
              controller: loginController.emailController,
              errorText: loginController.emailError.value,
              onChanged: (_) => loginController.emailError.value = Validators.validateEmail(loginController.emailController.text) ?? '',
              onTap: null,
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            );
          }),
          SizedBox(height: ResponsiveScale.of(context).hp(1)),
          Obx((){
            return KField(
              headLine: 'Password',
              hintText: 'Enter your password',
              controller: loginController.passwordController,
              errorText: loginController.passwordError.value,
              onChanged: (_) => loginController.passwordError.value = Validators.validatePassword(loginController.passwordController.text) ?? '',
              onTap: null,
              icon: Icons.lock_outline,
              keyboardType: TextInputType.emailAddress,
              showPassIcon: true,
              forgotPass: true,
              forgotPassOntap: (){
                SmartDialog.showToast('not implemented yet');
              },
            );
          }),
          SizedBox(height: ResponsiveScale.of(context).hp(2)),
          BaseButton(onClick: (){
            if (loginController.emailController.text.isEmpty) {
              loginController.emailError.value = 'Please enter email';
              return;
            }
            if (loginController.passwordController.text.isEmpty) {
              loginController.passwordError.value = 'Please enter password';
              return;
            }
            loginController.login(context);
          }, title: 'Login'),

          SizedBox(height: ResponsiveScale.of(context).hp(2)),
          BaseButton(onClick: (){
            preferences.setInt('initScreen', 1);
            ScaffoldMessenger.of(context).showSnackBar(customSnackBar('Temporary Login',context,subtitle: "Login shut down for server issue",color: ColorUtils.successSnackBarColor));
            Navigator.pushReplacementNamed(context, RouteNames.bottomNavigationWidget);
          }, title: 'Temporary Login'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account?'),
              TextButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterView()),
                );
              }, child: Text('Sign Up',style: TextStyle(color: ColorUtils.baseColor)))
            ],
          )

        ],
      ),
    );
  }
}