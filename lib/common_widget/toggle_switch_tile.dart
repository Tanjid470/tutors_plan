import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';

class ToggleSwitchTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final RxBool switchValue;
  final Widget? textFieldWidget;
  final bool disableSwitch; // New parameter

  const ToggleSwitchTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.switchValue,
    this.textFieldWidget,
    this.disableSwitch = false, // Default to false
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF3A3946),
                    fontSize: TextSize.font16(context),
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: TextSize.font14(context),
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
              ],
            ),
          ),
          IgnorePointer(
            ignoring: disableSwitch,
            child: Switch(
              value: switchValue.value,
              onChanged: (newValue) => switchValue.value = newValue,
              activeTrackColor: ColorUtils.baseColor,
              activeColor: Colors.white,
              inactiveTrackColor: Colors.transparent,
              inactiveThumbColor: Colors.black,
            ),
          ),
        ],
      );
    });
  }
}
