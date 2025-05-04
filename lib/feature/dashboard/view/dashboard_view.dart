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
import 'package:tutors_plan/feature/dashboard/widget/course_card.dart';
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
            verticalGap(context, 1),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.435,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CourseCard();
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
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.zero,
                              itemCount: dashboardController.categoryList?.length,
                              itemBuilder: (context, index) {
                                final categoryItem = dashboardController.categoryList?[index];
                                return Container(
                                  height: MediaQuery.of(context).size.height * 0.15,
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
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
                  ],
                ),
              ),
            )
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

