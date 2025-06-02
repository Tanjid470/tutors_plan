import 'package:get/get.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/dashboard/data/course_get_response_body.dart';
import 'package:tutors_plan/feature/profile/data/profile_get_response_body.dart';
import 'package:tutors_plan/feature/dashboard/data/repository/dashboard_repository.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/slider.dart';

class DashboardController extends GetxController {
  final Rx<ScreenStates> screenStates = Rx<ScreenStates>(ScreenStates.DEFAULT);
  final Rx<ScreenStates> loaderState = Rx<ScreenStates>(ScreenStates.DEFAULT);

  DashboardRepository dashboardRepository = DashboardRepository();
  ProfileGetResponseBody profileGetResponseBody = ProfileGetResponseBody();

  RxBool isLoadingMore = false.obs;
  RxBool isLoadingCategoryList = false.obs;
  RxBool isLoadingCourseList = false.obs;
  RxBool isProfileLoading = false.obs;

  List<Slider> splashList = [
    Slider(
      title: 'Live Tutoring',
      description:
      'Connect with certified tutors globally through our interactive platform, offering personalized 24/7 support across all subjects and educational levels.',
      iconText: 'Meet Tutors',
      color: ColorUtils.baseColor,
      onTap: () {
        // Navigate to tutoring section
      },
    ),
    Slider(
      title: 'ScholarPASS',
      description:
      'Access comprehensive scholarships that cover educational fees, making quality learning accessible to students regardless of financial background.',
      iconText: 'Apply Now',
      color: ColorUtils.baseColor,
      onTap: () {
        // Navigate to scholarships
      },
    ),
    Slider(
      title: 'LearningART AI',
      description:
      'Experience cutting-edge AI-powered personalized learning that adapts to your unique style, pace, and preferences for optimal educational outcomes.',
      iconText: 'Try AI Learning',
      color: ColorUtils.basePurpleColor,
      onTap: () {
        // Navigate to AI learning
      },
    ),
    Slider(
      title: 'TutorsPlan Store',
      description:
      'Access premium educational supplies, cutting-edge robotic kits, and specialized learning materials for students of all ages and abilities.',
      iconText: 'Explore Store',
      color: ColorUtils.baseOrangeColor,
      onTap: () {
        // Navigate to store
      },
    ),
    Slider(
      title: 'LearningHub',
      description:
      'Discover and connect with local education providers through our community marketplace, creating a rich ecosystem of diverse learning opportunities.',
      iconText: 'Find Providers',
      color: ColorUtils.baseColor,
      onTap: () {
        // Navigate to learning hub
      },
    ),
    Slider(
      title: 'Become Hub Partner',
      description:
      'Join our network of educational partners and expand your reach. Collaborate with us to provide quality learning experiences and grow your educational business.',
      iconText: 'Partner With Us',
      color: ColorUtils.baseColor,
      onTap: () {
        // Navigate to partner page
      },
    ),
  ];

  List<CourseModel>? courseList = [];

  int categoryPage = 1;
  int coursePage = 1;

  // Future<void> getCourseCategory({int? categoryPage}) async {
  //   isLoadingMore.value = true;
  //
  //   final result = await dashboardRepository.getCourseCategory(
  //     page: categoryPage,
  //     limit: 10,
  //   );
  //   if (result != null) {
  //     isLoadingCategoryList.value = true;
  //     if (categoryList?.isEmpty == true) {
  //       categoryList = result;
  //     } else {
  //       categoryList?.addAll(result);
  //     }
  //   }
  //   isLoadingMore.value = false;
  // }

  Future<void> getCourse({int? coursePage}) async {
    isLoadingCourseList.value = false;
    updateViewState(loadingState: ScreenStates.TRANSPARENT_LOADING_START);
    final result = await dashboardRepository.getCourse(
      page: coursePage,
      limit: 10,
    );
    if (result != null) {
      isLoadingCourseList.value = true;
      if (courseList?.isEmpty == true) {
        courseList = result;
      } else {
        courseList?.addAll(result);
      }
    }
    updateViewState(screenStates: ScreenStates.LOADING_COMPLETE);
  }

  Future<void> getUserProfile() async {
    isProfileLoading.value = true;
    final result = await dashboardRepository.getUserProfile();
    if (result != null) {
      profileGetResponseBody = result;
    }
    isProfileLoading.value = false;
  }

  var selectedPage = 0.obs;
  void changePage(int value) {
    selectedPage.value = value;
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
