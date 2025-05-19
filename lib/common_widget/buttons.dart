import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
class Buttons extends StatelessWidget {
  final ButtonsStyle style;
  final VoidCallback onTap;
  final String? value;
  final String? initializer, title;
  final bool? isSelected;
  final Widget? icon;
  final BuildContext? context;
  final double? titleSize;
  final Color? bgColor;
  final Color? shadowColor;
  final Color? textColor;

  const Buttons(
      {super.key,
        required this.style,
        this.title,
        required this.onTap,
        this.value,
        this.initializer,
        this.isSelected,
        this.icon,
        this.context,
        this.titleSize,
        this.bgColor,
        this.shadowColor,
        this.textColor,
      });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case (ButtonsStyle.blueButton):
        return blueButton(onTap, title, icon, context);
      case (ButtonsStyle.dynamicButton):
        return dynamicButton(onTap, title, icon, context,bgColor,shadowColor,textColor);
      }
  }

  Widget blueButton(VoidCallback onClick, String? title, Widget? icon, context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,horizontal: 20
        ),
        decoration: BoxDecoration(
          color: ColorUtils.baseColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: TextSize.font16(context),
                fontWeight: FontWeight.w500,
              ),
            ),
            icon ?? const SizedBox()
          ],
        ),
      ),
    );
  }

  Widget dynamicButton(VoidCallback onClick, String? title, Widget? icon, context,Color? bgColor,Color? shadowColor,Color? textColor) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.only(right: 2),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: ShapeDecoration(
          color: bgColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1,  color: shadowColor ?? ColorUtils.baseColor),
            borderRadius: BorderRadius.circular(29),
          ),
          shadows: [
            BoxShadow(
              color: shadowColor ?? const Color(0xFF8E263B),
              blurRadius: 0,
              offset: Offset(3, 3),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(

          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: TextSize.font16(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            icon ?? const SizedBox()
          ],
        ),
      ),
    );
  }

}



