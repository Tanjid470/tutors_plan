import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tutors_plan/common_widget/buttons.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/course_details/controller/course_details_controller.dart';
import 'package:tutors_plan/feature/my_course/view/my_course_info_view.dart';

class MyCourseView extends StatefulWidget {
  const MyCourseView({super.key});

  @override
  State<MyCourseView> createState() => _MyCourseViewState();
}

class _MyCourseViewState extends State<MyCourseView> {
  CourseDetailsController courseDetailsController = Get.put(CourseDetailsController());

  @override
  void initState() {
    courseDetailsController.getCourseDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
        centerTitle: true,
        leading: SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Obx(() {
              return courseDetailsController.loaderState.value == ScreenStates.TRANSPARENT_LOADING_START
                  ? shimmerCourseDetailsView(context)
                  : Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Course Title
                    Text(
                      courseDetailsController.courseDetails.value.name ?? 'Course Title',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Description
                    Text(
                      courseDetailsController.courseDetails.value.description ?? 'Course description goes here.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Column(
                      spacing: 5,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.timelapse,color: ColorUtils.baseColor,size: 16),
                                const SizedBox(width: 6),
                                Text(
                                  courseDetailsController.courseDetails.value.courseDuration.toString(),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: ColorUtils.baseColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${courseDetailsController.courseDetails.value.courseModules?.length.toString()} modules',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style:  TextStyle(
                                fontSize: 15,
                                color: ColorUtils.baseColor,
                              ),
                            ),
                            Text(
                              '${courseDetailsController.courseDetails.value.courseLessons?.length.toString()} lessons',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorUtils.baseColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${courseDetailsController.courseDetails.value.numberOfVideoLessons ?? '0'} videos',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style:  TextStyle(
                                fontSize: 15,
                                color: ColorUtils.baseColor,
                              ),
                            ),
                            Text(
                              '${courseDetailsController.courseDetails.value.numberOfBookLessons ?? '0'} books',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style:  TextStyle(
                                fontSize: 15,
                                color: ColorUtils.baseColor,
                              ),
                            ),
                            Text(
                              '${courseDetailsController.courseDetails.value.numberOfQuizzes ?? '0'} quizzes',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorUtils.baseColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),
                    // Divider
                    Divider(color: Colors.grey[300], thickness: 1),
                    // Action Button Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Buttons(
                          style: ButtonsStyle.blueButton,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyCourseInfoView()),
                            );
                          },
                          title: 'Continue',
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget shimmerCourseDetailsView(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
                height: 100,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
