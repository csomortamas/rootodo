import 'package:flutter/material.dart';

class RooTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;

  const RooTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.yellow,
      autocorrect: false,
      controller: controller,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 16,
      ),
      cursorWidth: 10,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow),
        ),
        border: const OutlineInputBorder(),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
    );
  }
}
