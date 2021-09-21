import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mychat/components/round_button.dart';
import 'package:mychat/constants.dart';

import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email = '';
  String password = '';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: 'logo',
            child: Container(
              height: 200,
              child: Image.asset('images/mychatlogo.PNG'),
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              email = value;
            },
            decoration: kTextFieldDecoration.copyWith(
              hintText: 'Enter your Email',
            ),
            controller: emailController,
          ),
          SizedBox(
            height: 32,
          ),
          TextField(
            controller: passwordController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            onChanged: (value) {
              password = value;
            },
            decoration: kTextFieldDecoration.copyWith(
              hintText: 'Enter your Password',
            ),
          ),
          SizedBox(
            height: 48,
          ),
          RoundButton(
              title: 'Register',
              onPressed: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
              color: Colors.blueGrey),
        ],
      ),
    );
  }
}
