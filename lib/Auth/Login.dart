import 'package:TaskFlow/components/Textforpassauth.dart';
import 'package:TaskFlow/components/pobbuttonauth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:TaskFlow/components/Textforauth.dart';
import 'package:TaskFlow/components/Materialbuttonauth.dart';
import 'package:TaskFlow/components/buttonsiconsauth.dart';
import 'package:TaskFlow/components/customtext.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> signInWithGoogle() async {
    setState(() {
      isLoading = true;
    });

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        setState(() {
          isLoading = false;
        });
        return;
      }

      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      setState(() {
        isLoading = false;
      });

      Navigator.of(context).pushNamedAndRemoveUntil('tasks', (route) => false);
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: 'Google sign-in failed. Please try again.',
      )..show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView(
                children: [
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        PobButtonAuth(),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "Welcome back! Glad to see you, Again!",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextForAuth(
                          hintText: "Enter Your Email",
                          mycontroller: email,
                          validator: (val) {
                            if (val == "") return "Please Enter Your Email";
                            return null;
                          },
                        ),
                        SizedBox(height: 40),
                        TextForPassAuth(
                          hintText: "Enter Your Password",
                          mycontroller: password,
                          validator: (val) {
                            if (val == "") return "Please Enter Your Password";
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () async {
                            if (email.text == "") {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'Please Enter Your Email And Try Again',
                              )..show();
                              return;
                            }
                            try {
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(email: email.text);
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.success,
                                animType: AnimType.rightSlide,
                                title: 'Success',
                                desc: 'Password Reset Link Was Sent',
                              )..show();
                            } catch (e) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'No user found for that email.',
                              )..show();
                            }
                          },
                          child: Container(
                            width: 600,
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "Forgot Password?",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 600,
                          child: MaterialButtonAuth(
                            title: "Login",
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                try {
                                  setState(() => isLoading = true);
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                        email: email.text,
                                        password: password.text,
                                      );
                                  setState(() => isLoading = false);
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    'tasks',
                                    (route) => false,
                                  );
                                } on FirebaseAuthException catch (e) {
                                  setState(() => isLoading = false);
                                  if (e.code == 'user-not-found') {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'Error',
                                      desc: 'No user found for that email.',
                                    )..show();
                                  } else if (e.code == 'wrong-password') {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'Error',
                                      desc:
                                          'Wrong password provided for that user.',
                                    )..show();
                                  }
                                }
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        CustomTextAuth(text: "Login"),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ButtonsIcon(
                                image: "googleicon.png",
                                onPressed: () {
                                  signInWithGoogle();
                                },
                              ),
                              ButtonsIcon(
                                image: "facebookicon.png",
                                onPressed: () {},
                              ),
                              ButtonsIcon(
                                image: "appleicon.png",
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have an account? ",
                              style: TextStyle(fontSize: 16),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(
                                  context,
                                ).pushReplacementNamed('signup');
                              },
                              child: Text(
                                "Register Now",
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
