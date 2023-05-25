import 'package:flutter/material.dart';
import 'package:rootodo/utils/roo_text.dart';
import 'package:rootodo/utils/roo_textfield.dart';
import 'roo_button.dart';

class TileDialog extends StatelessWidget {
  const TileDialog({
    super.key,
    required this.controllerTitle,
    required this.controllerDeadline,
    required this.controllerDuration,
    required this.onLeftButtonClick,
    required this.onRightButtonClick,
    required this.leftButtonTitle,
    required this.rightButtonTitle,
  });

  final TextEditingController controllerTitle;
  final TextEditingController controllerDeadline;
  final TextEditingController controllerDuration;

  final VoidCallback onLeftButtonClick;
  final VoidCallback onRightButtonClick;

  final String leftButtonTitle;
  final String rightButtonTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey.shade900,
      elevation: 0,
      content: SizedBox(
        width: double.maxFinite,
        height: 330,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const RooText(text: "title"),
            RooTextField(
              controller: controllerTitle,
              hintText: null,
            ),
            const SizedBox(width: 10, height: 10),
            const RooText(text: "deadline"),
            RooTextField(
              controller: controllerDeadline,
              hintText: "yyyy-mm-dd hh:mm",
            ),
            const SizedBox(width: 10, height: 10),
            const RooText(text: "duration"),
            RooTextField(
              controller: controllerDuration,
              hintText: "hh:mm",
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RooButton(
                  title: leftButtonTitle,
                  onPressed: onLeftButtonClick,
                  color: Colors.blueGrey[700],
                ),
                const SizedBox(
                  width: 10,
                ),
                RooButton(
                  title: rightButtonTitle,
                  onPressed: onRightButtonClick,
                  color: Colors.blueGrey[500],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
