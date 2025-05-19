import 'package:get/get.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/feature/dashboard/data/course_categories_response_body.dart';
import 'package:tutors_plan/feature/dashboard/data/course_get_response_body.dart';
import 'package:tutors_plan/feature/profile/data/profile_get_response_body.dart';
import 'package:tutors_plan/feature/dashboard/data/repository/dashboard_repository.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/slider.dart';
import 'package:tutors_plan/utils/network/api_result.dart';



class DashboardController extends GetxController{
  final Rx<ScreenStates> screenStates = Rx<ScreenStates>(ScreenStates.DEFAULT);
  final Rx<ScreenStates> loaderState = Rx<ScreenStates>(ScreenStates.DEFAULT);

  DashboardRepository dashboardRepository = DashboardRepository();
  CourseGetResponseBody courseGetResponseBody = CourseGetResponseBody();
  ProfileGetResponseBody profileGetResponseBody = ProfileGetResponseBody();
  List<CategoryListModel>? categoryList = [];

  RxBool isLoadingCategoryList = false.obs;
  RxBool isProfileDataLoading = false.obs;

  Future<void> getCourseCategory() async {
    final result = await dashboardRepository.getCourseCategory(
      page: 1.toString(),
      limit:10.toString()
    );
    if (result != null) {
      isLoadingCategoryList.value = true;
      categoryList = result;
    }
  }

  Future<void> getUserProfile() async {
    final result = await dashboardRepository.getUserProfile();
    if (result != null) {
      isLoadingCategoryList.value = true;
      profileGetResponseBody = result;
    }
  }


  var selectedPage = 0.obs;
  void changePage(int value) {
    selectedPage.value = value;
  }

  List<Slider> splashList = [
    Slider(
      title: 'Live Tutoring',
      description: 'Connect with certified tutors globally through our interactive platform, offering personalized 24/7 support across all subjects and educational levels.',
      iconText: 'Meet Tutors',
      color: ColorUtils.baseColor,
      onTap: () {
        // Navigate to tutoring section
      },
    ),

    Slider(
      title: 'ScholarPASS',
      description: 'Access comprehensive scholarships that cover educational fees, making quality learning accessible to students regardless of financial background.',
      iconText: 'Apply Now',
      color: ColorUtils.baseColor,
      onTap: () {
        // Navigate to scholarships
      },
    ),

    Slider(
      title: 'LearningART AI',
      description: 'Experience cutting-edge AI-powered personalized learning that adapts to your unique style, pace, and preferences for optimal educational outcomes.',
      iconText: 'Try AI Learning',
      color: ColorUtils.basePurpleColor,
      onTap: () {
        // Navigate to AI learning
      },
    ),

    Slider(
      title: 'TutorsPlan Store',
      description: 'Access premium educational supplies, cutting-edge robotic kits, and specialized learning materials for students of all ages and abilities.',
      iconText: 'Explore Store',
      color: ColorUtils.baseOrangeColor,
      onTap: () {
        // Navigate to store
      },
    ),

    Slider(
      title: 'LearningHub',
      description: 'Discover and connect with local education providers through our community marketplace, creating a rich ecosystem of diverse learning opportunities.',
      iconText: 'Find Providers',
      color: ColorUtils.baseColor,
      onTap: () {
        // Navigate to learning hub
      },
    ),

    Slider(
      title: 'Become Hub Partner',
      description: 'Join our network of educational partners and expand your reach. Collaborate with us to provide quality learning experiences and grow your educational business.',
      iconText: 'Partner With Us',
      color: ColorUtils.baseColor,
      onTap: () {
        // Navigate to partner page
      },
    ),
  ];

  Future<void> getCourse() async {
    updateViewState(loadingState: ScreenStates.TRANSPARENT_LOADING_START);

    final result = await dashboardRepository.getCourse();

    if (result is ApiSuccess<CourseGetResponseBody>) {
      final data = result.data;
      if (data.status == 'SUCCESS') {
        courseGetResponseBody = data;
      } else {

      }

    }
    else if (result is ApiError) {
      final apiError = result as ApiError;
    }
    updateViewState(screenStates: ScreenStates.LOADING_COMPLETE);
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