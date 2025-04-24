import 'package:flutter/material.dart';
import 'package:tutors_plan/const/color_utils.dart';
class LoadingViewTransparent extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  const LoadingViewTransparent({super.key, this.height, this.width, this.color});
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1,
      child: Container(
          color: const Color(0x80000000),
          height: height ?? MediaQuery.of(context).size.height,
          width: width ?? MediaQuery.of(context).size.width,
          child: Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                  backgroundColor: color ?? Color(0xfff8f8f8),
                  valueColor:
                  AlwaysStoppedAnimation<Color>(ColorUtils.greyColor))
          )),
    );
  }
}