import 'package:flutter/material.dart';

class Attachments extends StatefulWidget {
  void Function() onPressed;
  String text;
  IconData icon;
  Attachments({super.key, required this.icon, required this.text,required this.onPressed});
  @override
  _Attachments createState() => _Attachments();
}

class _Attachments extends State<Attachments> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPressed;
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 206, 155),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(widget.icon,size: 30,),
            Text(widget.text, style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
