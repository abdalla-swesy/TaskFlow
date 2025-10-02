import 'package:flutter/material.dart';

class FeaturesSentence extends StatelessWidget {
  final String text;
  FeaturesSentence({required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 33, 54, 243),
              borderRadius: BorderRadius.circular(2000),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "$text",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
