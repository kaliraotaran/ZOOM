import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_app/resources/jitsi_meet_methods.dart';
import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetMethod _jitsiMeetMethod = JitsiMeetMethod();
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethod.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinmeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: createNewMeeting,
              text: 'New Meeting',
              icon: Icons.videocam,
            ),
            HomeMeetingButton(
              onPressed:()=> joinmeeting(context),
              text: 'Join Meeting',
              icon: Icons.add_box_rounded,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: 'Schedule',
              icon: Icons.calendar_today,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: 'Share Screen',
              icon: Icons.arrow_upward_rounded,
            ),
          ],
        ),
        const Expanded(
            child: Center(
          child: Text(
            'create or Join Meeting with a click!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ))
      ],
    );
  }
}
