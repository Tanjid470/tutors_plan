
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tutors_plan/const/color_utils.dart';

class CustomShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? horizontalPadding;
  final double? horizontalMargin;
  final double? radius;
  final Widget? child;
  const CustomShimmer({
    super.key,
    this.height,
    this.width,
    this.horizontalPadding,
    this.horizontalMargin,
    this.radius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorUtils.shimmerColor,
      highlightColor: Colors.grey.shade100,
      child: child ?? Container(
        height: height ?? 15,
        width: width ?? 60,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0),
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 0),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(radius ?? 5),
        ),
      ),
    );
  }
}