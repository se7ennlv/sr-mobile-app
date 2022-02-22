import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_info.dart';

class FooterStackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image(
        image: AssetImage(AppInfo.BG_WELCOME),
        fit: BoxFit.cover,
      ),
    );
  }
}
