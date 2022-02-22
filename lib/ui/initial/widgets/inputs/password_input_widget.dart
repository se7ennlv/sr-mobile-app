import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sr/common/ui/forms/rounded_password_input_widget.dart';

class PasswordInputWidget extends StatefulWidget {
  @override
  _PasswordInputWidgetState createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  @override
  Widget build(BuildContext context) {
    return RoundedPasswordInputWidget(
      name: 'password',
      hintText: 'Password',
      prefixIcon: Icon(Icons.vpn_key_outlined, color: Colors.white),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          context,
          errorText: 'Please enter password',
        ),
        FormBuilderValidators.minLength(context, 6),
      ]),
    );
  }
}
