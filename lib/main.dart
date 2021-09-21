import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mychat/screens/chat_screen.dart';
import 'package:mychat/screens/login_screen.dart';
import 'package:mychat/screens/registration_screen.dart';
import 'package:mychat/screens/welcome_screen.dart';
import 'package:mychat/services/authentication_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(
            create: (_) => AuthService(firebaseAuth: FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<AuthService>().authStateChanges,
            initialData: null,
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          home: AuthenticationWrapper(),
          routes: {
            'registration_screen': (context) => const RegistrationScreen(),
            'login_screen': (context) => const LoginScreen(),
            'chat_screen': (context) => const ChatScreen(),
            'welcome_screen': (context) => const WelcomeScreen(),
          },
        ));
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);
  static const String id = 'authentication_wrapper';

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return const ChatScreen();
    }
    return const WelcomeScreen();
  }
}
