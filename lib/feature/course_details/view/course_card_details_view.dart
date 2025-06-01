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
  const CourseDetailsScreen({super.key, required this.courseId});
  final String courseId;
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
    courseDetailsController.getCourseDetails(widget.courseId);
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
                  length: 2,
                  child: Scaffold(
                    backgroundColor: ColorUtils.white,
                    appBar: AppBar(
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: ColorUtils.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                      title: Text('${courseDetailsController.courseDetails.value.name}'),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              if (courseDetailsController.courseDetails.value.thumbnailImage != null)
                                featuredImageWidget('${courseDetailsController.courseDetails.value.thumbnailImage}'),
                              Positioned(
                                bottom: 12,
                                left: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                  color: Colors.black,
                                  child: Text("${courseDetailsController.courseDetails.value.discountedPercentage}% OFF",
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
                                Text(courseDetailsController.courseDetails.value.name ?? " ",
                                    style: customTextStyle(context,
                                        fontSize: TextSize.font20(context),
                                        fontWeight: FontWeight.bold,
                                        color: ColorUtils.black)),
                                Text(courseDetailsController.courseDetails.value.shortDescription ?? " ",
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
                                        "4.5 (${courseDetailsController.courseDetails.value.credits ?? 0} Credits)",
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
                                        "\$${courseDetailsController.courseDetails.value.regularPrice}",
                                        style: customTextStyle(
                                          context,
                                          fontSize: TextSize.font14(context),
                                          fontWeight: FontWeight.w400,
                                          color: Colors.red,
                                        )),
                                    const SizedBox(width: 8),
                                    Text(
                                        "\$${courseDetailsController.courseDetails.value.discountedPrice}",
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
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                _overviewTab(context),
                                _overviewTab(context),
                                //_curriculumTab(context),
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
                                courseID: courseDetailsController.courseDetails.value.id ?? '', studentId: 0);
                          }
                        },
                        title: "Buy Now for \$${courseDetailsController.courseDetails.value.discountedPrice}",
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
          leading: Icon(Icons.arrow_back_ios, color: ColorUtils.black),
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
                '${courseDetailsController.courseDetails.value.description}'),
            _buildOverviewItem(context, Icons.check_circle_outline, "Course Outcomes",
                '${courseDetailsController.courseDetails.value.courseOutcome}'),
            Column(
              children: [
                Row(
                  children: [
                    overViewCard(context, Icons.calendar_today, "Duration", '${courseDetailsController.courseDetails.value.courseDuration}'),
                    overViewCard(context, Icons.view_module, "Modules", "${0}"),
                    overViewCard(context, Icons.menu_book, "Book Lessons", "${0}"),
                  ],
                ),
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
  //
  // Widget _curriculumTab(BuildContext context) => Padding(
  //   padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
  //   child: ListView.builder(
  //     padding: EdgeInsets.zero,
  //     scrollDirection: Axis.vertical,
  //     shrinkWrap: true,
  //     itemCount: courseDetailsController.courseDetails.value.courseModules?.length ?? 0,
  //     itemBuilder: (BuildContext context, int index) {
  //       return Container(
  //         margin: const EdgeInsets.only(bottom: 8),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(12),
  //           border: Border.all(color: Colors.grey.shade300), // subtle border
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Row(
  //                 spacing: 5,
  //                 children: [
  //                   Container(
  //                     height: ResponsiveScale.of(context).hp(2),
  //                     width: ResponsiveScale.of(context).hp(2),
  //                     decoration: BoxDecoration(
  //                       color: ColorUtils.baseColor,
  //                       shape: BoxShape.circle
  //                     ),
  //                     child: Center(
  //                       child: Text('$index',
  //                         style: customTextStyle(context,fontSize: TextSize.font14(context),color: Colors.white,fontWeight: FontWeight.w500),
  //                       ),
  //                     ),
  //                   ),
  //                   Text('${courseDetailsController.courseDetails.value.courseModules?[index].title}',
  //                     maxLines: 1,
  //                     overflow: TextOverflow.ellipsis,
  //                     style: customTextStyle(context,fontSize: TextSize.font16(context),color: Colors.black,fontWeight: FontWeight.w500),
  //                   ),
  //                 ],
  //               ),
  //               Text('${courseDetailsController.courseDetails.value.courseModules?[index].description}',
  //                 maxLines: 2,
  //                 overflow: TextOverflow.ellipsis,
  //                 style: customTextStyle(context,fontSize: TextSize.font14(context),color: Colors.black54,fontWeight: FontWeight.w500),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Row(
  //                   spacing: 15,
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [
  //                     Row(
  //                       spacing: 3,
  //                       children: [
  //                         Icon(Icons.timelapse,color: ColorUtils.baseColor,size: TextSize.font14(context)),
  //                         Text('${courseDetailsController.courseDetails.value.courseModules?[index].duration}',
  //                           maxLines: 2,
  //                           overflow: TextOverflow.ellipsis,
  //                           style: customTextStyle(context,fontSize: TextSize.font14(context),color: Colors.black54,fontWeight: FontWeight.w500),
  //                         ),
  //                       ],
  //                     ),
  //                     Row(
  //                       spacing: 3,
  //                       children: [
  //                         Icon(Icons.play_lesson_outlined,color: ColorUtils.baseColor,size: TextSize.font14(context)),
  //                         Text('${courseDetailsController.courseDetails.value.courseModules?[index].numberOfLessons} Lessons',
  //                           maxLines: 2,
  //                           overflow: TextOverflow.ellipsis,
  //                           style: customTextStyle(context,fontSize: TextSize.font14(context),color: Colors.black54,fontWeight: FontWeight.w500),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //
  //   ),
  // );

  Widget institutionSubsection(BuildContext context,String key,String value) {
    return Row(
      spacing: 5,
      children: [
        Text(key, style: customTextStyle(context, fontSize: TextSize.font14(context),color: Colors.black87,fontWeight: FontWeight.w500)),
        Text(value, style: customTextStyle(context, fontSize: TextSize.font14(context),color: Colors.black,fontWeight: FontWeight.w500)),
      ],
    );
  }



  Future<void> _handlePayment(BuildContext context,
      {required String courseID, required int studentId}) async {
    try {
      await StripeService.makePayment(
        amount: double.tryParse('${courseDetailsController.courseDetails.value.discountedPrice}') ?? 0.0,
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
