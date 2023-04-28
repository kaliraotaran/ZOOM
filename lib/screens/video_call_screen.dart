import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_app/resources/auth_methods.dart';
import 'package:zoom_app/resources/jitsi_meet_methods.dart';
import 'package:zoom_app/screens/meeting_option.dart';
import 'package:zoom_app/utils/colors.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethod _jitsiMeetMethod = JitsiMeetMethod();
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting() {
    _jitsiMeetMethod.createMeeting(
        roomName: meetingIdController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: nameController.text
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          'Join a meeting',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        SizedBox(
          height: 60,
          child: TextField(
            controller: meetingIdController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Room ID',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
          ),
        ),
        SizedBox(
          height: 60,
          child: TextField(
            controller: nameController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Name',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: _joinMeeting,
          child: Padding(
            child: Text(
              'Join',
              style: TextStyle(fontSize: 16),
            ),
            padding: EdgeInsets.all(8),
          ),
        ),
        const SizedBox(height: 60),
        MeetingOption(
          text: 'Mute Audio',
          isMute: isAudioMuted,
          onchanged: onAudioMuted,
        ),
        MeetingOption(
          text: 'Turn Video Off',
          isMute: isVideoMuted,
          onchanged: onVideoMuted,
        ),
      ]),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
