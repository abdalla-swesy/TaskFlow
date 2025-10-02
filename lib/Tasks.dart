import 'package:TaskFlow/Tasks/edit.dart';
import 'package:TaskFlow/components/categorychooce.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  IconData icondcheckbox = Icons.check_box_outline_blank;
  bool isLoading = true;
  bool checkboxstatus = false;
  late IconData icon;
  int isPressed = 0;
  void onPressed(value) {
    setState(() {
      isPressed = value;
    });
  }

  List<QueryDocumentSnapshot> data = [];
  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance
            .collection("Tasks")
            .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .where("archived", isEqualTo: false)
            .get();
    data.addAll(querySnapshot.docs);
    isLoading = false;

    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed(
                'login',
              ); // Replace with your login route name
            },
          ),
        ],
      ),

      body:
          isLoading == true
              ? Center(child: CircularProgressIndicator())
              : ListView(
                children: [
                  Row(
                    spacing: 100,
                    children: [
                      Container(margin: EdgeInsets.only(top: 15, left: 40)),
                      Center(
                        child: Text(
                          "Tasks",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 30,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('addcategory');
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              spacing: 5,
                              children: [
                                Icon(Icons.add, color: Colors.white),
                                Text(
                                  "Add Task",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  SizedBox(height: 20),
                  Row(
                    spacing: 100,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(Icons.checklist, size: 40),
                            Text(
                              " Your Tasks",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Sort By ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.sort, size: 40),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.white,
                    height: 450,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, i) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 30, bottom: 10),
                                margin: EdgeInsets.only(
                                  left: 10,
                                  top: 10,
                                  bottom: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text(
                                                " ${data[i]['title']}",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                    ),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      checkboxstatus =
                                                          !checkboxstatus;
                                                      icondcheckbox =
                                                          checkboxstatus
                                                              ? Icons
                                                                  .check_box_outlined
                                                              : Icons
                                                                  .check_box_outline_blank;
                                                    });
                                                  },
                                                  child: Icon(
                                                    icondcheckbox,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 0,
                                            right: 10,
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) => EditCategory(
                                                        docid: data[i].id,
                                                        oldname:
                                                            data[i]['title'],
                                                        olddate:
                                                            data[i]['date'],
                                                        oldpriority:
                                                            data[i]['priority'],
                                                      ),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              spacing: 5,
                                              children: [
                                                Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Icon(Icons.edit),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 5,
                                            vertical: 5,
                                          ),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Text(
                                            "inprogress",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                data[i]['priority'] == 'High'
                                                    ? Colors.red
                                                    : data[i]['priority'] ==
                                                        'Medium'
                                                    ? Colors.orange
                                                    : Colors.lightGreenAccent,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Text(
                                            data[i]['priority'].toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today_outlined,
                                            size: 30,
                                          ),
                                          Text(
                                            "${data[i]['date']}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            PopupMenuButton(
                              itemBuilder:
                                  (context) => [
                                    PopupMenuItem(
                                      onTap: () {
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.warning,
                                          animType: AnimType.rightSlide,
                                          title: 'Warning',
                                          desc: 'Are You Sure?',
                                          btnCancelOnPress: () {},
                                          btnOkOnPress: () async {
                                            await FirebaseFirestore.instance
                                                .collection("Tasks")
                                                .doc(data[i].id)
                                                .delete();
                                            Navigator.of(
                                              context,
                                            ).pushReplacementNamed('tasks');
                                          },
                                        )..show();
                                      },
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      value: 'delete',
                                    ),
                                  ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
    );
  }
}
