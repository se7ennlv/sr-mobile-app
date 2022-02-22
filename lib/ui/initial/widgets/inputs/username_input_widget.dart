import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sr/common/ui/forms/rounded_input_widget.dart';

class UsernameInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedInputWidget(
      name: 'username',
      keyboardType: TextInputType.number,
      hintText: 'Employee ID',
      prefixIcon: Icon(Icons.person, color: Colors.white),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          context,
          errorText: 'Please enter correct employee ID',
        ),
        FormBuilderValidators.numeric(context),
        FormBuilderValidators.maxLength(context, 6),
      ]),
    );
  }
}
