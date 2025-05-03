import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/common_widget/button.dart';
import 'package:tutors_plan/common_widget/loading_view_transparent.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/dashboard/controller/dashboard_controller.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/route/app_pages.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  DashboardController dashboardController = Get.put(DashboardController());

  @override
  void initState() {
    dashboardController.getCourseCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            verticalGap(context, 5),
            appBar(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.42,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5),
                    child: CourseCard(),
                  );
                },
              ),
            ),
            Row(
              children: [
                Text('Categories',
                  style: customTextStyle(
                      context,
                      fontSize: TextSize.font20(context),
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(dashboardController.categoryList!.length.toString(),
                  style: customTextStyle(
                      context,
                      fontSize: TextSize.font14(context),
                  )
                ),
                Text('See all',
                  style: customTextStyle(
                      context,
                      fontSize: TextSize.font14(context),
                  )
                ),
              ],
            ),
            Obx((){
              return dashboardController.isLoadingCategoryList.value
                  ? SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(12),
                  itemCount: dashboardController.categoryList?.length,
                  itemBuilder: (context, index) {
                    final categoryItem = dashboardController.categoryList?[index];
                    return SizedBox(
                      width: 300,
                      child: Card(
                        elevation: 3,
                        color: Colors.white,
                        margin: const EdgeInsets.only(right: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Image.network(
                                categoryItem?.image ?? '',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(categoryItem?.name ?? '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 16)),
                                    const SizedBox(height: 6),
                                    Text(
                                      categoryItem?.description ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    Text(
                                      "${categoryItem?.totalCourse.toString() ?? ''} courses",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "${categoryItem?.enrolledStudents.toString() ?? ''} students",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ) : SizedBox();
            })
          ],
        ),
      ),
    );
  }

  Widget appBar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 10,
      children: [
        Expanded(
          child: Row(
            spacing: 10,
            children: [
              Container(
                padding: EdgeInsets.all(2), // Border thickness
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorUtils.baseBlueColor, width: 2), // Change color & width
                ),
                child: CircleAvatar(
                  radius: ResponsiveScale.of(context).hp(3),
                  child: Icon(Icons.person),
                  //child: Image.asset('assets/images/tutorsPlan_logo.png'),
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User name',
                        maxLines: 1,overflow: TextOverflow.ellipsis,
                        style: customTextStyle(context,fontSize: TextSize.font16(context),fontWeight: FontWeight.bold,color: ColorUtils.black)),
                    Text('example@gmail.com',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: customTextStyle(context,fontSize: TextSize.font12(context),fontWeight: FontWeight.w600,color: ColorUtils.black54))
                  ],
                ),
              )
            ],
          ),
        ),
        Row(
          spacing: 10,
          children: [
            InkWell(
              onTap: () async {
                SmartDialog.showToast('Not implement yet...!');
              },
              child: Icon(Icons.notifications_active_outlined,color: Colors.black,),
            ),
            InkWell(
              onTap: () async {
                await preferences.clear();
                Navigator.pushReplacementNamed(context, RouteNames.loginView);
              },
              child: Icon(Icons.logout,color: Colors.red,),
            ),
          ],
        )
      ],
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.transparent,
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
