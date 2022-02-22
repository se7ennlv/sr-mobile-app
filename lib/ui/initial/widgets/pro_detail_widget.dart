import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/pro_vertical_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class ProDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ProVerticalWidget(),
          ),
          _closeButton(),
        ],
      ),
    );
  }

  Widget _closeButton() {
    return Positioned(
      right: 8.0,
      top: 24.0,
      child: InkWell(
        onTap: () {
          Get.back(result: false);
        },
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: 38.0,
        ),
      ),
    );
  }
}
