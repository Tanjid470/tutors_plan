import 'package:flutter/material.dart';
import 'package:tutors_plan/common_widget/button.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/route/app_pages.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () async {
              await preferences.clear();
              Navigator.pushReplacementNamed(context, RouteNames.loginView);
            }
            , icon: Icon(Icons.logout,color: Colors.red,),)
        ],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
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
              Image.asset(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.5,
                'assets/images/dummy_image.jpg',
                fit: BoxFit.cover,
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
                    Button2(
                      onClick: (){}, 
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
        ),
      ),
    );
  }
}

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
