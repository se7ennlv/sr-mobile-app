import 'package:flutter/material.dart';
import '../pro_horizontal_widget.dart';

class BottomStackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible() {
      return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
    }

    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              !isKeyboardVisible() ? ProHorizontalWidget() : SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
