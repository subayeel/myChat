import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mychat/components/round_button.dart';
import 'package:mychat/screens/registration_screen.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Hero(
                tag: 'logo',
                child: Container(
                  height: 100,
                  child: Image.asset('images/mychatlogo.PNG'),
                ),
              ),
              SizedBox(
                width: 32,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('myChat',
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 32)),
                ],
              ),
            ],
          ),
          RoundButton(
              title: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              color: Colors.blue),
          RoundButton(
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              color: Colors.blueGrey),
        ],
      ),
    );
  }
}
