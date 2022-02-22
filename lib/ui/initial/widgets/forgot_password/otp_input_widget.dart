import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sr/common/ui/forms/rounded_input_widget.dart';

class OtpInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedInputWidget(
      name: 'otp',
      hintText: 'Enter OTP code',
      prefixIcon: Icon(Icons.confirmation_number, color: Colors.white),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          context,
          errorText: 'Please enter OTP code',
        ),
      ]),
    );
  }
}
