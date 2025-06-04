import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/feature/dashboard/view/dashboard_view.dart';
import 'package:tutors_plan/feature/my_course/view/my_course_view.dart';
import 'package:tutors_plan/feature/profile/view/profile_view.dart';
import 'package:tutors_plan/global_widget/in_app_web_view.dart';
import 'package:tutors_plan/main.dart';


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
    String accessToken = preferences.getString('accessToken') ?? '';
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children:  [
          const DashboardView(),
          const MyCourseView(),
          InAppWebView(url: 'https://games.tutorsplan.com?token=$accessToken'),
          const ProfileView(),
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
                    blurRadius: 30,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
            ),
          ),
          BottomNavigationBar(
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled,size: TextSize.font26(context)),
                  label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.school_outlined,size: TextSize.font26(context)),label: 'Learning'),
              BottomNavigationBarItem(icon: Icon(Icons.gamepad_outlined,size: TextSize.font26(context)),label: 'Games'),
              BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined,size: TextSize.font26(context)),label: 'Profile'),
            ],
            currentIndex: selectedIndex,
            unselectedLabelStyle: TextStyle(fontSize: TextSize.font14(context),fontWeight: FontWeight.w400),
            selectedLabelStyle: TextStyle(fontSize: TextSize.font14(context),fontWeight: FontWeight.bold),
            landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
            unselectedItemColor: ColorUtils.black,
            selectedIconTheme:  IconThemeData(color: ColorUtils.baseColor,),
            iconSize: TextSize.font36(context),
            selectedFontSize: TextSize.font14(context),
            selectedItemColor: ColorUtils.baseColor,
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