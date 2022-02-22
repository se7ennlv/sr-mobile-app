import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_color.dart';

class DrawerItemModel extends StatelessWidget {
  final double visualDensity;
  final IconData icon;
  final String title;
  final dynamic trailing;
  final GestureTapCallback onTap;

  DrawerItemModel({
    this.visualDensity = -3,
    this.icon,
    this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(vertical: visualDensity),
      leading: Icon(icon, color: AppColors.ICON_PRIMARY_COLOR),
      title: Text(title),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
