import 'package:flutter/material.dart';

class MaterialButtonStart extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final IconData icon;
  const MaterialButtonStart({
    Key? key,
    this.onPressed,
    required this.title,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Icon(icon, color: Colors.white, size: 30),
        ],
      ),
      color: Colors.deepPurple,
      height: 60,
    );
  }
}
