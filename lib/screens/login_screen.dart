import 'package:flutter/material.dart';
import 'package:mychat/components/round_button.dart';
import 'package:mychat/services/authentication_service.dart';
import 'package:provider/src/provider.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
          SizedBox(
            height: 12,
          ),
          TextField(
            controller: emailController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              email = value;
            },
            decoration: kTextFieldDecoration.copyWith(
              hintText: 'Enter your Email',
            ),
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
              title: 'Login',
              onPressed: () async {
                await context.read<AuthService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim());
                Navigator.pop(context);
              },
              color: Colors.blue),
        ],
      ),
    );
  }
}
