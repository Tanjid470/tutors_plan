import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class VideoConferenceView extends StatelessWidget {
  final String conferenceId;
  final String userId = Random().nextInt(900000 + 100000).toString();

  VideoConferenceView({super.key, required this.conferenceId});
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
