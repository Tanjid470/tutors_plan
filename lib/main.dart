import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutors_plan/feature/dashboard/view/dashboard_view.dart';
import 'package:tutors_plan/route/app_pages.dart';
import 'config/font_constants.dart';
import 'feature/bottom_navigator/view/bottom_navigation_view.dart';
import 'feature/login/view/login_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();

late SharedPreferences preferences;
int? isInitScreen;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  isInitScreen = preferences.getInt('initScreen');
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TutorsPlan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white), // Modify or remove this if needed
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white, // Set your preferred background color here
      ),
      debugShowCheckedModeBanner: true,
      home: const BottomNavigationWidget(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: FlutterSmartDialog.init(
          toastBuilder: (String msg) => Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Colors.red.shade300
              ),
              child: Text(msg,
                style:   TextStyle(
                  color: Colors.white,
                  fontSize: TextSize.font16(context),
                ),
              ),
            ),
          ),
          loadingBuilder: (String msg) => CircularProgressIndicator()
      ),
      navigatorObservers: [FlutterSmartDialog.observer],
      navigatorKey: navigatorKey,
    );
  }
}
