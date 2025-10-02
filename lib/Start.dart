import 'package:flutter/material.dart';
import 'package:TaskFlow/components/Materialbuttonstart.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Image.asset("images/taskappphoto.png", fit: BoxFit.fill),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Manage ",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "your",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "task and ",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                  ),
                  Image.asset("images/ideasphoto.png", height: 60, width: 110),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "quickly",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                  ),
                  Image.asset("images/Lamp.png", height: 90),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: MaterialButtonStart(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('features');
              },
              title: "Let's Started     ",
              icon: Icons.arrow_forward,
            ),
          ),
        ],
      ),
    );
  }
}
