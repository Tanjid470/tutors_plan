import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutors_plan/common_widget/base_button.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/course_subplot_card.dart';
import '../../../course_details/view/course_card_details_view.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String courseId;
  final int? itemNo;
  final String description;
  final String imageUrl;
  final String author;
  final int originalPrice;
  final int discountedPrice;
  final String duration;
  final int credits;
  final int students;
  final int modules;
  final bool hasScholarship;
  final List<String> features;

  const CourseCard({
    super.key,
    required this.title,
    required this.courseId,
    this.itemNo,
    required this.description,
    required this.imageUrl,
    required this.author,
    required this.duration,
    required this.credits,
    required this.students,
    required this.modules,
    required this.originalPrice,
    required this.discountedPrice,
    required this.hasScholarship,
    required this.features,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      margin: EdgeInsets.only(right: 10),
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
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              imageUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.5,
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          Center(child: const CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/dummy_image.jpg',
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.5,
                        fit: BoxFit.fill,
                      ),
                    )
                  : Image.asset(
                      'assets/images/dummy_image.jpg',
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.5,
                      fit: BoxFit.fill,
                    ),
              Positioned(
                  bottom: 5,
                  left: 5,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(colors: [
                            ColorUtils.baseBlueColorShade100,
                            ColorUtils.baseBlueColorShade300,
                          ]),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Text('Scholarship available',
                          style: whiteText(
                              fontWeight: FontWeight.w400,
                              TextSize.font8(context))))),
              Positioned(
                  top: 7,
                  right: 7,
                  child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.favorite_border,
                          color: Colors.red, size: TextSize.font14(context)))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: customTextStyle(context,
                        fontSize: TextSize.font16(context),
                        fontWeight: FontWeight.bold,
                        color: ColorUtils.black)),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    description,
                    style: customTextStyle(context,
                        fontSize: TextSize.font12(context),
                        fontWeight: FontWeight.bold,
                        color: ColorUtils.black54),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Column(
                  spacing: 5,
                  children: [
                    CourseSubplotCard(
                        context: context,
                        title: duration,
                        icon: Icons.date_range),
                    CourseSubplotCard(
                      context: context,
                      title: '$credits Credits',
                      icon: Icons.credit_score_sharp,
                    ),
                    CourseSubplotCard(
                      context: context,
                      title: '$students Students',
                      icon: Icons.groups,
                    ),
                    CourseSubplotCard(
                      context: context,
                      title: '$modules Modules',
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
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorUtils.grey)),
                            child: Icon(Icons.person,
                                size: TextSize.font14(context)),
                          ),
                          Expanded(
                            child: Text(
                              author,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: customTextStyle(context,
                                  fontSize: TextSize.font12(context),
                                  fontWeight: FontWeight.bold,
                                  color: ColorUtils.black54),
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
                          Text(
                            '\$ $originalPrice',
                            style: customTextStyle(context,
                                fontSize: TextSize.font10(context),
                                fontWeight: FontWeight.w500,
                                color: ColorUtils.grey),
                          ),
                          Text(
                            '\$ $discountedPrice',
                            style: customTextStyle(context,
                                fontSize: TextSize.font12(context),
                                fontWeight: FontWeight.bold,
                                color: ColorUtils.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                BaseButton(
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CourseDetailsScreen(courseId : courseId)),
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
