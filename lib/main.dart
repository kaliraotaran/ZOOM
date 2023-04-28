import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_app/resources/auth_methods.dart';
import 'package:zoom_app/screens/home_screen.dart';
import 'package:zoom_app/screens/login_screen.dart';
import 'package:zoom_app/screens/video_call_screen.dart';
import 'package:zoom_app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/video-call':(context)=>VideoCallScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder:(context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator()
          );

        }
        if(snapshot.hasData){
          return  HomeScreen();
        }
        return LoginScreen();
      },),
    );
  }
}
