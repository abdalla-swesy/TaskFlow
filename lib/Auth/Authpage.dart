import 'package:TaskFlow/components/Materialbuttonauth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(height: 30),
          Image.asset("images/Auth.png"),
          Text(
            "TaskFlow",
            style: TextStyle(
              fontSize: 40,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w700,
              fontFamily: 'Galada',
            ),
            textAlign: TextAlign.center,
          ),
          Container(height: 150),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: MaterialButtonAuth(
              onPressed: () {
                Navigator.of(context).pushNamed('login');
              },
              title: "Login",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: MaterialButtonAuth(
              onPressed: () {
                Navigator.of(context).pushNamed('signup');
              },
              title: "Sign up",
            ),
          ),
        ],
      ),
    );
  }
}
