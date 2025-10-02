import 'package:TaskFlow/components/Textforpassauth.dart';
import 'package:TaskFlow/components/pobbuttonauth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:TaskFlow/components/Materialbuttonauth.dart';
import 'package:TaskFlow/components/Textforauth.dart';
import 'package:TaskFlow/components/buttonsiconsauth.dart';
import 'package:TaskFlow/components/customtext.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Form(
            key: formkey,
            child: Column(
              children: [
                PobButtonAuth(),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Text(
                        "Hello! Register to get started",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                TextForAuth(
                  hintText: "Username",
                  mycontroller: username,
                  validator: (val) {
                    if (val == "") {
                      return "Please Enter Your Username";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextForAuth(
                  hintText: "Email",
                  mycontroller: email,
                  validator: (val) {
                    if (val == "") {
                      return "Please Enter Your Email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextForPassAuth(
                  hintText: "Password",
                  mycontroller: password,
                  validator: (val) {
                    if (val == "") {
                      return "Please Enter Your Password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Container(
                  width: 600,
                  child: MaterialButtonAuth(
                    title: "Register",
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                email: email.text.trim(),
                                password: password.text,
                              );

                          // Save user info to Firestore
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(credential.user!.uid)
                              .set({
                                'username': username.text.trim(),
                                'email': email.text.trim(),
                              });

                          Navigator.of(context).pushReplacementNamed("login");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc: 'The password provided is too weak.',
                            ).show();
                          } else if (e.code == 'email-already-in-use') {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc:
                                  'The account already exists for that email.',
                            ).show();
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                  ),
                ),
                CustomTextAuth(text: "Register"),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonsIcon(image: "googleicon.png", onPressed: () {}),
                      ButtonsIcon(image: "facebookicon.png", onPressed: () {}),
                      ButtonsIcon(image: "appleicon.png", onPressed: () {}),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('login');
                      },
                      child: Text(
                        "Login Now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
