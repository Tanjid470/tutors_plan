import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/route/app_pages.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: SizedBox(),
          title: Text('Dashboard'),
          actions: [
            IconButton(
              onPressed: () async {
                await preferences.clear();
                Navigator.pushReplacementNamed(context, RouteNames.loginView);
              }
              , icon: Icon(Icons.logout,color: Colors.red,),)
          ],
        ),
      ),
    );
  }
}
