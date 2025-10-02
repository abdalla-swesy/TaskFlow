import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Archive extends StatefulWidget {
  @override
  _ArchiveState createState() => _ArchiveState();
}

class _ArchiveState extends State<Archive> {
  bool isLoading = true;
  List<QueryDocumentSnapshot> data = [];

  // Fetch only archived tasks
  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance
            .collection("Tasks")
            .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .where("archived", isEqualTo: true)
            .get();

    data = querySnapshot.docs;
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Archived Tasks"),
        backgroundColor: Colors.white,
      ),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : data.isEmpty
              ? Center(
                child: Text(
                  "No archived tasks.",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
              : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.deepPurple, width: 1),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.archive, color: Colors.deepPurple),
                      title: Text(
                        data[i]['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text("Due: ${data[i]['date']}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Unarchive Button
                          IconButton(
                            icon: Icon(Icons.unarchive),
                            tooltip: 'Unarchive',
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection("Tasks")
                                  .doc(data[i].id)
                                  .update({'archived': false});
                              setState(() {
                                data.removeAt(i);
                              });
                            },
                          ),
                          // Delete Button
                          IconButton(
                            icon: Icon(Icons.delete),
                            tooltip: 'Delete',
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection("Tasks")
                                  .doc(data[i].id)
                                  .delete();
                              setState(() {
                                data.removeAt(i);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
