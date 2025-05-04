import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/app_images.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/feature/dashboard/view/dashboard_view.dart';
import 'package:tutors_plan/feature/library/view/library_view.dart';


class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  BottomNavigationWidgetState  createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int selectedIndex = 0;
  PageController pageController = PageController();
  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          DashboardView(),
          LibraryView(),
          DashboardView(),
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              decoration:  BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 20,
                    blurRadius: 100,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
            ),
          ),
          BottomNavigationBar(
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Container(
                height: Get.height/40,
                width: Get.height/40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: selectedIndex == 0
                            ? AssetImage(AppImages.homeSelected)
                            : AssetImage(AppImages.homeUnSelected)
                    )
                ),
              ),label: 'Home'),
              BottomNavigationBarItem(icon: Container(
                height: Get.height/30,
                width: Get.height/30,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: selectedIndex == 1
                            ? AssetImage(AppImages.dashBoard)
                            : AssetImage(AppImages.dashBoard)
                    )
                ),
              ),label: 'Library'),
              BottomNavigationBarItem(icon: Container(
                height: Get.height/30,
                width: Get.height/30,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: selectedIndex == 2
                            ? AssetImage(AppImages.dashBoard)
                            : AssetImage(AppImages.dashBoard)
                    )
                ),
              ),label: 'Other'),
            ],
            currentIndex: selectedIndex,
            unselectedLabelStyle: TextStyle(fontSize: TextSize.font14(context),fontWeight: FontWeight.bold),
            selectedLabelStyle: TextStyle(fontSize: TextSize.font14(context),fontWeight: FontWeight.bold),
            landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
            unselectedItemColor: ColorUtils.black,
            selectedIconTheme:  IconThemeData(color: ColorUtils.baseBlueColor,),
            iconSize: TextSize.font36(context),
            selectedFontSize: TextSize.font14(context),
            selectedItemColor: ColorUtils.baseBlueColor,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: onTapped,
          ),
        ],
      ),
    );
  }
}