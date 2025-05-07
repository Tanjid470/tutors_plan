import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/feature/dashboard/view/dashboard_view.dart';
import 'package:tutors_plan/feature/library/view/library_view.dart';
import 'package:tutors_plan/feature/webview/in_app_web_view.dart';


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
          InAppWebView(),
          Center(child: Text('Games')),
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
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.school_outlined),label: 'Learning'),
              BottomNavigationBarItem(icon: Icon(Icons.gamepad_outlined),label: 'Games'),
              BottomNavigationBarItem(icon: Icon(Icons.padding),label: 'Exams'),
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