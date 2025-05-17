import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tutors_plan/common_widget/buttons.dart';
import 'package:tutors_plan/common_widget/text_tab_bar.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/library/widget/google_meet/google_client_id.dart';
import 'package:tutors_plan/feature/library/widget/live_classes.dart';
import 'package:tutors_plan/feature/library/widget/self_learning_view.dart';
import 'package:tutors_plan/feature/library/widget/video_conference_view.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  TextEditingController meetsTabController = TextEditingController();
  final _tabs = const ['Self Learn', 'Live Tutoring', 'Stats'];

  final String userId = Random().nextInt(900000 + 100000).toString();
  final String randomConferenceId =
    (Random().nextInt(1000000000) * 10 +
        Random().nextInt(10)).toString()
        .padLeft(10, '0');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Learning',
                style: TextStyle(
                  color: ColorUtils.black,
                  fontSize: TextSize.font20(context),
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(child: body()),
            ],
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextTabBar(
            isScrollable: false,
            tabAlignment: TabAlignment.fill,
            controller: _tabController,
            tabs: _tabs),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: _tabBarView(),
          ),
        )
      ],
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: _tabController,
      physics: const ScrollPhysics(
        parent: NeverScrollableScrollPhysics(),
      ),
      children: [
        _selfLearning(),
        _liveTutoring(),
        _stats(),
      ],
    );
  }

  Widget _selfLearning() {
    return SelfLearning();
  }

  Widget _liveTutoring() {
    return LiveClassesPage();
  }

  // Widget _liveTutoring() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //     child: Column(
  //       children: [
  //         Image.asset('assets/images/zoom_logo.png',
  //           width: MediaQuery.of(context).size.width * 0.6,
  //           height: MediaQuery.of(context).size.height * 0.25,
  //         ),
  //         Text('Your userId : $userId',
  //           style: customTextStyle(
  //             context,
  //             fontSize: TextSize.font16(context),
  //             fontWeight: FontWeight.w500,
  //             color: Colors.black87
  //           ),
  //         ),
  //         verticalGap(context, 1),
  //         Text('Conference Id : $randomConferenceId',
  //           style: customTextStyle(
  //               context,
  //               fontSize: TextSize.font16(context),
  //               fontWeight: FontWeight.w500,
  //               color: Colors.black87
  //           ),
  //         ),
  //         verticalGap(context, 2),
  //         TextFormField(
  //           maxLength: 10,
  //           keyboardType: TextInputType.number,
  //           controller: meetsTabController,
  //           decoration: const InputDecoration(
  //             hintText: 'Enter conference Id to join',
  //             hintStyle: TextStyle(color: Colors.grey),
  //             border: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(10)),
  //             ),
  //             focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(10)),
  //               borderSide: BorderSide(color: Colors.blueAccent, width: 2),
  //             ),
  //           ),
  //         ),
  //         Buttons(
  //           onTap: () {
  //             if (meetsTabController.text.length == 10) {
  //               jumpToMeetPage(context, conferenceId: meetsTabController.text);
  //             } else {
  //               ScaffoldMessenger.of(context).showSnackBar(
  //                 SnackBar(
  //                   content: Text('Conference ID must be 10 digits',
  //                     style: customTextStyle(
  //                       context,
  //                       color: Colors.black,
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: TextSize.font16(context)
  //                     )
  //                   ),
  //                   behavior: SnackBarBehavior.floating,
  //                   duration: Duration(seconds: 2),
  //                   backgroundColor: ColorUtils.errorSnackBarColor,
  //                 ),
  //               );
  //             }
  //           },
  //           title: 'Join a meeting',
  //           style: ButtonsStyle.blueButton,
  //         ),
  //         SizedBox(height: 10,),
  //         Buttons(
  //           onTap: () {
  //             jumpToMeetPage(context, conferenceId : randomConferenceId);
  //           },
  //           title: 'Start a meeting',
  //           style: ButtonsStyle.blueButton,
  //         )
  //
  //       ],
  //     ),
  //   );
  // }

  // Widget _stats() {
  //   return GoogleMeetCreator();
  // }
  Widget _stats() {
    final List<Map<String, String>> tutors = [
      {
        'name': 'Alice Johnson',
        'email': 'alice.johnson@example.com',
        'subject': 'Mathematics',
        'contact': '+1 123 456 7890',
      },
      {
        'name': 'David Kim',
        'email': 'david.kim@example.com',
        'subject': 'Science',
        'contact': '+1 987 654 3210',
      },
      {
        'name': 'Tanjid Amran',
        'email': 'tanjid.amran@example.com',
        'subject': 'History',
        'contact': '+880 1234 567 890',
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: tutors.map((tutor) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 6),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border(
              left: BorderSide(color: ColorUtils.baseBlueColor, width: 4),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tutor Image
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorUtils.baseBlueColor, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Tutor Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tutor['name']!,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Email: ${tutor['email']}',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      'Subject: ${tutor['subject']}',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      'Contact: ${tutor['contact']}',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );

  }


  void jumpToMeetPage(BuildContext context, {required String conferenceId}) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context)=> VideoConferenceView(conferenceId :conferenceId))
    );
  }
}

