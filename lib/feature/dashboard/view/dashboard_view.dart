import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/common_widget/loading_view_transparent.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/dashboard/controller/dashboard_controller.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/stat_card.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/course_card.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/k12_bundle_card.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/learning_art_view.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/program_card.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/scholar_pass_view.dart';
import 'package:tutors_plan/feature/learning/view/widget/more_info_tutorsplan_view.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                        sliderView(),
                        ScholarPassBundle(),
                        //statView(),
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
        ),
        Obx(() {
          return dashboardController.loaderState.value == ScreenStates.TRANSPARENT_LOADING_START
              ? LoadingViewTransparent(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: ColorUtils.baseColor,
          ): SizedBox(); // or any other widget when the state doesn't match
        })
      ],
    );
  }

  Widget appBar(){
    bool isGuest = preferences.getBool('guest') ?? false;
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
            verticalGap(context, 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10,
              children: [
                isGuest ?
                  SizedBox()
                  : Expanded(
                    child: Row(
                      spacing: 10,
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge, // Border thickness
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorUtils.baseColor, width: 2), // Change color & width
                          ),
                          child: CircleAvatar(
                            radius: ResponsiveScale.of(context).hp(3),
                            backgroundColor: Colors.white,
                            child: Image.asset('assets/images/profile.png',fit: BoxFit.fill),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tom David',
                                  maxLines: 1,overflow: TextOverflow.ellipsis,
                                  style: customTextStyle(context,fontSize: TextSize.font16(context),fontWeight: FontWeight.bold,color: ColorUtils.white)),
                              Text('tom123@gmail.com',
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
                                    onTap: () {
                                      Navigator.pop(context);
                                      Get.to(() => MoreInfoTutorsPlanView());
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("More from TutorsPlan",style: TextStyle(color: ColorUtils.baseColor,fontSize: TextSize.font14(context)),),
                                        SizedBox(width: 5),
                                        Icon(Icons.keyboard_arrow_down,size: TextSize.font20(context),color: ColorUtils.baseColor),
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
                        backgroundColor: Colors.white,
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

            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RouteNames.categoryView);
              },
              child: Text('See all',
                  style: customTextStyle(
                    context,
                    fontSize: TextSize.font14(context),
                  )
              ),
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
                  itemCount: 5,
                  itemBuilder: (context, index) {

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

                          border: Border(
                            left: BorderSide(color: ColorUtils.baseColor, width: 4),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                             Image.asset(
                                'assets/images/dummy_image.jpg',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            SizedBox(width: ResponsiveScale.of(context).wp(2)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("categoryItem?.name",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: TextSize.font16(context))
                                  ),
                                  Text(
                                    "0 courses",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "totalCourse courses",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "enrolledStudents students",
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
    return Obx((){
      return dashboardController.isLoadingCourseList.value
          ? Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Trending courses',
                style: customTextStyle(
                    context,
                    fontSize: TextSize.font20(context),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.435,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {

                    return CourseCard(
                      title: 'title of the course',
                      itemNo: index,
                      description: 'shortDescription of the course',
                      imageUrl: '',
                      author:  '',
                      originalPrice:  0,
                      discountedPrice:  0,
                      hasScholarship: false,
                      features: [],
                      duration:  "0",
                      sessions:  0,
                      videos:  0,
                      books:  0,
                      modules: 0,
                    );
                  },
                ),
              ),
            ],
          )
          : Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Trending courses',
                style: customTextStyle(
                    context,
                    fontSize: TextSize.font20(context),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.435,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {

                    return CourseCard(
                      title: 'title of the course',
                      itemNo: index,
                      description: 'shortDescription of the course',
                      imageUrl: '',
                      author:  '',
                      originalPrice:  0,
                      discountedPrice:  0,
                      hasScholarship: false,
                      features: [],
                      duration:  "0",
                      sessions: 0,
                      videos:  0,
                      books:  0,
                      modules:  0,
                    );
                  },
                ),
              ),
            ],
          );
    });
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

  Widget statView(){
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

  Widget sliderView(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: Get.height / 6,
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
                                dashboardController.splashList[index].color.withOpacity(0.5),
                                dashboardController.splashList[index].color,
                                dashboardController.splashList[index].color.withOpacity(0.5),
                              ]
                            ),
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
                              color: dashboardController.splashList[index].color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.arrow_forward, size: 16, color: dashboardController.splashList[index].color),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height, // Adjust height accordingly
              autoPlay: true,  // Enable auto-play
              autoPlayInterval: const Duration(seconds: 3),  // Time between transitions
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
            children: List.generate(dashboardController.splashList.length, (index) {
              return InkWell(
                onTap: () => dashboardController.changePage(index),
                child: Container(
                  width: dashboardController.selectedPage.value == index ? 15.0 : 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4.0),
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
}
