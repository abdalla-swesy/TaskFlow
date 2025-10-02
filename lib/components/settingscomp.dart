import 'package:flutter/material.dart';

class SettingsComp extends StatefulWidget {
  void Function() onPressed;
  IconData icon;
  String text;
  SettingsComp({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  State<SettingsComp> createState() => _SettingsCompState();
}

class _SettingsCompState extends State<SettingsComp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: InkWell(
          onTap: widget.onPressed,
          splashColor: Colors.white,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(widget.icon, color: Colors.deepPurple, size: 40),
              ),
              Text(
                widget.text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
