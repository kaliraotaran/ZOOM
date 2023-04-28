import 'package:flutter/material.dart';
import 'package:zoom_app/resources/auth_methods.dart';
import 'package:zoom_app/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38),
            child: Image.asset('assets/images/onboarding.jpeg'),
          ),
          CustomButton(
            text: 'Login',
            onPressed: () async {
              bool res = await _authMethods.signInWithGoogle(context);
              if (res) {
                Navigator.pushNamed(context, '/home');
              }
            },
          )
        ],
      ),
    );
  }
}
