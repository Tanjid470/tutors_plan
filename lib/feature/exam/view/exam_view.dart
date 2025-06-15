import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/exam/controller/exam_controller.dart';
import 'package:tutors_plan/global_widget/no_item_found.dart';

class ExamView extends StatefulWidget {

  const ExamView({super.key});

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  ExamController examController = Get.put(ExamController());
  @override
  void initState() {
    examController.getExam();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exams'),
        centerTitle: true,
        leading: const SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Obx(() {
              return examController.isLoadingExamList.value == false
                  ? Skeletonizer(
                    enabled: true,
                    child: examListView(),
                  )
                  : examListView();
            }),
          ],
        ),
      ),
    );
  }

  Widget examListView(){
    return examController.examData?.exams?.isNotEmpty == true
        ? SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: examController.examData?.exams?.asMap().entries.map((entry) {
              final exams = entry.value;
              return Container(
                width: MediaQuery.of(context).size.width - 20,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                    left: BorderSide(
                      color: ColorUtils.baseColor,
                      width: 5.0,
                    )
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exams.title ?? '',style: customTextStyle(context,fontSize: TextSize.font16(context),fontWeight: FontWeight.bold,color: ColorUtils.black)),
                    Text(exams.description ?? '',style: customTextStyle(context,fontSize: TextSize.font16(context),fontWeight: FontWeight.w500,color: ColorUtils.black)),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.stars_sharp,color: ColorUtils.baseColor,size: 15),
                        Text('${exams.coursePoints} Points',style: customTextStyle(context,fontSize: TextSize.font16(context),fontWeight: FontWeight.w500,color: ColorUtils.black)),
                      ],
                    ),

                  ],
                ),
              );
            }).toList() ?? [],
          ),
        )
        : Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: NoItemFound(context: context, title: 'No exam available', subTitle: 'No exams are available at the moment. Enroll in a course to access exams.'),
        );
  }

}
