import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tutors_plan/common_widget/text_tab_bar.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
              const SizedBox(height: 20),
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
        _quiz(),
        _game(),
        _exam(),

      ],
    );
  }

  Widget _quiz() {
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

  Widget _game() {
    return Expanded(
      child: Column(
        children: [
          Text('Live Tutoring',style: TextStyle(fontSize: TextSize.font20(context),fontWeight: FontWeight.bold)),
          Image.network('https://w7.pngwing.com/pngs/805/460/png-transparent-zoom-logo-thumbnail.png',
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          Text('User Id: 1234567890'),
          Text('Password: 1234567890'),
          TextFormField(
            maxLength: 10,
            keyboardType: TextInputType.number,
            controller: meetsTabController,
            decoration: const InputDecoration(
              hintText: 'Enter User Id',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              jumpToMeetPage(context, conferenceId : meetsTabController.text);
            },
            child: Text('Join a meeting'),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              jumpToMeetPage(context, conferenceId : '12345678');
            },
            child: Text('New meeting'),
          )

        ],
      )
    );
  }

  Widget _exam() {
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
        userID: '1234',
        userName: 'Jawad',
      )
    );
  }
}
