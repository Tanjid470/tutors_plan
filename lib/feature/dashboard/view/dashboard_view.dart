import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/common_widget/custom_simmer.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/dashboard/controller/dashboard_controller.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/stat_card.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/course_card.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/k12_bundle_card.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/learning_art_view.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/program_card.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/scholar_pass_view.dart';
import 'package:tutors_plan/feature/learning/view/widget/more_info_tutorsplan_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  void initState() {
    // dashboardController.getCourseCategory(categoryPage: dashboardController.categoryPage);
    dashboardController.getCourse(coursePage: dashboardController.coursePage);
    dashboardController.getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appBar(),
          body(),
        ],
      ),
    );
  }

  Widget body(){
    return Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              spacing: ResponsiveScale.of(context).hp(1),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalGap(context, 1),
                sliderView(),
                //statView(),
                courseCardView(),
                ScholarPassBundle(),
                // categoryView(),
                programCardView(),
                verticalGap(context, 2),
              ],
            ),
          ),
        ),
      );
  }

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorUtils.baseBlueColorShade100,
            ColorUtils.baseBlueColorShade500
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            verticalGap(context, 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10,
              children: [
                Obx(() {
                  return dashboardController.isProfileLoading.value
                    ? Expanded(
                              child: Row(
                                spacing: 10,
                                children: [
                                  Container(
                                    clipBehavior:
                                    Clip.hardEdge, // Border thickness
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: ColorUtils.baseColor,
                                          width: 2), // Change color & width
                                    ),
                                    child: CircleAvatar(
                                      radius:
                                      ResponsiveScale.of(context).hp(3),
                                      backgroundColor: Colors.white,
                                      child: Image.asset(
                                          'assets/images/no_profile.jpg',
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      spacing: 5,
                                      children: [
                                        CustomShimmer(
                                          height: 16,
                                          width: 120,
                                        ),
                                        CustomShimmer(
                                          height: 14,
                                          width: 80,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                    : Expanded(
                      child: Row(
                                  spacing: 10,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge, // Border thickness
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white// Change color & width
                                      ),
                                      child: CircleAvatar(
                                        radius: ResponsiveScale.of(context).hp(3),
                                        backgroundColor: Colors.white,
                                        child: Image.asset('assets/images/no_profile.jpg',
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              '${dashboardController.profileGetResponseBody.results?.firstName} ${dashboardController.profileGetResponseBody.results?.lastName}' ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: customTextStyle(
                                                context,
                                                fontSize: TextSize.font16(context),
                                                fontWeight: FontWeight.bold,
                                                color: ColorUtils.white)
                                          ),
                                          Text(
                                              dashboardController.profileGetResponseBody.results?.email ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: customTextStyle(context,
                                                  fontSize: TextSize.font12(context),
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorUtils.white)
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                    );
                }),
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
                                onTap: () {
                                  Navigator.pop(context);
                                  Get.to(() => MoreInfoTutorsPlanView());
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "More from TutorsPlan",
                                      style: TextStyle(
                                          color: ColorUtils.baseColor,
                                          fontSize:
                                              TextSize.font14(context)),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.keyboard_arrow_down,
                                        size: TextSize.font20(context),
                                        color: ColorUtils.baseColor),
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

  // Widget categoryView() {
  //   return Column(children: [
  //     Row(
  //       children: [
  //         Text(
  //           'Categories',
  //           style: customTextStyle(context,
  //               fontSize: TextSize.font20(context),
  //               fontWeight: FontWeight.bold),
  //         ),
  //         const Spacer(),
  //         InkWell(
  //           onTap: () {
  //             Navigator.pushNamed(context, RouteNames.categoryView);
  //           },
  //           child: Text('See all',
  //               style: customTextStyle(
  //                 context,
  //                 fontSize: TextSize.font14(context),
  //               )),
  //         ),
  //       ],
  //     ),
  //     Obx(() {
  //       return dashboardController.isLoadingCategoryList.value
  //           ? SizedBox(
  //               height: MediaQuery.of(context).size.height * 0.175,
  //               child: ListView.builder(
  //                 shrinkWrap: true,
  //                 scrollDirection: Axis.horizontal,
  //                 padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
  //                 itemCount: dashboardController.categoryList?.length,
  //                 itemBuilder: (context, index) {
  //                   final categoryItem =
  //                       dashboardController.categoryList?[index];
  //                   return Container(
  //                     height: MediaQuery.of(context).size.height * 0.15,
  //                     width: MediaQuery.of(context).size.width * 0.75,
  //                     padding: const EdgeInsets.symmetric(
  //                         horizontal: 10, vertical: 5),
  //                     margin: const EdgeInsets.only(right: 10),
  //                     decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         boxShadow: [
  //                           BoxShadow(
  //                             color: Colors.grey.shade200,
  //                             blurStyle: BlurStyle.outer,
  //                             offset: Offset(0, 0),
  //                             blurRadius: 5,
  //                           ),
  //                         ],
  //                         border: Border(
  //                           left: BorderSide(
  //                               color: ColorUtils.baseColor, width: 4),
  //                         ),
  //                         borderRadius: BorderRadius.all(Radius.circular(10))),
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(12),
  //                       child: Row(
  //                         children: [
  //                           categoryItem?.image != null
  //                               ? Image.network(
  //                                   categoryItem?.image ?? '',
  //                                   width: 70,
  //                                   height: 70,
  //                                   fit: BoxFit.cover,
  //                                 )
  //                               : Image.asset(
  //                                   'assets/images/dummy_image.jpg',
  //                                   width: 70,
  //                                   height: 70,
  //                                   fit: BoxFit.cover,
  //                                 ),
  //                           SizedBox(width: ResponsiveScale.of(context).wp(2)),
  //                           Expanded(
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text(categoryItem?.name ?? '',
  //                                     maxLines: 1,
  //                                     overflow: TextOverflow.ellipsis,
  //                                     style: TextStyle(
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: TextSize.font16(context))),
  //                                 Text(
  //                                   "${categoryItem?.seoKeywords.toString() ?? ''} courses",
  //                                   maxLines: 2,
  //                                   overflow: TextOverflow.ellipsis,
  //                                 ),
  //                                 const Spacer(),
  //                                 Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     Text(
  //                                       "${categoryItem?.totalCourse.toString() ?? ''} courses",
  //                                       maxLines: 2,
  //                                       overflow: TextOverflow.ellipsis,
  //                                     ),
  //                                     Text(
  //                                       "${categoryItem?.enrolledStudents.toString() ?? ''} students",
  //                                       maxLines: 2,
  //                                       overflow: TextOverflow.ellipsis,
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   );
  //                 },
  //               ),
  //             )
  //           : SizedBox();
  //     })
  //   ]);
  // }

  Widget courseCardView() {
    return Obx(() {
      return dashboardController.isLoadingCourseList.value
          ? Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(
                  'Trending courses',
                  style: customTextStyle(context,
                      fontSize: TextSize.font20(context),
                      fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: dashboardController.courseList?.asMap().entries.map((entry) {
                      final index = entry.key;
                      final courses = entry.value;
                      return CourseCard(
                          title: courses.name ?? 'title of the course',
                          itemNo: index,
                          description: courses.shortDescription ?? 'shortDescription of the course',
                          imageUrl: courses.thumbnailImage ??'',
                          author: '',
                          originalPrice: courses.regularPrice ?? 0,
                          discountedPrice: courses.discountedPrice ?? 0,
                          hasScholarship: false,
                          duration: courses.courseDuration ?? '',
                          credits: courses.credits ?? 0,
                          students: courses.studentCount ?? 0,
                          modules: courses.moduleCount ?? 0,
                          courseId: courses.id ?? '',
                          categoryName: courses.courseCategory?.name ?? '',
                          isFree: courses.isFreeCourse ?? false,
                      );
                    }).toList() ??
                        [],
                  ),
                ),
              ],
            )
          : Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                'Trending courses',
                style: customTextStyle(context,
                    fontSize: TextSize.font20(context),
                    fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(2, (index) => shimmerCourseCard(context)),
                ),
              ),
            ],
          );
    });
  }

  Widget programCardView() {
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
                MaterialPageRoute(
                    builder: (context) => const ScholarPassView()),
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
                MaterialPageRoute(
                    builder: (context) => const LearningARTView()),
              );
            },
            icon: Icons.style_outlined,
          ),
        )
      ],
    );
  }

  Widget statView() {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: StatCard(
                title: 'Lessons This Week',
                value: '12',
                subtitle: '+3 from last week',
                icon: Icons.menu_book_outlined,
              ),
            ),
            Expanded(
              child: StatCard(
                title: 'Average Duration',
                value: '60 min',
                subtitle: '+5 min from last month',
                icon: Icons.access_time,
              ),
            ),
          ],
        ),
        StatCard(
          title: 'Student Progress',
          value: '+12%',
          subtitle: '+2% from last month',
          icon: Icons.trending_up,
        ),
      ],
    );
  }

  Widget sliderView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: Get.height / 5.75,
          child: CarouselSlider.builder(
            itemCount: dashboardController.splashList.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Color(0xFFD6E4FF)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  dashboardController.splashList[index].color
                                      .withOpacity(0.5),
                                  dashboardController.splashList[index].color,
                                  dashboardController.splashList[index].color
                                      .withOpacity(0.5),
                                ]),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          dashboardController.splashList[index].title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: dashboardController.splashList[index].color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      dashboardController.splashList[index].description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        // Handle navigation or action
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            dashboardController.splashList[index].iconText,
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  dashboardController.splashList[index].color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.arrow_forward,
                              size: 16,
                              color:
                                  dashboardController.splashList[index].color),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: MediaQuery.of(context)
                  .size
                  .height, // Adjust height accordingly
              autoPlay: true, // Enable auto-play
              autoPlayInterval:
                  const Duration(seconds: 3), // Time between transitions
              enlargeCenterPage: true, // Enlarge the current item
              viewportFraction: 1.0, // Display one item at a time
              onPageChanged: (index, reason) {
                dashboardController.changePage(index);
              },
            ),
          ),
        ),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                List.generate(dashboardController.splashList.length, (index) {
              return InkWell(
                onTap: () => dashboardController.changePage(index),
                child: Container(
                  width: dashboardController.selectedPage.value == index
                      ? 15.0
                      : 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    color: dashboardController.selectedPage.value == index
                        ? ColorUtils.baseColor
                        : Colors.grey.shade300,
                  ),
                ),
              );
            }),
          );
        }),
      ],
    );
  }

  Widget shimmerCourseCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      margin: const EdgeInsets.only(right: 5),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          CustomShimmer(height: 120, width: MediaQuery.of(context).size.width * 0.5),
          CustomShimmer(height: 20, width: MediaQuery.of(context).size.width * 0.5,horizontalMargin: 10),
          CustomShimmer(height: 12, width: MediaQuery.of(context).size.width * 0.5,horizontalMargin: 10),
          CustomShimmer(height: 12, width: 100,horizontalMargin: 10),
          CustomShimmer(height: 12, width: 100,horizontalMargin: 10),
          CustomShimmer(height: 12, width: 100,horizontalMargin: 10),
          CustomShimmer(height: 12, width: 100,horizontalMargin: 10),
          CustomShimmer(height: 18, width: MediaQuery.of(context).size.width * 0.5,horizontalMargin: 10),
          CustomShimmer(height: 35, width: MediaQuery.of(context).size.width * 0.5,horizontalMargin: 10,radius: 10),
          SizedBox(height: 5),
        ],
      ),
    );
  }

}

