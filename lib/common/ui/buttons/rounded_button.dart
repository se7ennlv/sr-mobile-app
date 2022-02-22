import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_color.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color bgColor, fgColor;
  final double vPadding;

  const RoundedButton({
    this.text,
    this.onPressed,
    this.bgColor = AppColors.PRIMARY_COLOR,
    this.fgColor = Colors.white,
    this.vPadding = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: bgColor,
          onPrimary: fgColor,
          padding: EdgeInsets.symmetric(vertical: vPadding),
        ),
        child: Text(text),
        onPressed: onPressed,
      ),
    );
  }
}
