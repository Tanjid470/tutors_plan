import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/course_details/data/course_details_response.dart';
import 'package:tutors_plan/feature/course_details/data/payment_response.dart';
import 'package:tutors_plan/feature/course_details/data/repository/course_details_repository.dart';
import 'package:tutors_plan/feature/course_details/data/course_module_response.dart';


class CourseDetailsController extends GetxController {
  final Rx<ScreenStates> screenStates = Rx<ScreenStates>(ScreenStates.DEFAULT);
  final Rx<ScreenStates> loaderState = Rx<ScreenStates>(ScreenStates.DEFAULT);

  CourseDetailsRepository courseDetailsRepository = CourseDetailsRepository();

  final Rx<CourseDetails> courseDetails = CourseDetails().obs;
  final Rx<Modules> courseModules = Modules().obs;
  final Rx<PaymentStripe> paymentStripe = PaymentStripe().obs;

  final RxBool isEnrollPaymentLoading = false.obs;


  Future<void> getCourseDetails(String courseId) async {
    updateViewState(loadingState: ScreenStates.TRANSPARENT_LOADING_START);
    final result = await courseDetailsRepository.getCourseDetailsResponse(courseId);
    if (result != null) {
      courseDetails.value = result;
      updateViewState(screenStates: ScreenStates.LOADING_COMPLETE);
    }
    updateViewState(screenStates: ScreenStates.LOADING_COMPLETE);
  }

  Future<void> getCourseModules(String courseId) async {
    updateViewState(loadingState: ScreenStates.TRANSPARENT_LOADING_START);
    final result = await courseDetailsRepository.getCourseModulesResponse(courseId);
    if (result != null) {
      courseModules.value = result;
      updateViewState(screenStates: ScreenStates.LOADING_COMPLETE);
    }
    updateViewState(screenStates: ScreenStates.LOADING_COMPLETE);
  }

  Future<void> enrollPayment(BuildContext context, {required String courseID}) async {
    isEnrollPaymentLoading.value = true;
    final result = await courseDetailsRepository.courseEnrollPayment(courseID);
    if (result != null) {
      paymentStripe.value = result;
      isEnrollPaymentLoading.value = false;
    }
    isEnrollPaymentLoading.value = false;
  }

  void updateViewState({ScreenStates? screenStates, ScreenStates? loadingState}) {
    if (screenStates != null) {
      this.screenStates.value = screenStates;
      loaderState.value = ScreenStates.LOADING_COMPLETE;
    }
    if (loadingState != null) loaderState.value = loadingState;
    update();
  }

}
