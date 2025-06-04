import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/my_course/controller/my_course_controller.dart';
import 'package:tutors_plan/feature/my_course/data/my_course_response.dart';
import 'package:tutors_plan/global_widget/custom_simmer.dart';
import 'package:tutors_plan/global_widget/video_player_widget.dart';

class MyCourseDetailsView extends StatefulWidget {
  const MyCourseDetailsView({super.key, required this.myCourse});
  final MyCourse myCourse;

  @override
  State<MyCourseDetailsView> createState() => _MyCourseDetailsViewState();
}

class _MyCourseDetailsViewState extends State<MyCourseDetailsView> {
  final MyCourseController myCourseController = Get.put(MyCourseController());

  @override
  void initState() {
    myCourseController.getMyCourseModules(widget.myCourse.id ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('${widget.myCourse.name}'),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
        child: Obx((){
          return myCourseController.isLoadingMyCourseModuleList.value
              ? Skeletonizer(
                enabled: true,
                child: _body(),
              ) : _body();
        }),
      )
    );
  }

  Widget _body(){
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: myCourseController.courseModules.value.module?.length ?? 0,
      itemBuilder: (context, index) {
        final module = myCourseController.courseModules.value.module![index];
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
                                Column(
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
    );
  }

}
