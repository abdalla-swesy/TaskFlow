import 'package:TaskFlow/components/pobbutton.dart';
import 'package:TaskFlow/components/settingscomp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  IconData icons = Icons.keyboard_arrow_left_sharp;
  String? selectedLanguage;
  bool showLanguages = true;
  IconData icon = Icons.wb_sunny_sharp;
  int iconselected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Row(
            children: [
              PobButton(),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 10),
                child: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SettingsComp(
            icon: icon,
            text: "Change Theme",
            onPressed: () {
              setState(() {
                if (icon == Icons.wb_sunny_sharp) {
                  icon = Icons.nightlight_round;
                } else {
                  icon = Icons.wb_sunny_sharp;
                }
              });
            },
          ),
          SettingsComp(
            icon: Icons.backup_outlined,
            text: "Backup",
            onPressed: () {},
          ),
          SettingsComp(
            icon: Icons.play_for_work_rounded,
            text: "Import",
            onPressed: () {},
          ),
          SettingsComp(
            icon: Icons.upload_file_outlined,
            text: "Export",
            onPressed: () {},
          ),
          Row(
            children: [
              SettingsComp(
                icon: Icons.language,
                text: "Languages",
                onPressed: () {},
              ),
              InkWell(
                child: Icon(icons, size: 30),
                onTap: () {
                  setState(() {
                    showLanguages = !showLanguages;
                    icons =
                        showLanguages
                            ? Icons.keyboard_arrow_down_outlined
                            : Icons.keyboard_arrow_left_sharp;
                  });
                },
              ),
            ],
          ),
          if (showLanguages)
            Column(
              children: [
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: RadioListTile<String>(
                    title: Text(
                      "Arabic",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: "Arabic",
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: RadioListTile<String>(
                    title: Text(
                      "English",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: "English",
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          SettingsComp(
            icon: Icons.feedback_outlined,
            text: "Feed Back",
            onPressed: () {},
          ),
          SettingsComp(
            icon: Icons.password,
            text: "Change Password",
            onPressed: () {},
          ),
          SettingsComp(
            icon: Icons.logout_rounded,
            text: "Logout",
            onPressed: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              await FirebaseAuth.instance.signOut();
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil('login', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
