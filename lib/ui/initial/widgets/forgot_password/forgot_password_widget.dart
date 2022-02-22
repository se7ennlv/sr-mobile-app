import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'bottom_sheet_widget.dart';

class ForgetPasswordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            bottomSheetWidget(context);
          },
          child: Text(
            'Forget password?',
            style: TextStyle(color: AppColors.ACCENT_COLOR),
          ),
        )
      ],
    );
  }
}
