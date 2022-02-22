import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/logo_widget.dart';
import '../auth_widget.dart';
import '../circle_button_widget.dart';
import '../heading_widget.dart';

class MidleStackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible() {
      return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
    }

    return Positioned.fill(
      top: 24.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                LogoWidget(width: !isKeyboardVisible() ? 138.0 : 90.0),
                SizedBox(height: 25.0),
                HeadingWidget(),
                AuthWidget(),
                !isKeyboardVisible() ? CircleButtonWidget() : SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
