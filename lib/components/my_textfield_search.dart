import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final Widget? suffixIcon;

  const SearchTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
