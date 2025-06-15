import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tutors_plan/global_widget/base_button.dart';
import 'package:tutors_plan/global_widget/buttons.dart';
import 'package:tutors_plan/global_widget/loading_view_transparent.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/register/controller/countdown_controller.dart';
import 'package:tutors_plan/feature/register/controller/registration_controller.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/route/app_pages.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final RegistrationController registrationController = Get.put(RegistrationController());
  final CountdownController countdownController = Get.put(CountdownController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      countdownController.startCountdown();
    });
  }

  @override
  void dispose() {
    countdownController.dispose();
    Get.delete<RegistrationController>(force: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text(""),
            leading: InkWell(
              onTap: () =>  Navigator.pushReplacementNamed(context, RouteNames.registerView),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  otpHeader(),
                  SizedBox(height: ResponsiveScale.of(context).hp(2)),
                  otpInputField(),
                  const SizedBox(height: 30),
                  verifyButton(),
                  SizedBox(height: ResponsiveScale.of(context).hp(2)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Text('Don\'t receive OTP code?',
                        style: TextStyle(color: ColorUtils.grey,fontSize: TextSize.font14(context),fontWeight: FontWeight.bold),
                      ),
                      Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          countdown(),
                          Buttons(
                            style: ButtonsStyle.blueButton,
                            title: 'Resend',
                            titleSize: TextSize.font12(context),
                            horizontalPadding: 10,
                            verticalPadding: 5,
                            borderRadius: 5,
                            onTap: () async {
                              await registrationController.resendOtp(context);
                             // countdownController.startCountdown();
                            },
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
          ),
        ),
        Obx(() {
          return registrationController.loaderState.value == ScreenStates.TRANSPARENT_LOADING_START
              ? LoadingViewTransparent(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: ColorUtils.baseColor,
          )
              : SizedBox();
        })
      ],
    );
  }

  Widget otpInputField(){
    return PinCodeTextField(
      appContext: context,
      controller: registrationController.otpController,
      length: 6,
      obscuringCharacter: '*',
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 50,
        fieldWidth: 40,
        activeColor: ColorUtils.baseColor,
        selectedColor: ColorUtils.baseColor,
        inactiveColor: Colors.grey,
      ),
      onChanged: (value) {},
    );
  }

  Widget verifyButton(){
    return  BaseButton(
        onClick: () async{
          await registrationController.otpVerify(context);
        },
        borderRadius: 10,
        title: 'Verify'
    );
  }

  Widget otpHeader(){
    return Column(
      children: [
        Text("We just sent an email",
          style: customTextStyle(
            context,
            fontSize: TextSize.font18(context),
            color: ColorUtils.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text("Enter the security code we sent to ",
          style: customTextStyle(
            context,
            fontSize: TextSize.font16(context),
            color: ColorUtils.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(preferences.getString('email') ?? '',
          style: TextStyle(
            fontSize: TextSize.font16(context),
            color: ColorUtils.black,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget countdown() {
    return Obx(() {
      final minutes = countdownController.secondsLeft.value ~/ 60;
      final seconds = countdownController.secondsLeft.value % 60;
      final time = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

      return Text(
        time,
        style: TextStyle(fontSize: TextSize.font16(context), fontWeight: FontWeight.w600),
      );
    });
  }

}
