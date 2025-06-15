import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/global_widget/buttons.dart';
import 'package:tutors_plan/global_widget/custom_simmer.dart';
import 'package:tutors_plan/global_widget/video_player_widget.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/global_widget/base_button.dart';
import 'package:tutors_plan/feature/course_details/controller/course_details_controller.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/route/app_pages.dart';
import 'package:tutors_plan/utils/network/payment_web_view.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key, required this.courseId});
  final String courseId;
  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {

  CourseDetailsController courseDetailsController = Get.put(CourseDetailsController());

  @override
  void initState() {
    courseDetailsController.getCourseDetails(widget.courseId);
    courseDetailsController.getCourseModules(widget.courseId);
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
                    body: body(),
                    bottomNavigationBar: navigatorButton(),
                  ),
                );
        })
      ],
    );
  }

  Widget body(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          thumbImage(),
          bodyDetails(),
          TabBar(
            isScrollable: true,
            padding: EdgeInsets.zero,
            labelColor: ColorUtils.baseColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: ColorUtils.baseColor,
            tabAlignment: TabAlignment.center,
            indicatorSize: TabBarIndicatorSize.tab,
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
                overviewTab(context),
                curriculumTab(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (courseDetailsController.courseDetails.value.seoKeywords != null)
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(courseDetailsController.courseDetails.value.seoKeywords!.length,
                            (index) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300,
                          ),
                          child: Text(
                              courseDetailsController.courseDetails.value.seoKeywords![index],
                              style: customTextStyle(context,
                                  fontSize: TextSize.font14(context),
                                  fontWeight: FontWeight.w500,
                                  color: ColorUtils.black54)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orangeAccent, size: 18),
                  const Icon(Icons.star, color: Colors.orangeAccent, size: 18),
                  const Icon(Icons.star, color: Colors.orangeAccent, size: 18),
                  const Icon(Icons.star, color: Colors.orangeAccent, size: 18),
                  const Icon(Icons.star_half, color: Colors.orangeAccent, size: 18),
                  const SizedBox(width: 8),
                  Text(
                      "4.5 (${courseDetailsController.courseDetails.value.credits ?? 0} Credits)",
                      style: customTextStyle(context,
                          fontSize: TextSize.font12(context),
                          fontWeight: FontWeight.w500,
                          color: ColorUtils.black54)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorUtils.baseColor,
                ),
                child: Text(
                    courseDetailsController.courseDetails.value.courseCategory?.name ?? '',
                    style: customTextStyle(context,
                        fontSize: TextSize.font14(context),
                        fontWeight: FontWeight.w500,
                        color: ColorUtils.white)
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Duration : ${courseDetailsController.courseDetails.value.courseDuration}",
                  style: customTextStyle(
                    context,
                    fontSize: TextSize.font14(context),
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  )
              ),
              Row(
                children: [
                  Text(
                      "\$${courseDetailsController.courseDetails.value.regularPrice}",
                      style: customTextStyle(
                        context,
                        fontSize: TextSize.font14(context),
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      )
                  ),
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
        ],
      ),
    );
  }

  Widget thumbImage(){
    return Stack(
      children: [
        featuredImageWidget('${courseDetailsController.courseDetails.value.thumbnailImage}'),
        Positioned(
          bottom: 12,
          left: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: ColorUtils.baseColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("${courseDetailsController.courseDetails.value.discountedPercentage}% OFF",
              style: customTextStyle(context,
                  fontSize: TextSize.font14(context),
                  fontWeight: FontWeight.bold,
                  color: ColorUtils.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget navigatorButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(() {
        return BaseButton(
          onClick: () async {
            String? accessToken = preferences.getString('accessToken');

            if (accessToken == null) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Center(child: Text("Login Required")),
                  content: const Text(
                    "You are sign-in as guest user. For enrolling in a course you need to sign-in.",
                  ),
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    Buttons(
                      style: ButtonsStyle.dynamicButton,
                      title: 'Cancel',
                      onTap: () => Navigator.pop(context),
                      bgColor: Colors.grey.shade400,
                      textColor: Colors.black87,
                    ),
                    Buttons(
                      style: ButtonsStyle.blueButton,
                      title: 'Sign in',
                      onTap: () async {
                        await preferences.clear();
                        Navigator.pushReplacementNamed(context, RouteNames.loginView);
                      },
                    ),
                  ],
                ),
              );
            }
            else {
              courseDetailsController.isEnrollPaymentLoading.value = true;
              await courseDetailsController.enrollPayment(
                context,
                courseID: courseDetailsController.courseDetails.value.id ?? '',
              );
              courseDetailsController.isEnrollPaymentLoading.value = false;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentWebView(
                    name: courseDetailsController.courseDetails.value.name ?? '',
                    url: courseDetailsController.paymentStripe.value.url ?? '',
                  ),
                ),
              );
            }
          },
          title:courseDetailsController.isEnrollPaymentLoading.value? "":"Payment  \$${courseDetailsController.courseDetails.value.discountedPrice}",
          leading:  courseDetailsController.isEnrollPaymentLoading.value
              ? SizedBox(
                width: ResponsiveScale.of(context).hp(2),
                height: ResponsiveScale.of(context).hp(2),
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
              : null,
          fontSize: TextSize.font14(context),
          padding: const EdgeInsets.symmetric(vertical: 12),
          borderRadius: 12,
        );
      }),
    );
  }

  Widget shimmerCourseDetailsView(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorUtils.white,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios, color: ColorUtils.black),
          title: const CustomShimmer(height: 25, width: double.infinity),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomShimmer(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12)
              )
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              CustomShimmer(height: 180, width: double.infinity),
              CustomShimmer(height: 25, width: double.infinity,horizontalMargin: 10,),
              CustomShimmer(height: 20, width: double.infinity,horizontalMargin: 10,),
              CustomShimmer(height: 20, width: double.infinity,horizontalMargin: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    CustomShimmer(
                      child: Row(
                      children: List.generate(
                        5,(_) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Icon(Icons.star, color: Colors.white, size: 18),
                          )
                        ),
                      )
                    ),
                    CustomShimmer(height: 20, width: 100),
                  ],
                ),
              ),
              CustomShimmer(height: 20, width: 100,horizontalMargin: 10),
              SizedBox(height: 10),
              CustomShimmer(height: 25, width: double.infinity,horizontalMargin: 10,),
              Expanded(
                child: CustomShimmer(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (_, __) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                    ),
                  ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget overviewTab(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            overviewItem(context, Icons.description, "Course Description",
                '${courseDetailsController.courseDetails.value.description}'),
            overviewItem(context, Icons.check_circle_outline, "Course Outcomes",
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

  Widget overviewItem(BuildContext context, IconData icon, String title, String content) {
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

  Widget curriculumTab(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
    child: ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: courseDetailsController.courseModules.value.module?.length ?? 0,
      itemBuilder: (context, index) {
        final module = courseDetailsController.courseModules.value.module![index];
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 10),
              title: Row(
                children: [
                  Container(
                    height: ResponsiveScale.of(context).hp(2),
                    width: ResponsiveScale.of(context).hp(2),
                    decoration: BoxDecoration(
                      color: ColorUtils.baseColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: customTextStyle(context,
                            fontSize: TextSize.font14(context),
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      module.name ?? '',
                      style: customTextStyle(context,
                          fontSize: TextSize.font16(context),
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    module.description ?? '',
                    style: customTextStyle(context,
                        fontSize: TextSize.font14(context),
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.timelapse, color: ColorUtils.baseColor, size: TextSize.font14(context)),
                      const SizedBox(width: 3),
                      Text(
                        module.duration ?? '',
                        style: customTextStyle(context,
                            fontSize: TextSize.font14(context),
                            color: Colors.black54,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 15),
                      Icon(Icons.play_lesson_outlined, color: ColorUtils.baseColor, size: TextSize.font14(context)),
                      const SizedBox(width: 3),
                      Text(
                        '${module.courseLessons?.length ?? 0} Lessons',
                        style: customTextStyle(context,
                            fontSize: TextSize.font14(context),
                            color: Colors.black54,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Icon(Icons.arrow_drop_down_circle_outlined, color: ColorUtils.baseColor, size: TextSize.font22(context)),
              children: [
                if (module.courseLessons != null)
                  ...module.courseLessons!.map((lesson) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              spacing: 10,
                              children: [
                                lesson.lessonImage?.isNotEmpty == true
                                    ? CachedNetworkImage (
                                      imageUrl: lesson.lessonImage!,
                                      height: 30,
                                      width: 30,
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) =>
                                          const Center(
                                              child: CustomShimmer(height: 30, width: 30)),
                                      errorWidget: (context, url, error) => Image.asset(
                                        'assets/images/dummy_image.jpg',
                                        height: 30,
                                        width: 30,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                    : Image.asset (
                                      'assets/images/dummy_image.jpg',
                                      height: 30,
                                      width: 30,
                                      fit: BoxFit.fill,
                                    ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(lesson.name ?? 'Lesson Title',
                                        style: customTextStyle(context,
                                            fontSize: TextSize.font14(context),
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(lesson.description ?? 'Lesson Title',
                                        style: customTextStyle(context,
                                            fontSize: TextSize.font12(context),
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (_) => Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    spacing: 15,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(Icons.cancel_outlined, size: TextSize.font24(context), color: ColorUtils.black)),
                                        ],
                                      ),
                                      AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: CustomVideoPlayer(videoUrl: lesson.lessonVideo ?? ''),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Icon(Icons.play_circle, size: 20, color: ColorUtils.baseColor),
                          )
                        ],
                      ),
                    ),
                  ))
              ],
            ),
          ),
        );
      },
    ),
  );

  Widget overViewCard(BuildContext context, IconData icon, String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorUtils.shimmerColor,
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

  Widget featuredImageWidget(String image,{double? ratio}) {
    return AspectRatio(
      aspectRatio: ratio ?? 1.6713,
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
