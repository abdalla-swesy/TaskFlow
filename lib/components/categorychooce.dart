import 'package:flutter/material.dart';

class CategoryChoose extends StatefulWidget {
  Color color;
  String title;
  CategoryChoose({
    Key? key,
    required this.color,
    required this.title,
  }) : super(key: key);
  @override
  _CategoryChooseState createState() => _CategoryChooseState();
}

class _CategoryChooseState extends State<CategoryChoose> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        
      },
      color: widget.color,
      child: Row(
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
