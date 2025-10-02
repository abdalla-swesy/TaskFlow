import 'package:TaskFlow/components/Textforauth.dart';
import 'package:TaskFlow/components/pobbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditCategory extends StatefulWidget {
  final String oldname;
  final String docid;
  final String olddate;
  final String oldpriority;
  const EditCategory({
    required this.docid,
    required this.oldname,
    super.key,
    required this.olddate,
    required this.oldpriority,
  });
  @override
  EditCategoryState createState() => EditCategoryState();
}

class EditCategoryState extends State<EditCategory> {
  String selectedPriority = 'High';
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();
  WidgetStatesController prioritychoose = WidgetStatesController();
  CollectionReference Tasks = FirebaseFirestore.instance.collection('Tasks');
  bool isLoading = false;
  editCategory() async {
    if (formState.currentState!.validate()) {
      try {
        await Tasks.doc(widget.docid).update({
          "title": name.text,
          "date": date.text,
          'priority': selectedPriority,
        });
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
    name.text = widget.oldname;
    date.text = widget.olddate;
    selectedPriority = widget.oldpriority;
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
                            "Save",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 40,
                            ),
                            onPressed: () {
                              if (formState.currentState!.validate()) {
                                editCategory();
                              }
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              "Save",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Text(
                        "Title",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextForAuth(
                      hintText: 'Enter Title',
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
                        "Description",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextForAuth(
                      hintText: 'Enter Title',
                      mycontroller: description,
                      validator: (val) {},
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calendar_month, size: 30),
                                    Text(
                                      "Date",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2100),
                                    );

                                    if (pickedDate != null) {
                                      String formattedDate = DateFormat(
                                        'yyyy-MM-dd',
                                      ).format(pickedDate);
                                      setState(() {
                                        date.text = formattedDate;
                                      });
                                    }
                                  },
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      controller: date,
                                      decoration: InputDecoration(
                                        hintText: 'Select Date',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 2),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 2),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 40),
                          //   child: TextFormField(
                          //     controller: date,
                          //     decoration: InputDecoration(
                          //       enabledBorder: OutlineInputBorder(
                          //         borderSide: BorderSide(width: 2),
                          //         borderRadius: BorderRadius.circular(10),
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //         borderSide: BorderSide(width: 2),
                          //         borderRadius: BorderRadius.circular(10),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: Row(
                            spacing: 5,
                            children: [
                              Image.asset(
                                "images/arrowpriority.png",
                                width: 30,
                              ),
                              Text(
                                "Priority",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          spacing: 20,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              ['High', 'Medium', 'Low'].map((priority) {
                                bool isSelected = selectedPriority == priority;
                                return ChoiceChip(
                                  label: Text(priority),
                                  selected: selectedPriority == priority,
                                  selectedColor:
                                      priority == 'High'
                                          ? Colors.red
                                          : priority == 'Medium'
                                          ? Colors.orange
                                          : Colors.lightGreenAccent,
                                  onSelected: (selected) {
                                    setState(() {
                                      selectedPriority = priority;
                                    });
                                  },
                                );
                              }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
      ),
    );
  }
}
