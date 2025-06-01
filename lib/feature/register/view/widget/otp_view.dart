import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tutors_plan/common_widget/base_button.dart';
import 'package:tutors_plan/common_widget/loading_view_transparent.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/register/controller/registration_controller.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final RegistrationController registrationController = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text(""),
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                Text(registrationController.emailController.text,
                  style: customTextStyle(
                    context,
                    fontSize: TextSize.font16(context),
                    color: ColorUtils.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                PinCodeTextField(
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
                ),
                const SizedBox(height: 30),
                BaseButton(
                    onClick: () async{
                      await registrationController.otpVerify(context);
                    },
                    borderRadius: 10,
                    title: 'Verify'
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t receive OTP code?'),
                    InkWell(
                      onTap: () async {
                        await registrationController.resendOtp(context);
                      },
                      child: Text('Resend',style: TextStyle(color: ColorUtils.baseColor))
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
          ): SizedBox();
        })
      ],
    );
  }
}
