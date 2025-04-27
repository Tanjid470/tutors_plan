import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
class UserRoleCard extends StatelessWidget {
  const UserRoleCard({
    super.key,
    required this.context,
    required this.title,
    this.imageUrl,
    this.color,
    this.bgColor,
    this.isSelected = false,
  });

  final BuildContext context;
  final String title;
  final String? imageUrl;
  final Color? color;
  final Color? bgColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: isSelected ? color : bgColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imageUrl ?? 'assets/svg/graduation_cap.svg',
            width: 30,
            height: 30,
            color: isSelected ? Colors.white : Colors.black87,
          ),
          Text(
            title,
            style: customTextStyle(
              context,
              fontSize: TextSize.font18(context),
              color: isSelected ? Colors.white : ColorUtils.black,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
