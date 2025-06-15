import 'package:flutter/material.dart';
import 'package:tutors_plan/global_widget/buttons.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/main.dart';
import 'package:tutors_plan/route/app_pages.dart';

class ExamView extends StatefulWidget {

  const ExamView({super.key});

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const SizedBox(),
          title: const Text('Exam'),
        ),
        body: const Center(
          child: Text("Exam"),
        )
    );
  }

  Widget logoutButton(){
    return Buttons(
      style: ButtonsStyle.dynamicButton,
      bgColor: Colors.red.shade300,
      isExpended: true,
      title: 'Logout',
      onTap: () async {
        await preferences.clear();
        Navigator.pushReplacementNamed(
            context, RouteNames.loginView);
      },
    );
  }
}
