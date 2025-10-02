import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customCard extends StatelessWidget {
  int title;
  String subtitle;
  customCard({required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: Colors.deepPurpleAccent,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        title: Text(
          "$title",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
          "$subtitle",
          style: TextStyle(fontSize: 16, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
