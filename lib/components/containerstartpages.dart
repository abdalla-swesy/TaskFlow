import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainerStartPages extends StatelessWidget {
  Color color;
  ContainerStartPages({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 15,
      width: 15,
    );
  }
}
