import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_info.dart';
import 'package:flutter_svg/svg.dart';

class LogoWidget extends StatelessWidget {
  final double width;

  LogoWidget({this.width = 170.0});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppInfo.LOGO_IMAGE,
      width: width,
      placeholderBuilder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(30.0),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
