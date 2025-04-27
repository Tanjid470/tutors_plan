import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';

class Button2 extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final Widget? icon;
  final bool? inActive;
  final double? fontSize;
  final bool? scaleDown;
  final Widget? leading;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  const Button2({
    super.key,
    required this.onClick,
    required this.title,
    this.icon,
    this.inActive,
    this.fontSize,
    this.scaleDown,
    this.leading,
    this.padding,
    this.borderRadius,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return inActive != null && true
        ? Opacity(
          opacity: 0.50,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: ShapeDecoration(
              color: const Color(0xFF6A5AE0),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF3A327B)),
                borderRadius: BorderRadius.circular(29),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0xFF3A327B),
                  blurRadius: 0,
                  offset: Offset(3, 3),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              mainAxisSize: scaleDown == true ? MainAxisSize.min : MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize ?? TextSize.font18(context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                icon ?? const SizedBox()
              ],
            ),
          ),
        )
        : GestureDetector(
          onTap: onClick,
          child: Container(
            margin: const EdgeInsets.only(right: 2),
            padding: padding ?? EdgeInsets.symmetric(vertical: ResponsiveScale.of(context).hp(1)),
            decoration: ShapeDecoration(
              color: ColorUtils.competeBorderColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: ColorUtils.baseBlueColorShade700),
                borderRadius: BorderRadius.circular(borderRadius ?? 29),
              ),
              shadows: [
                BoxShadow(
                  color: ColorUtils.baseBlueColorShade700,
                  blurRadius: 0,
                  offset: Offset(2, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              mainAxisSize: scaleDown == true ? MainAxisSize.min : MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ?? const SizedBox(),
                scaleDown == true || leading != null
                    ? Padding(
                  // padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  padding: contentPadding ?? const EdgeInsets.only(left: 2, right: 12.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize ?? TextSize.font18(context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
                    : Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize ?? TextSize.font18(context),
                      fontWeight: FontWeight.w500,
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
