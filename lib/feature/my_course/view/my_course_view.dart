import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/my_course/controller/my_course_controller.dart';
import 'package:tutors_plan/feature/my_course/view/my_course_details_view.dart';
import 'package:tutors_plan/global_widget/buttons.dart';
import 'package:tutors_plan/global_widget/custom_simmer.dart';
import 'package:tutors_plan/global_widget/no_item_found.dart';

class MyCourseView extends StatefulWidget {
  const MyCourseView({super.key});

  @override
  State<MyCourseView> createState() => _MyCourseViewState();
}

class _MyCourseViewState extends State<MyCourseView> {
  MyCourseController myCourseController = Get.put(MyCourseController());

  @override
  void initState() {
    myCourseController.getMyCourse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
        centerTitle: true,
        leading: const SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Obx(() {
              return myCourseController.isLoadingMyCourseList.value == false
                  ? Skeletonizer(
                    enabled: true,
                    child: myCourseListView(),
                  )
                  : myCourseListView();
            }),
          ],
        ),
      ),
    );
  }

  Widget myCourseListView(){
    return myCourseController.myCourseList?.isNotEmpty == true
        ? SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: myCourseController.myCourseList?.asMap().entries.map((entry) {
              final myCourse = entry.value;
              return Container(
                width: MediaQuery.of(context).size.width - 20,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
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
                    Row(
                      spacing: ResponsiveScale.of(context).wp(2),
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: myCourse.thumbnailImage?.isNotEmpty == true
                              ? CachedNetworkImage (
                            imageUrl: myCourse.thumbnailImage!,
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.3,
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                Center(
                                    child: CustomShimmer(
                                      height: 80,
                                      width: MediaQuery.of(context).size.width * 0.3,
                                    )
                                ),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/dummy_image.jpg',
                              height: 80,
                              width: MediaQuery.of(context).size.width * 0.3,
                              fit: BoxFit.fill,
                            ),
                          )
                              : Image.asset (
                            'assets/images/dummy_image.jpg',
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.3,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Flexible(
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(myCourse.name ?? 'Course Title',
                                style: TextStyle(
                                  fontSize: TextSize.font18(context),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(myCourse.shortDescription ?? 'Course description goes here.',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: TextSize.font14(context),
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ResponsiveScale.of(context).wp(2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorUtils.grey300,
                          ),
                          child: Text(myCourse.categoryName.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: TextSize.font16(context),
                              color: ColorUtils.black,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.timelapse,color: ColorUtils.baseColor,size: 16),
                            const SizedBox(width: 6),
                            Text(
                              myCourse.courseDuration ?? 'O days',
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
                          children: [
                            Icon(Icons.credit_score,color: ColorUtils.baseColor,size: 16),
                            const SizedBox(width: 6),
                            Text('${myCourse.credits.toString()} credits',
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
                    Divider(color: Colors.grey[300], thickness: 1),
                    Buttons(
                      style: ButtonsStyle.dynamicButton,
                      isExpended : true,
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  MyCourseDetailsView(myCourse: myCourse)),
                        );
                      },
                      title: 'Continue',
                    ),
                  ],
                ),
              );
            }).toList() ?? [],
          ),
        )
        : Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: NoItemFound(context: context, title: 'No course enroll yet', subTitle: 'You haven\'t enrolled in any courses. Start exploring and enroll today!',),
        );
  }

}
