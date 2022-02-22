import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/forms/rounded_password_input_widget.dart';

class ConfirmInputWidget extends StatelessWidget {
  final formKey;

  ConfirmInputWidget(this.formKey);

  @override
  Widget build(BuildContext context) {
    return RoundedPasswordInputWidget(
      name: 'confirmNewPassword',
      hintText: 'Re-type new password',
      prefixIcon: Icon(Icons.vpn_key_outlined, color: Colors.white),
      validator: (val) {
        if (formKey.currentState.fields['newPassword']?.value != val) {
          return "The new password doesn't not matching";
        }
        return null;
      },
    );
  }
}
