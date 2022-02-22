import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sr/common/ui/forms/rounded_input_widget.dart';

class EmailInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedInputWidget(
      name: 'email',
      hintText: 'Enter registered email',
      prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          context,
          errorText: 'Please enter registered email',
        ),
        FormBuilderValidators.email(context),
      ]),
    );
  }
}
