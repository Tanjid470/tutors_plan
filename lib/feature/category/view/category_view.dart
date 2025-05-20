import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/dashboard/controller/dashboard_controller.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  DashboardController dashboardController = Get.put(DashboardController());
  final ScrollController categoryScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    categoryScrollController.addListener(() {
      if (categoryScrollController.position.pixels >=
          categoryScrollController.position.maxScrollExtent &&
          !dashboardController.isLoadingMore.value) {
        dashboardController.getCourseCategory(
          categoryPage: ++dashboardController.categoryPage,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            dashboardController.categoryPage = 1;
            dashboardController.categoryList?.clear();
            dashboardController.getCourseCategory(categoryPage: 1);
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Categories',
          style: customTextStyle(
              context,
              fontSize: TextSize.font20(context)
          ))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child:Obx((){
          return  ListView.builder(
          controller: categoryScrollController,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          itemCount: dashboardController.categoryList!.length +
                (dashboardController.isLoadingMore.value ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == dashboardController.categoryList?.length) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final categoryItem = dashboardController.categoryList![index];
            return Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, 0),
                    blurRadius: 5,
                  ),
                ],
                border: Border(
                  left: BorderSide(color: ColorUtils.baseColor, width: 4),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    categoryItem.image != null && categoryItem.image!.isNotEmpty
                        ? CachedNetworkImage(
                      imageUrl: categoryItem.image!,
                      height: 70,
                      width: 70,
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/dummy_image.jpg',
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.5,
                        fit: BoxFit.fill,
                      ),
                    )
                        : Image.asset(
                      'assets/images/dummy_image.jpg',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: ResponsiveScale.of(context).wp(3)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categoryItem.name ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: TextSize.font16(context),
                            ),
                          ),
                          Text(
                            "${categoryItem.seoKeywords ?? ''} courses",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${categoryItem.totalCourse ?? '0'} courses",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${categoryItem.enrolledStudents ?? '0'} students",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );}
        )
      )
    );
  }
}
