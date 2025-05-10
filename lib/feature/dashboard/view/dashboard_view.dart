import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/dashboard/controller/dashboard_controller.dart';
import 'package:tutors_plan/feature/dashboard/widget/course_card.dart';
import 'package:tutors_plan/feature/dashboard/widget/learning_art_view.dart';
import 'package:tutors_plan/feature/dashboard/widget/program_card.dart';
import 'package:tutors_plan/feature/dashboard/widget/scholar_pass_view.dart';
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
      body: Column(
        children: [
          appBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  spacing: ResponsiveScale.of(context).hp(1),
                  children: [
                    verticalGap(context, 1),
                    courseCardView(),
                    categoryView(),
                    programCardView(),
                    verticalGap(context, 2),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget appBar(){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ ColorUtils.baseBlueColorShade100,ColorUtils.baseBlueColorShade500],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            verticalGap(context, 5),
            Row(
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
                                style: customTextStyle(context,fontSize: TextSize.font16(context),fontWeight: FontWeight.bold,color: ColorUtils.white)),
                            Text('example@gmail.com',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: customTextStyle(context,fontSize: TextSize.font12(context),fontWeight: FontWeight.w600,color: ColorUtils.white))
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
                        await showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: EdgeInsets.only(
                              right: 16,
                              top: kToolbarHeight + 10,
                            ),
                            alignment: Alignment.topRight,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.32,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  // Grid icons
                                  Expanded(
                                    child: GridView.count(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                      padding: EdgeInsets.zero,
                                      children: [
                                        _menuItem(Icons.videogame_asset_outlined, "Games"),
                                        _menuItem(Icons.handshake_outlined, "CRM"),
                                        _menuItem(Icons.school_outlined, "LMS"),
                                        _menuItem(Icons.work_outline, "Jobs"),
                                        _menuItem(Icons.groups_2_outlined, "Team"),
                                        _menuItem(Icons.edit_note, "Blog"),
                                        _menuItem(Icons.school_outlined, "ScholarPass"),
                                        _menuItem(Icons.stars_outlined, "TutorsPlan"), // Replace with asset if needed
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("More from TutorsPlan",style: TextStyle(color: ColorUtils.baseBlueColor,fontSize: TextSize.font14(context)),),
                                        SizedBox(width: 5),
                                        Icon(Icons.keyboard_arrow_down,size: TextSize.font20(context),color: ColorUtils.baseBlueColor),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.grid_view,
                        color: Colors.white,
                        size: ResponsiveScale.of(context).hp(3),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await preferences.clear();
                        Navigator.pushReplacementNamed(context, RouteNames.loginView);
                      },
                      child: CircleAvatar(
                        radius: ResponsiveScale.of(context).hp(2),
                        child: Icon(Icons.logout,color: Colors.red)
                      ),
                    ),
                  ],
                )
              ],
            ),
            verticalGap(context, 1),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 30, color: Colors.black),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget categoryView(){
    return Column(
      children: [
        Row(
          children: [
            Text('Categories',
              style: customTextStyle(
                  context,
                  fontSize: TextSize.font20(context),
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),

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
                height: MediaQuery.of(context).size.height * 0.175,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                  itemCount: dashboardController.categoryList?.length,
                  itemBuilder: (context, index) {
                    final categoryItem = dashboardController.categoryList?[index];
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.75,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurStyle: BlurStyle.outer,
                              offset: Offset(0, 0),
                              blurRadius: 5,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Image.network(
                              categoryItem?.image ?? '',
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: ResponsiveScale.of(context).wp(2)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(categoryItem?.name ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: TextSize.font16(context))
                                  ),
                                  Text(
                                    "${categoryItem?.seoKeywords.toString() ?? ''} courses",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
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
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
              : SizedBox();
        })
      ]
    );
  }

  Widget courseCardView(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recommended courses',
          style: customTextStyle(
              context,
              fontSize: TextSize.font20(context),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.43,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CourseCard();
            },
          ),
        ),
      ],
    );
  }

  Widget programCardView(){
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: ProgramCard(
            title: 'ScholarPASS',
            icon: Icons.school_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScholarPassView()),
              );
            },

          ),
        ),

        Expanded(
          child: ProgramCard(
            title: 'LearningART',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LearningARTView()),
              );
            },
            icon: Icons.style_outlined,
          ),
        )
      ],
    );
  }
}
