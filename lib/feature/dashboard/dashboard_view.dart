import 'package:flutter/material.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/route/app_pages.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: null,
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
    );
  }

}
