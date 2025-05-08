import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(12),
     ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: ResponsiveScale.of(context).hp(2.5),
              backgroundColor: ColorUtils.baseBlueColorShade100,
              child: Icon(icon, size: TextSize.font24(context), color: Colors.black54)
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: TextSize.font16(context),
              ),
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: TextSize.font14(context),
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
