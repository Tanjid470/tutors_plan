import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/app_images.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/feature/dashboard/view/dashboard_view.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  BottomNavigationWidgetState  createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int selectedIndex = 0;
  PageController pageController = PageController();
  /* List<Widget> widgets=[
    Text('Home'),
    Text('Search'),
    Text('Add'),
    Text('Profile'),
  ];*/
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
        children: const [
          DashboardView(),
          DashboardView(),
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
              decoration: const BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    spreadRadius: 20,
                    blurRadius: 50,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
            ),
          ),
          BottomNavigationBar(
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Container(
                height: Get.height/30,
                width: Get.height/30,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: selectedIndex == 0
                            ? AssetImage(AppImages.dashBoard)
                            : AssetImage(AppImages.dashBoard)
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
              ),label: 'Updates'),
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
            unselectedItemColor: ColorUtils.baseBlueColor,
            selectedIconTheme:  IconThemeData(color: ColorUtils.baseBlueColor,),
            iconSize: TextSize.font36(context),
            selectedFontSize: TextSize.font14(context),
            selectedItemColor: Colors.white,
            backgroundColor: ColorUtils.grey300,
            onTap: onTapped,
          ),
        ],
      ),
    );
  }
}