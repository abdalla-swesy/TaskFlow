import 'package:flutter/material.dart';

class CustomTextAuth extends StatelessWidget {
  final String text;
  CustomTextAuth({required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Divider(thickness: 2, color: Colors.deepPurpleAccent),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "or $text with",
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Divider(thickness: 2, color: Colors.deepPurpleAccent),
          ),
        ],
      ),
    );
  }
}
