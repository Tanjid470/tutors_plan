import 'package:get/get.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/course_details/data/course_details_response_body.dart';
import 'package:tutors_plan/feature/course_details/data/repository/course_details_repository.dart';


class CourseDetailsController extends GetxController {
  final Rx<ScreenStates> screenStates = Rx<ScreenStates>(ScreenStates.DEFAULT);
  final Rx<ScreenStates> loaderState = Rx<ScreenStates>(ScreenStates.DEFAULT);

  CourseDetailsRepository courseDetailsRepository = CourseDetailsRepository();
  final Rx<CourseDetails> courseDetails = CourseDetails().obs;


  Future<void> getCourseDetails() async {
    updateViewState(loadingState: ScreenStates.TRANSPARENT_LOADING_START);
    final result = await courseDetailsRepository.getCourseDetailsResponse();
    if (result != null) {
      courseDetails.value = result;
      updateViewState(screenStates: ScreenStates.LOADING_COMPLETE);
    }
    updateViewState(screenStates: ScreenStates.LOADING_COMPLETE);
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
