import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final double horizontalPadding;

  const MyTextField({super.key, required this.obscureText, required this.hintText, required this.controller, this.focusNode, this.horizontalPadding = 30,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        obscureText: obscureText,

        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}