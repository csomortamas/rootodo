import 'package:flutter/material.dart';

class RooButton extends StatelessWidget {
  const RooButton({super.key, required this.title, required this.onPressed, required this.color});

  final String title;
  final VoidCallback onPressed;
  final color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        elevation: 0,
        child: Text(title),
      ),
    );
  }
}
