import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';

class NoItemFound extends StatelessWidget {
  const NoItemFound({
    super.key,
    required this.context,
    required this.title,
    required this.subTitle,
  });

  final BuildContext context;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      padding: const EdgeInsets.all(20),
      radius: const Radius.circular(10),
      borderType: BorderType.RRect,
      color: const Color(0xFFDFE0E6),
      dashPattern: const [3, 6],
      strokeWidth: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/images/no-results.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(height: ResponsiveScale.of(context).hp(1)),
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF1B1A3A),
              fontSize: TextSize.font16(context),
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: ResponsiveScale.of(context).hp(1)),
          Text(subTitle,
            style: TextStyle(
              color: const Color(0xFF1B1A3A),
              fontSize: TextSize.font14(context),
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
