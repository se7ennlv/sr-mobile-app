import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'form_input_widget.dart';

Future<dynamic> changePasswordWidget(
    BuildContext context, bool dismissible) async {
  Get.bottomSheet(
    Container(
      height: 225.0,
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 25.0),
          FormInputWidget(),
        ],
      ),
    ),
    isDismissible: dismissible,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30.0),
      ),
    ),
  );
}
