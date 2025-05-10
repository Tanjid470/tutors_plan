
import 'package:flutter/material.dart';
import 'package:tutors_plan/common_widget/base_button.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/dashboard/widget/course_subplot_card.dart';

import 'course_card_details_view.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      margin: EdgeInsets.only(right: 10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.outer,
              offset: Offset(0, 0),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.5,
                'assets/images/dummy_image.jpg',
                fit: BoxFit.cover,
              ),
              Positioned(
                  bottom: 5,
                  left: 5,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                              colors: [
                                ColorUtils.baseBlueColorShade100,
                                ColorUtils.baseBlueColorShade300,
                              ]
                          )
                      ),
                      child: Text('Scholarship available',
                          style:whiteText(fontWeight: FontWeight.w400,TextSize.font8(context)))
                  )
              ),
              Positioned(
                  top: 7,
                  right: 7,
                  child: Icon(Icons.favorite_border,color: Colors.red,size: TextSize.font14(context))
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('History Adventure',
                    style: customTextStyle(
                        context,
                        fontSize: TextSize.font16(context),
                        fontWeight: FontWeight.bold,
                        color: ColorUtils.black
                    )
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text('Explore world history with Grade 5-level activities and stories',
                    style: customTextStyle(
                        context,
                        fontSize: TextSize.font12(context),
                        fontWeight: FontWeight.bold,
                        color: ColorUtils.black54
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Column(
                  spacing: 5,
                  children: [
                    CourseSubplotCard(
                        context: context,
                        title: '4 months Duration',
                        icon: Icons.date_range
                    ),
                    CourseSubplotCard(
                      context: context,
                      title: '25 Tutoring Sessions',
                      icon: Icons.school,
                    ),
                    CourseSubplotCard(
                      context: context,
                      title: '18 Video Lessons',
                      icon: Icons.play_circle_fill,
                    ),
                    CourseSubplotCard(
                      context: context,
                      title: '12 Book Lessons',
                      icon: Icons.menu_book,
                    ),
                    CourseSubplotCard(
                      context: context,
                      title: '8 Modules',
                      icon: Icons.view_module,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Row(
                        spacing: 3,
                        children: [
                          Container(
                            height : 20,
                            width : 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorUtils.grey)
                            ),
                            child: Icon(Icons.person,size: TextSize.font14(context)),
                          ),
                          Expanded(
                            child: Text('Tanjid Hossain Amran',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: customTextStyle(
                                  context,
                                  fontSize: TextSize.font12(context),
                                  fontWeight: FontWeight.bold,
                                  color: ColorUtils.black54
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        spacing: 3,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('\$60',
                            style: customTextStyle(
                                context,
                                fontSize: TextSize.font10(context),
                                fontWeight: FontWeight.w500,
                                color: ColorUtils.grey
                            ),
                          ),
                          Text('\$50',
                            style: customTextStyle(
                                context,
                                fontSize: TextSize.font12(context),
                                fontWeight: FontWeight.bold,
                                color: ColorUtils.black54
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                BaseButton(
                  onClick: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CourseDetailsScreen()),
                    );
                  },
                  title: 'Enroll Now',
                  fontSize: TextSize.font12(context),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  borderRadius: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}