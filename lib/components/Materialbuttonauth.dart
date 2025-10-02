import 'package:flutter/material.dart';

class MaterialButtonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const MaterialButtonAuth({Key? key,required this.onPressed, required this.title})
    : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 20),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        color: Colors.deepPurple,
        height: 60,
      ),
    );
  }
}
