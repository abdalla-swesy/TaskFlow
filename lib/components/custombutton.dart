import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customButton extends StatefulWidget {
  void Function() onPressed;
  double size;
  IconData icon;
  customButton({
    required this.icon,
    required this.size,
    required this.onPressed,
  });

  @override
  State<customButton> createState() => _customButtonState();
}

class _customButtonState extends State<customButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.white,
      highlightColor: Colors.white,
      splashColor: Colors.white,
      onTap: widget.onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          color: Colors.grey[200],
        ),
        margin: EdgeInsets.only(left: 20),
        child: Icon(
          widget.icon,
          size: widget.size,
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}
