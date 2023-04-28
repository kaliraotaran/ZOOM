import 'package:flutter/material.dart';
import 'package:zoom_app/resources/auth_methods.dart';
import 'package:zoom_app/screens/history_meeting_screen.dart';
import 'package:zoom_app/screens/meeting_screen.dart';
import 'package:zoom_app/utils/colors.dart';
import 'package:zoom_app/widgets/custom_button.dart';
import 'package:zoom_app/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int _page = 0;
  onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }
  List<Widget> pages = [
     MeetingScreen(),
     HistoryMeetingScreen(),
     const Text('contacts'),
     CustomButton(text: 'Logout', onPressed: ()=>AuthMethods().signOut())

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Meet and Chat'),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: pages[_page],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.comment_bank), label: 'Meet and Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.lock_clock), label: 'Meetings'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Contacts'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Setting')



        ],
      ),

    );
  }
}

class HistoryMeeting extends StatelessWidget {
  const HistoryMeeting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(onPressed: (){}, text: 'New Meeting',icon: Icons.videocam,),
            HomeMeetingButton(onPressed: (){}, text: 'Join Meeting',icon: Icons.add_box_rounded,),
            HomeMeetingButton(onPressed: (){}, text: 'Schedule',icon: Icons.calendar_today,),
            HomeMeetingButton(onPressed: (){}, text: 'Share Screen',icon: Icons.arrow_upward_rounded,),

          ],
        ),
        const Expanded(child: Center(child: Text('create or Join Meeting with a click!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),))
      ],
    );
  }
}
