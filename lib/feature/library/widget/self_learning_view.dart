import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';

class SelfLearning extends StatefulWidget {
  const SelfLearning({super.key});

  @override
  SelfLearningState createState() => SelfLearningState();
}

class SelfLearningState extends State<SelfLearning> {
  int selectedIndex = 0;

  final List<String> tabTitles = ['Enroll Course', 'Recommend', 'Exploring'];

  Widget _buildContent() {
    switch (selectedIndex) {
      case 0:
        return Text('Enroll Course Content');
      case 1:
        return Text('Recommend Content');
      case 2:
        return Text('Exploring Content');
      default:
        return Text('Self learning');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(tabTitles.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? ColorUtils.baseBlueColor
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(tabTitles[index],
                  style: customTextStyle(
                    context,
                    color: selectedIndex == index ? Colors.white : Colors.black54,
                    fontSize: TextSize.font14(context),
                    fontWeight: FontWeight.w500
                  )
                ),
              ),
            );
          }),
        ),
        Expanded(
          child: Center(
            child: _buildContent(),
          ),
        ),
      ],
    );
  }
}
