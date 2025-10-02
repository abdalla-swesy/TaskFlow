import 'package:TaskFlow/Auth/Authpage.dart';
import 'package:TaskFlow/Settings.dart';
import 'package:TaskFlow/Start.dart';
import 'package:TaskFlow/Tasks/addcategories.dart';
import 'package:TaskFlow/Tasks/archive.dart';
import 'package:TaskFlow/Tasks/edit.dart';
import 'package:TaskFlow/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:TaskFlow/Auth/Login.dart';
import 'package:TaskFlow/Auth/Signup.dart';
import 'package:TaskFlow/Tasks.dart';
import 'package:TaskFlow/features.dart';
import 'package:TaskFlow/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class DefaultFirebaseOptions {}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          (FirebaseAuth.instance.currentUser != null &&
                  FirebaseAuth.instance.currentUser!.emailVerified)
              ? Tasks()
              : Start(),
      routes: {
        'tasks': (context) => Tasks(),
        'home': (context) => Homepage(),
        'signup': (context) => Signup(),
        'login': (context) => Login(),
        'features': (context) => Features(),
        'authpage': (context) => AuthPage(),
        'settings': (context) => Settings(),
        'addcategory': (context) => AddCategory(),
        'archive': (context) => Archive(),
      },
      theme: ThemeData(fontFamily: 'Ubuntu'),
    );
  }
}
