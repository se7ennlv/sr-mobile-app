import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';
import 'package:get/get.dart';

void primarySnackBar(String title, String message, String _position) {
  var position = SnackPosition.TOP;

  if (_position == 'bottom') {
    position = SnackPosition.BOTTOM;
  }

  Get.snackbar(
    title,
    message,
    duration: Duration(seconds: 4),
    animationDuration: Duration(milliseconds: 800),
    backgroundColor: Colors.blueAccent,
    borderRadius: 4.0,
    snackPosition: position,
  );
}

void successSnackBar(String title, String message, String _position) {
  var position = SnackPosition.TOP;

  if (_position == 'bottom') {
    position = SnackPosition.BOTTOM;
  }

  Get.snackbar(
    title,
    message,
    duration: Duration(seconds: 4),
    animationDuration: Duration(milliseconds: 800),
    backgroundColor: Colors.lightGreen[700],
    colorText: Colors.white,
    borderRadius: 0,
    snackPosition: position,
    margin: EdgeInsets.all(0),
  );
}

void infoSnackBar(String title, String message, String _position) {
  var position = SnackPosition.TOP;

  if (_position == 'bottom') {
    position = SnackPosition.BOTTOM;
  }

  Get.snackbar(
    title,
    message,
    duration: Duration(seconds: 4),
    animationDuration: Duration(milliseconds: 800),
    backgroundColor: Colors.black54,
    barBlur: 0,
    colorText: Colors.white,
    borderRadius: 0,
    snackPosition: position,
    margin: EdgeInsets.all(0),
  );
}

void warningSnackBar(String title, String message, String _position) {
  var position = SnackPosition.TOP;

  if (_position == 'bottom') {
    position = SnackPosition.BOTTOM;
  }

  Get.snackbar(
    title,
    message,
    duration: Duration(seconds: 4),
    animationDuration: Duration(milliseconds: 800),
    backgroundColor: Colors.amber[800],
    colorText: Colors.white,
    borderRadius: 0,
    snackPosition: position,
    margin: EdgeInsets.all(0),
  );
}

void dangerSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    duration: Duration(seconds: 4),
    animationDuration: Duration(milliseconds: 800),
    backgroundColor: Colors.red,
    borderRadius: 0,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.all(0),
  );
}
