import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/common_widget/buttons.dart';
import 'package:tutors_plan/common_widget/k_field.dart';
import 'package:tutors_plan/common_widget/loading_view_transparent.dart';
import 'package:tutors_plan/common_widget/toggle_switch_tile.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/profile/controller/profile_controller.dart';
import 'package:tutors_plan/utils/extention/validator.dart';

class ProfileView extends StatefulWidget {

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    profileController.getUserProfile();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: SizedBox(),
            title: const Text('Profile'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: profileController.profilePicture.value.isNotEmpty
                              ? NetworkImage(profileController.profilePicture.value)
                              : null,
                          child: profileController.profilePicture.value.isEmpty
                              ? const Icon(Icons.person, size: 45)
                              : null,
                        ),
                        const SizedBox(height: 12),
                        // Buttons(
                        //   style: ButtonsStyle.blueButton,
                        //   onTap: (){},
                        //   title: 'Change Avatar',
                        // )
                      ],
                    ),
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      Obx(() => KField(
                        headLine: 'First Name',
                        hintText: 'Enter your first name',
                        controller: profileController.firstNameController,
                        errorText: profileController.firstNameError.value,
                        onChanged: (_) => profileController.firstNameError.value =
                            Validators.validateName(profileController.firstNameController.text) ?? '',
                        onTap: null,
                        icon: Icons.person_outline,
                        readOnly: true,
                      )),

                      Obx(() => KField(
                        headLine: 'Last Name',
                        hintText: 'Enter your last name',
                        controller: profileController.lastNameController,
                        errorText: profileController.lastNameError.value,
                        onChanged: (_) => profileController.lastNameError.value =
                            Validators.validateName(profileController.lastNameController.text) ?? '',
                        onTap: null,
                        icon: Icons.person_outline,
                        readOnly: true,
                      )),

                      Obx(() => KField(
                        headLine: 'Username',
                        hintText: 'Choose a username',
                        controller: profileController.usernameController,
                        errorText: profileController.usernameError.value,
                        onChanged: (_) => profileController.usernameError.value =
                            Validators.validateName(profileController.usernameController.text) ?? '',
                        onTap: null,
                        icon: Icons.account_circle_outlined,
                        readOnly: true,
                      )),

                      Obx(() => KField(
                        headLine: 'Email Address',
                        hintText: 'Your email address',
                        controller: profileController.emailController,
                        errorText: profileController.emailError.value,
                        onChanged: (_) => profileController.emailError.value =
                            Validators.validateEmail(profileController.emailController.text) ?? '',
                        onTap: null,
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        readOnly: true,
                      )),

                      Obx(() => KField(
                        headLine: 'Phone Number',
                        hintText: 'Enter your phone number',
                        controller: profileController.phoneController,
                        errorText: profileController.phoneError.value,
                        onChanged: (_) => profileController.phoneError.value =
                            Validators.validatePhone(profileController.phoneController.text) ?? '',
                        onTap: null,
                        icon: Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
                        readOnly: true,
                      )),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300), // subtle border
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2), // slight shadow below the container
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      spacing: 15,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          spacing: 5,
                          children: [
                            Icon(Icons.notifications_outlined,color: ColorUtils.black87,size: TextSize.font20(context),),
                            Text(
                              'Notifications',
                              style: TextStyle(
                                color: const Color(0xFF3A3946),
                                fontSize: TextSize.font18(context),
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        ToggleSwitchTile(
                          title: 'Email Notifications',
                          subtitle: 'Receive email about your course updates',
                          disableSwitch: true,
                          switchValue: profileController.isEmailNotifications,
                        ),
                        ToggleSwitchTile(
                          title: 'Assignment Reminders',
                          subtitle: 'Get notified about upcoming assignments',
                          disableSwitch: true,
                          switchValue: profileController.isAssignmentReminders,
                        ),
                        ToggleSwitchTile(
                          title: 'Live Class Alerts',
                          subtitle: 'Receive notifications before live classes',
                          disableSwitch: true,
                          switchValue: profileController.isLiveClassAlerts,
                        ),

                      ],
                    )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300), // subtle border
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2), // slight shadow below the container
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      spacing: 15,
                      children: [
                        Row(
                          spacing: 5,
                          children: [
                            Icon(Icons.privacy_tip_outlined,color: ColorUtils.black87,size: TextSize.font20(context),),
                            Text(
                              'Privacy & Security',
                              style: TextStyle(
                                color: const Color(0xFF3A3946),
                                fontSize: TextSize.font18(context),
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        ToggleSwitchTile(
                          title: 'Two-Factor Authentication',
                          subtitle: 'Add an extra layer of security to your account',
                          disableSwitch: true,
                          switchValue: profileController.isTwoFactorAuth,
                        ),
                        ToggleSwitchTile(
                          title: 'Profile Visibility',
                          subtitle: 'Make your profile visible to other students',
                          disableSwitch: true,
                          switchValue: profileController.isProfileVisible,
                        ),
                      ],
                    )
                  ),




                ],
              ),
            ),
          ),
        ),
        Obx(() {
          return profileController.loaderState.value == ScreenStates.TRANSPARENT_LOADING_START
              ? LoadingViewTransparent(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: ColorUtils.baseColor,
              ): SizedBox(); // or any other widget when the state doesn't match
        })
      ],
    );
  }
}
