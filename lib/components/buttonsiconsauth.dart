import 'package:flutter/material.dart';

class ButtonsIcon extends StatelessWidget {
  final void Function()? onPressed;
  final String image;
  const ButtonsIcon({Key? key, this.onPressed, required this.image})
    : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Image.asset("images/$image", height: 60, width: 70),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.lightBlueAccent),
      ),
    );
  }
}
