import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/buttons/circle_button.dart';
import 'package:flutter_sr/common/ui/snackbar.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class CircleButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSupportButton(),
        _buildFeedsButton(),
        _buildTermsButton(),
      ],
    );
  }

  Widget _buildSupportButton() {
    return Column(
      children: [
        CircleButton(
          icon: Icons.support_agent_outlined,
          onPressed: () {
            infoSnackBar(
              'Thanks for tapped',
              'You will be able to contact with developer team soon.',
              'top',
            );
          },
        ),
        Text('Support'),
      ],
    );
  }

  Widget _buildFeedsButton() {
    return Column(
      children: [
        CircleButton(
          icon: Icons.description_outlined,
          onPressed: () {
            Get.toNamed('/feed');
          },
        ),
        Text('SR Feeds'),
      ],
    );
  }

  Widget _buildTermsButton() {
    return Column(
      children: [
        CircleButton(
          icon: Icons.receipt_long,
          onPressed: () {
            Get.toNamed('/term');
          },
        ),
        Text('Terms'),
      ],
    );
  }
}
