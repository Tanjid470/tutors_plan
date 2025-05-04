
import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';

class CourseSubplotCard extends StatelessWidget {
  const CourseSubplotCard({
    super.key,
    required this.context,
    required this.title,
    required this.icon,
  });
  final BuildContext context;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Icon(icon,color: ColorUtils.baseBlueColor,size: TextSize.font12(context),),
        Text(title,
          style: customTextStyle(
              context,
              fontSize: TextSize.font12(context),
              fontWeight: FontWeight.bold,
              color: ColorUtils.black54
          ),
        ),
      ],
    );
  }
}
