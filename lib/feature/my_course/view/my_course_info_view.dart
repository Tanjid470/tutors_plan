import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/common_widget/buttons.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/course_details/controller/course_details_controller.dart';

class MyCourseInfoView extends StatefulWidget {
  const MyCourseInfoView({super.key});

  @override
  State<MyCourseInfoView> createState() => _MyCourseInfoViewState();
}

class _MyCourseInfoViewState extends State<MyCourseInfoView> {
  CourseDetailsController courseDetailsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('${courseDetailsController.courseDetails.value.name}'),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: ColorUtils.black,
            size: 20,
          ),
        ),
      ),
      body: _curriculumTab(context),
    );
  }
  Widget _curriculumTab(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
    child: ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: courseDetailsController.courseDetails.value.courseModules?.length ?? 0,
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
                    Text('${courseDetailsController.courseDetails.value.courseModules?[index].title}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: customTextStyle(context,fontSize: TextSize.font16(context),color: Colors.black,fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Text('${courseDetailsController.courseDetails.value.courseModules?[index].description}',
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
                          Text('${courseDetailsController.courseDetails.value.courseModules?[index].duration}',
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
                          Text('${courseDetailsController.courseDetails.value.courseModules?[index].numberOfLessons} Lessons',
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

}
