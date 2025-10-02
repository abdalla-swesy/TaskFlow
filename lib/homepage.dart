import 'dart:io';

import 'package:TaskFlow/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:TaskFlow/components/customcard.dart';
import 'package:TaskFlow/components/custombutton.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  IconData icon = Icons.notifications_active_rounded;
  bool isTapped = true;
  List<QueryDocumentSnapshot> data = [];
  bool isLoading = true;
  int isPressed = 2;
  void onPressed(value) {
    setState(() {
      isPressed = value;
    });
  }

  File? imageFile;

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: isPressed,
        onTap: onPressed,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedIconTheme: IconThemeData(color: Colors.white, size: 40),
        unselectedIconTheme: IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 219, 199, 252),
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).pushReplacementNamed('tasks');
                });
              },
              child: Icon(Icons.task_outlined),
            ),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).pushReplacementNamed('calendar');
                });
              },
              child: Icon(Icons.calendar_today_outlined),
            ),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(Icons.home),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).pushReplacementNamed('teams');
                });
              },
              child: Icon(Icons.groups_rounded),
            ),
            label: "Teams",
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).pushReplacementNamed('aitool');
                });
              },
              child: Icon(Icons.auto_awesome),
            ),
            label: "AI Tool",
          ),
        ],
      ),
      body: ListView(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (route) => EditProfile()));
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      child: GestureDetector(
                        onTap: pickImage,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              imageFile != null
                                  ? FileImage(imageFile!)
                                  : AssetImage('images/Ellipse1.png')
                                      as ImageProvider,
                        ),
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Abdalla Mohamed",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Computer Science Student",
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              customButton(
                icon: Icons.settings_outlined,
                size: 40,
                onPressed: () {
                  Navigator.of(context).pushNamed('settings');
                },
              ),
              customButton(
                icon: icon,
                size: 25,
                onPressed: () {
                  setState(() {
                    isTapped = !isTapped;
                    icon =
                        isTapped
                            ? Icons.notifications_active_rounded
                            : Icons.notifications_off_outlined;
                  });
                },
              ),
            ],
          ),

          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 40, bottom: 15),
            child: Text(
              "Project Summary",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child: customCard(title: 10, subtitle: "Completed")),
                Expanded(child: customCard(title: 3, subtitle: "in progress")),
                Expanded(child: customCard(title: 4, subtitle: "Pending")),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2000),
                      child: Image.asset("images/chart.png", fit: BoxFit.fill),
                    ),
                  ),
                  Column(
                    spacing: 25,
                    children: [
                      Text("Pending"),
                      Text("in progress"),
                      Text("completed"),
                    ],
                  ),
                ],
              ),
              Container(
                height: 300,
                width: 300,
                child: Image.asset("images/analysis.png", fit: BoxFit.fill),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
