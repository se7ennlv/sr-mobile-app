import 'package:flutter/cupertino.dart';

class ItemModel {
  final IconData leading;
  final String title;
  final String subtitle;
  final IconData trailing;

  ItemModel(
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
  );
}
