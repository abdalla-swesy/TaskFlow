import 'package:flutter/material.dart';

class TextForAuth extends StatefulWidget {
  final String hintText;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  TextForAuth({
    required this.hintText,
    required this.mycontroller,
    required this.validator,
  });

  @override
  State<TextForAuth> createState() => _TextForAuthState();
}

class _TextForAuthState extends State<TextForAuth> {
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.mycontroller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2.5),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2.5),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2.5),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.5),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
