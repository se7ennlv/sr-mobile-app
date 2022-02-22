import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:flutter_sr/config/app_info.dart';
import 'package:flutter_sr/config/app_utils.dart';

class AppBarWidget extends StatelessWidget {
  final bool centerTitle;
  final String title;

  AppBarWidget({
    this.centerTitle = true,
    this.title = AppInfo.APP_NAME,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: Text(title),
      backgroundColor: AppColors.PRIMARY_COLOR,
      brightness: Brightness.dark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppUtils.APPBAR_BOTTOM_RADIUS),
        ),
      ),
    );
  }
}
