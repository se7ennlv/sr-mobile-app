import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

void showLogoutDialog() {
  Get.defaultDialog(
    title: "CONFIRM",
    content: Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Would you like to logout ?"),
            SizedBox(height: 25.0),
            SizedBox(
              width: double.infinity,
              child: _buildLogoutButton(),
            ),
            SizedBox(
              width: double.infinity,
              child: _buildCancelButton(),
            ),
          ],
        ),
      ),
    ),
    radius: 15.0,
  );
}

Widget _buildLogoutButton() {
  return ElevatedButton(
    child: Text("LOGOUT"),
    onPressed: () => exit(0),
    style: ElevatedButton.styleFrom(
      primary: AppColors.PRIMARY_COLOR,
      onPrimary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );
}

Widget _buildCancelButton() {
  return OutlinedButton(
    child: Text('CANCEL'),
    onPressed: () => Get.back(result: false),
    style: ElevatedButton.styleFrom(
      side: BorderSide(width: 1.0, color: Colors.blue),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0), //the
      ),
    ),
  );
}
