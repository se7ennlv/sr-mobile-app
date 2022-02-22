import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  CircleButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.black54,
      shape: CircleBorder(),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(
          icon,
          color: Colors.white,
          size: 28.0,
        ),
      ),
    );
  }
}
