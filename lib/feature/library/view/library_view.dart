import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tutors_plan/common_widget/buttons.dart';
import 'package:tutors_plan/common_widget/text_tab_bar.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/enums.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Enroll action
              },
              child: Text('Enroll Course'),
            ),
            ElevatedButton(
              onPressed: () {
                // Recommend action
              },
              child: Text('Recommend'),
            ),
            ElevatedButton(
              onPressed: () {
                // Exploring action
              },
              child: Text('Exploring'),
            ),
          ],
        ),

        Expanded(child: Center(child: Text('Self learning',style: TextStyle(fontSize: TextSize.font20(context),fontWeight: FontWeight.bold)))),
      ],
    );
  }

  Widget _liveTutoring() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Image.asset('assets/images/zoom_logo.png',
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Text('Your userId : $userId',
              style: customTextStyle(
                context,
                fontSize: TextSize.font16(context),
                fontWeight: FontWeight.w500,
                color: Colors.black87
              ),
            ),
            verticalGap(context, 1),
            Text('Conference Id : $randomConferenceId',
              style: customTextStyle(
                  context,
                  fontSize: TextSize.font16(context),
                  fontWeight: FontWeight.w500,
                  color: Colors.black87
              ),
            ),
            verticalGap(context, 2),
            TextFormField(
              maxLength: 10,
              keyboardType: TextInputType.number,
              controller: meetsTabController,
              decoration: const InputDecoration(
                hintText: 'Enter conference Id to join',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
            ),
            Buttons(
              onTap: () {
                if (meetsTabController.text.length == 10) {
                  jumpToMeetPage(context, conferenceId: meetsTabController.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Conference ID must be 10 digits',
                        style: customTextStyle(
                          context,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: TextSize.font16(context)
                        )
                      ),
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 2),
                      backgroundColor: ColorUtils.errorSnackBarColor,
                    ),
                  );
                }
              },
              title: 'Join a meeting',
              style: ButtonsStyle.blueButton,
            ),
            SizedBox(height: 10,),
            Buttons(
              onTap: () {
                jumpToMeetPage(context, conferenceId : randomConferenceId);
              },
              title: 'Start a meeting',
              style: ButtonsStyle.blueButton,
            )

          ],
        ),
      )
    );
  }

  Widget _stats() {
    return Center(child: Text('Stats',style: TextStyle(fontSize: TextSize.font20(context),fontWeight: FontWeight.bold)));
  }

  void jumpToMeetPage(BuildContext context, {required String conferenceId}) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context)=> VideoConferencePage(conferenceId :conferenceId))
    );
  }
}

class VideoConferencePage extends StatelessWidget {
  final String conferenceId;
  final String userId = Random().nextInt(900000 + 100000).toString();

  VideoConferencePage({super.key, required this.conferenceId});
  final int appID = int.parse(dotenv.get('ZEGO_APP_ID'));
  final String appSIGN = dotenv.get('ZEGO_APP_SIGN');
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: appID,
        appSign: appSIGN,
        conferenceID: conferenceId,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
        userID: userId,
        userName: 'Tanjid',
      )
    );
  }
}
