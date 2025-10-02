import 'package:TaskFlow/components/Textforauth.dart';
import 'package:TaskFlow/components/pobbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  // final String oldname;
  // final String docid;
  // const EditProfile({
  //   required this.docid,
  //   required this.oldname,
  //   super.key,
  // });
  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController date = TextEditingController();
  WidgetStatesController prioritychoose = WidgetStatesController();
  CollectionReference Tasks = FirebaseFirestore.instance.collection('Tasks');
  bool isLoading = false;
  editCategory() async {
    if (formState.currentState!.validate()) {
      try {
        await Tasks.doc(
        ).update({"title": name.text, "date": date.text});
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil("tasks", (route) => false);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formState,
        child:
            isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView(
                  children: [
                    Row(
                      spacing: 100,
                      children: [
                        PobButton(),
                        Center(
                          child: Text(
                            "Profile",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 20,
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.deepPurple,
                              child: Image.asset("images/Ellipse1.png"),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.only(right: 30, bottom: 100),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              border: Border.all(color: Colors.black, width: 1),
                              color: Colors.grey[100],
                            ),
                            child: Icon(Icons.edit, size: 30),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Text(
                        "Full Name",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextForAuth(
                      hintText: 'Enter Name',
                      mycontroller: name,
                      validator: (val) {
                        if (val == "") {
                          return "Can't Be Empty";
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Text(
                        "phone Number",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextForAuth(
                      hintText: 'Enter Number',
                      mycontroller: description,
                      validator: (val) {},
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextForAuth(
                      hintText: 'Enter Email',
                      mycontroller: email,
                      validator: (val) {},
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Text(
                        "Date of birth",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextForAuth(
                      hintText: 'Enter Date of birth',
                      mycontroller: description,
                      validator: (val) {},
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical: 30,
                      ),
                      child: MaterialButton(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        onPressed: () {
                          if (formState.currentState!.validate()) {
                            editCategory();
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Update Profile",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
