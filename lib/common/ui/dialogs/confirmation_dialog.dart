import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

Future<dynamic> confirmDialog(String message) async {
  var dialogResult = await Get.defaultDialog(
    title: 'Confirmation',
    content: Text('$message'),
    radius: 4.0,
    cancel: _buildCancelButton(),
    confirm: _buildConfirmButton(),
  );

  return dialogResult;
}

Widget _buildCancelButton() {
  return TextButton(
    onPressed: () => Get.back(result: false),
    child: Text(
      'CANCEL',
      style: TextStyle(color: AppColors.ACCENT_COLOR),
    ),
  );
}

Widget _buildConfirmButton() {
  return TextButton(
    onPressed: () => Get.back(result: true),
    child: Text(
      'YES',
      style: TextStyle(color: AppColors.ACCENT_COLOR),
    ),
  );
}
