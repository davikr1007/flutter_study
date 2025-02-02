import 'package:flutter/material.dart';
import 'action_button.dart';
import 'settings.dart';

class UserInput extends StatelessWidget {
  
  final Function onActionButtonPressed;
  const UserInput(this.onActionButtonPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: <Widget>[
            ActionButton(
              onActionButtonPressed,
              Icon(Icons.rotate_left),
              LastButtonPressed.rotateLeft,
            ),
            ActionButton(
              onActionButtonPressed,
              Icon(Icons.rotate_right),
              LastButtonPressed.rotateRight,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            ActionButton(
              onActionButtonPressed,
              Icon(Icons.arrow_left),
              LastButtonPressed.left,
            ),
            ActionButton(
              onActionButtonPressed,
              Icon(Icons.arrow_right),
              LastButtonPressed.right,
            ),
          ],
        ),
      ],
    );
  }
}
