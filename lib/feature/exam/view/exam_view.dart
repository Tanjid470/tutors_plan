import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/exam/controller/exam_controller.dart';
import 'package:tutors_plan/feature/exam/data/exam_response.dart';
import 'package:tutors_plan/global_widget/no_item_found.dart';

import 'widget/exam_card.dart';

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
              return ExamCard(context: context, exams: exams);
            }).toList() ?? [],
          ),
        )
        : Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: NoItemFound(context: context, title: 'No exam available', subTitle: 'No exams are available at the moment. Enroll in a course to access exams.'),
        );
  }

}


