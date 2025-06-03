import 'package:get/get.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/course_details/data/course_details_response_body.dart';
import 'package:tutors_plan/feature/course_details/data/repository/course_details_repository.dart';
import 'package:tutors_plan/feature/course_details/data/repository/course_module_response.dart';
import 'package:tutors_plan/feature/my_course/data/my_course_response.dart';
import 'package:tutors_plan/feature/my_course/data/repository/my_course_repository.dart';


class MyCourseController extends GetxController {
  final Rx<ScreenStates> screenStates = Rx<ScreenStates>(ScreenStates.DEFAULT);
  final Rx<ScreenStates> loaderState = Rx<ScreenStates>(ScreenStates.DEFAULT);

  RxBool isLoadingMyCourseList = false.obs;
  RxBool isLoadingMyCourseModuleList = false.obs;
  List<MyCourse>? myCourseList = [];

  MyCourseRepository myCourseRepository = MyCourseRepository();
  final Rx<Modules> courseModules = Modules().obs;

  Future<void> getMyCourse({int? coursePage}) async {
    isLoadingMyCourseList.value = false;
    final result = await myCourseRepository.getMyCourse(
      page: coursePage,
      limit: 10,
    );
    if (result != null) {
      isLoadingMyCourseList.value = true;
      myCourseList = result;
    }
    isLoadingMyCourseList.value = true;
  }

  Future<void> getMyCourseModules(String courseId) async {
    isLoadingMyCourseModuleList.value = false;
    final result = await myCourseRepository.getMyCourseModulesResponse(courseId);
    if (result != null) {
      isLoadingMyCourseModuleList.value = false;
      courseModules.value = result;
    }
    isLoadingMyCourseModuleList.value = false;
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
