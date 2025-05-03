import 'package:get/get.dart';
import 'package:tutors_plan/feature/dashboard/data/course_categories_response_body.dart';
import 'package:tutors_plan/feature/dashboard/data/repository/dashboard_repository.dart';


class DashboardController extends GetxController{

  DashboardRepository dashboardRepository = DashboardRepository();

  List<CategoryListModel>? categoryList = [];

  RxBool isLoadingCategoryList = false.obs;

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

}