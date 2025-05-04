
import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';

class ProgramCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  const ProgramCard({
    super.key, required this.title, required this.onTap, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ColorUtils.baseBlueColorShade700, ColorUtils.baseBlueColorShade300],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: ResponsiveScale.of(context).hp(1),
            children: [
              Icon(icon,color: ColorUtils.white,size: TextSize.font36(context),),
              Text(title,
                  style: customTextStyle(
                      context,
                      fontSize: TextSize.font24(context),
                      fontWeight: FontWeight.bold,
                      color: ColorUtils.white
                  )
              ),

            ],
          )
      ),
    );
  }
}
