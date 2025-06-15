import 'package:get/get.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/course_details/data/course_details_response.dart';
import 'package:tutors_plan/feature/course_details/data/repository/course_details_repository.dart';
import 'package:tutors_plan/feature/course_details/data/course_module_response.dart';
import 'package:tutors_plan/feature/exam/data/exam_response.dart';
import 'package:tutors_plan/feature/exam/data/repository/exam_repository.dart';
import 'package:tutors_plan/feature/my_course/data/my_course_response.dart';
import 'package:tutors_plan/feature/my_course/data/repository/my_course_repository.dart';


class ExamController extends GetxController {
  final Rx<ScreenStates> screenStates = Rx<ScreenStates>(ScreenStates.DEFAULT);
  final Rx<ScreenStates> loaderState = Rx<ScreenStates>(ScreenStates.DEFAULT);

  ExamRepository examRepository = ExamRepository();

  ExamData? examData;

  RxBool isLoadingExamList = false.obs;

  Future<void> getExam({int? coursePage}) async {
    isLoadingExamList.value = false;
    final result = await examRepository.getExams(
      page: coursePage,
      limit: 10,
    );
    if (result != null) {
      isLoadingExamList.value = true;
      examData = result;
    }
    isLoadingExamList.value = true;
  }

  void updateViewState(
      {ScreenStates? screenStates, ScreenStates? loadingState}) {
    if (screenStates != null) {
      this.screenStates.value = screenStates;
      loaderState.value = ScreenStates.LOADING_COMPLETE;
    }
    if (loadingState != null) loaderState.value = loadingState;
    update();
  }
}
