import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 300,
              child: PageView(
                children: [
                  Image.asset("images/googleicon.png"),
                  Image.asset("images/facebookicon.png"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
