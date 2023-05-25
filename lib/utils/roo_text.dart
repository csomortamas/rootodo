import 'package:flutter/material.dart';

class RooText extends StatelessWidget {
  const RooText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(2, 5, 5, 5),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
        ),
      ),
    );
  }
}
