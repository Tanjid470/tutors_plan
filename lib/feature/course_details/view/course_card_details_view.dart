import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tutors_plan/common_widget/buttons.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/common_widget/base_button.dart';
import 'package:tutors_plan/feature/course_details/controller/course_details_controller.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/route/app_pages.dart';
import 'package:tutors_plan/services/stripe_service.dart';
import 'package:intl/intl.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {

  final String instructor = "Tanjid Hossain Amran";
  final String location = "Dhaka, Bangladesh";

  CourseDetailsController courseDetailsController = Get.put(CourseDetailsController());

  String formatToMonthYear(String? dateString) {
    if (dateString == null) return 'N/A';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('MMMM yyyy').format(date); // e.g., May 2025
    } catch (e) {
      return 'Invalid date';
    }
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(() {
          return courseDetailsController.loaderState.value == ScreenStates.TRANSPARENT_LOADING_START
              ? shimmerCourseDetailsView(context)
              : DefaultTabController(
                  length: 4,
                  child: Scaffold(
                    backgroundColor: ColorUtils.white,
                    appBar: AppBar(
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: ColorUtils.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                      title: Text('courseDetailsController.courseDetails.value.name'),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              featuredImageWidget('{courseDetailsController.courseDetails.value.image}'),
                              Positioned(
                                bottom: 12,
                                left: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                  color: Colors.black,
                                  child: Text("10% OFF",
                                    style: customTextStyle(context,
                                        fontSize: TextSize.font14(context),
                                        fontWeight: FontWeight.bold,
                                        color: ColorUtils.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("courseDetails name",
                                    style: customTextStyle(context,
                                        fontSize: TextSize.font20(context),
                                        fontWeight: FontWeight.bold,
                                        color: ColorUtils.black)),
                                Text("shortDescription",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: customTextStyle(context,
                                        fontSize: TextSize.font15(context),
                                        fontWeight: FontWeight.w400,
                                        color: ColorUtils.black)),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.orangeAccent, size: 18),
                                    Icon(Icons.star, color: Colors.orangeAccent, size: 18),
                                    Icon(Icons.star, color: Colors.orangeAccent, size: 18),
                                    Icon(Icons.star, color: Colors.orangeAccent, size: 18),
                                    Icon(Icons.star_half, color: Colors.orangeAccent, size: 18),
                                    const SizedBox(width: 8),
                                    Text(
                                        "4.5  || 0 Credits)",
                                        style: customTextStyle(context,
                                            fontSize: TextSize.font12(context),
                                            fontWeight: FontWeight.w500,
                                            color: ColorUtils.black54)),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                        "\$regularPrice",
                                        style: customTextStyle(
                                          context,
                                          fontSize: TextSize.font14(context),
                                          fontWeight: FontWeight.w400,
                                          color: Colors.red,
                                        )),
                                    const SizedBox(width: 8),
                                    Text(
                                        "\$discountedPrice",
                                        style: customTextStyle(context,
                                            fontSize: TextSize.font18(context),
                                            fontWeight: FontWeight.bold,
                                            color: ColorUtils.baseColor)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          TabBar(
                            isScrollable: true,
                            labelColor: ColorUtils.baseColor,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: ColorUtils.baseColor,
                            tabAlignment: TabAlignment.center,
                            labelStyle: customTextStyle(context,
                                fontSize: TextSize.font16(context),
                                fontWeight: FontWeight.bold,
                                color: ColorUtils.black),
                            tabs: const [
                              Tab(text: "Overview"),
                              Tab(text: "Curriculum"),
                              Tab(text: "Tutor"),
                              Tab(text: "Institution"),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                _overviewTab(context),
                                _curriculumTab(context),
                                _tutorTab(context),
                                _institutionTab(context),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    bottomNavigationBar: Padding(
                      padding: const EdgeInsets.all(16),
                      child: BaseButton(
                        onClick: () {
                          String? accessToken =
                              preferences.getString('accessToken');

                          if (accessToken == null) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Center(child: Text("Login Required")),
                                content: Text(
                                    "You are sign-in as guest user.For enroll course you need to sign-in."),
                                actionsAlignment: MainAxisAlignment.center,
                                actions: [
                                  Buttons(
                                    style: ButtonsStyle.dynamicButton,
                                    title: 'Cancel',
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    bgColor: Colors.grey.shade400,
                                    textColor: Colors.black87,
                                  ),
                                  Buttons(
                                    style: ButtonsStyle.blueButton,
                                    title: 'Sign in',
                                    onTap: () async {
                                      await preferences.clear();
                                      Navigator.pushReplacementNamed(
                                          context, RouteNames.loginView);
                                    },
                                  ),
                                ],
                              ),
                            );
                          } else {
                            _handlePayment(context,
                                courseID:  240, studentId: 1 );
                          }
                        },
                        title: "Buy Now for \$discountedPrice",
                        fontSize: TextSize.font14(context),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        borderRadius: 12,
                      ),
                    ),
                  ),
                ); // or any other widget when the state doesn't match
        })
      ],
    );
  }

  Widget shimmerCourseDetailsView(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: ColorUtils.white,
        appBar: AppBar(
          title: Container(height: 20, width: 150, color: Colors.grey[300]),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
              height: 48,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12))),
        ),
        body: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Container(
                    height: 180, width: double.infinity, color: Colors.white),
                const SizedBox(height: 16),
                Container(height: 20, width: 250, color: Colors.white),
                const SizedBox(height: 8),
                Row(
                  children: List.generate(
                      5,
                      (_) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child:
                                Icon(Icons.star, color: Colors.white, size: 18),
                          )),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(height: 16, width: 60, color: Colors.white),
                    const SizedBox(width: 8),
                    Container(height: 20, width: 80, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                    height: 40,
                    width: double.infinity,
                    color: Colors.white), // Tab bar placeholder
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (_, __) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(height: 80, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _overviewTab(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOverviewItem(context, Icons.description, "Course Description",
                'Course Description'),
            _buildOverviewItem(context, Icons.check_circle_outline, "Course Outcomes",
                'Course Description'),
            Column(
              children: [
                Row(
                  children: [
                    overViewCard(context, Icons.calendar_today, "Duration", '0'),
                    overViewCard(context, Icons.view_module, "Modules", "0"),
                    overViewCard(context, Icons.menu_book, "Book Lessons", "0"),
                  ],
                ),
                Row(
                  children: [
                    overViewCard(context, Icons.play_circle_fill, "Video Lessons", "0"),
                    overViewCard(context, Icons.school, "Live Sessions", "0"),
                    overViewCard(context, Icons.quiz, "Quizzes", "0"),
                  ],
                )
              ],
            ),

          ],
        ),
      );

  Widget _buildOverviewItem(
      BuildContext context, IconData icon, String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: ColorUtils.baseColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: customTextStyle(context,
                        fontSize: TextSize.font16(context),
                        fontWeight: FontWeight.bold,
                        color: ColorUtils.black)),
                const SizedBox(height: 4),
                Text(content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: customTextStyle(context,fontSize: TextSize.font14(context),color: Colors.black54,fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _curriculumTab(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
    child: ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300), // subtle border
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Container(
                      height: ResponsiveScale.of(context).hp(2),
                      width: ResponsiveScale.of(context).hp(2),
                      decoration: BoxDecoration(
                        color: ColorUtils.baseColor,
                        shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Text('$index',
                          style: customTextStyle(context,fontSize: TextSize.font14(context),color: Colors.white,fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Text('title',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: customTextStyle(context,fontSize: TextSize.font16(context),color: Colors.black,fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Text('description',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: customTextStyle(context,fontSize: TextSize.font14(context),color: Colors.black54,fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: 15,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 3,
                        children: [
                          Icon(Icons.timelapse,color: ColorUtils.baseColor,size: TextSize.font14(context)),
                          Text('duration',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: customTextStyle(context,fontSize: TextSize.font14(context),color: Colors.black54,fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 3,
                        children: [
                          Icon(Icons.play_lesson_outlined,color: ColorUtils.baseColor,size: TextSize.font14(context)),
                          Text('0 Lessons',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: customTextStyle(context,fontSize: TextSize.font14(context),color: Colors.black54,fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },

    ),
  );

  Widget _lesson(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
    child: ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300), // subtle border
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('title',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: customTextStyle(context,fontSize: TextSize.font16(context),color: Colors.black,fontWeight: FontWeight.w500),
                ),
                Text('description',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: customTextStyle(context,fontSize: TextSize.font14(context),color: Colors.black54,fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 3,
                        children: [
                          Icon(Icons.timelapse,color: ColorUtils.baseColor,size: TextSize.font14(context)),
                          Text('0 duration',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: customTextStyle(context,fontSize: TextSize.font14(context),color: Colors.black54,fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },

    ),
  );

  Widget _tutorTab(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, "Course Instructor"),
            _buildInstructorRow(context),
            const SizedBox(height: 8),
          ],
        ),
      );

  Widget _institutionTab(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, "Institution Info"),
            Row(
              spacing: 10,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: Colors.grey[200],
                    border: Border.all(
                      color: ColorUtils.baseColor,
                    ),
                    image: DecorationImage(
                      image: const AssetImage('assets/images/dummy_image.jpg'),
                      fit: BoxFit.cover,

                    ),
                  ),
                ),
                Text("name}", style: customTextStyle(context, fontSize: TextSize.font16(context), fontWeight: FontWeight.bold)),
              ],
            ),
            institutionSubsection(context,'Email: ', 'test@gmail.com'),
            institutionSubsection(context,'Contact: ', '0239439838'),
            institutionSubsection(context,'Industry: ', 'BlackBook'),
            institutionSubsection(
              context,
              'Since: ', "24 MAy",
            ),

            Row(
              spacing: 10,
              children: [
                institutionSubsection(context,'City: ', 'Dhaka'),
                institutionSubsection(context,'ZIP code: ', '1234'),
              ],
            )
          ],
        ),
      );

  Widget institutionSubsection(BuildContext context,String key,String value) {
    return Row(
      spacing: 5,
      children: [
        Text(key, style: customTextStyle(context, fontSize: TextSize.font14(context),color: Colors.black87,fontWeight: FontWeight.w500)),
        Text(value, style: customTextStyle(context, fontSize: TextSize.font14(context),color: Colors.black,fontWeight: FontWeight.w500)),
      ],
    );
  }


  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title,
          style: customTextStyle(context,
              fontSize: TextSize.font16(context),
              fontWeight: FontWeight.bold,
              color: ColorUtils.black)),
    );
  }

  Widget _buildInstructorRow(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.person, size: 20),
            const SizedBox(width: 6),
            Text('Tutor name',
                style: customTextStyle(context,
                    fontSize: TextSize.font14(context),
                    fontWeight: FontWeight.w500,
                    color: ColorUtils.black54)),
          ],
        ),
        Text("email",
            style: customTextStyle(context,
                fontSize: TextSize.font12(context),
                fontWeight: FontWeight.w500,
                color: ColorUtils.black54)),
        Row(
          children: [
            const Icon(Icons.location_on, size: 18, color: Colors.redAccent),
            const SizedBox(width: 4),
            Text('Location',
                style: customTextStyle(context,
                    fontSize: TextSize.font12(context),
                    fontWeight: FontWeight.w500,
                    color: ColorUtils.black54)),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.local_activity_outlined, size: 18, color: Colors.black),
            const SizedBox(width: 4),
            Text('City, Country Code',
                style: customTextStyle(context,
                    fontSize: TextSize.font12(context),
                    fontWeight: FontWeight.w500,
                    color: ColorUtils.black54)),
          ],
        ),
      ],
    );
  }

  Future<void> _handlePayment(BuildContext context,
      {required int courseID, required int studentId}) async {
    try {
      await StripeService.makePayment(
        amount: double.tryParse('100') ?? 0.0,
        currency: 'usd',
        courseID: courseID,
        studentID: studentId,
        onSuccess: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Colors.green,
            ),
          );
          // TODO: Update backend about successful payment
        },
        onError: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error),
              backgroundColor: Colors.red,
            ),
          );
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment failed: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget overViewCard(
      BuildContext context, IconData icon, String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorUtils.baseColor.withOpacity(0.1),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: TextSize.font14(context), color: ColorUtils.baseColor),
                  Text(value,
                      style: customTextStyle(context,
                          fontSize: TextSize.font14(context),
                          fontWeight: FontWeight.w500,
                          color: ColorUtils.baseColor)),
                ],
              ),
              Text(label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: customTextStyle(context,
                      fontSize: TextSize.font12(context),
                      fontWeight: FontWeight.w500,
                      color: ColorUtils.black87)
              ),
      
            ],
          ),
        ),
      ),
    );
  }

  Widget featuredImageWidget(String image) {
    return AspectRatio(
      aspectRatio: 1.6713,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: Colors.grey[200],
          border: Border.all(
            color: ColorUtils.baseColor,
          ),
          image: DecorationImage(
            image: image.contains('http') == true
                ? CachedNetworkImageProvider(image) as ImageProvider
                : const AssetImage('assets/images/dummy_image.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
