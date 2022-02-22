import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sr/common/ui/buttons/rounded_button.dart';
import 'package:flutter_sr/common/ui/snackbar.dart';
import 'package:flutter_sr/common/utils/global_variable.dart';
import 'package:flutter_sr/ui/base_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_sr/core/providers/user_provider.dart';
import 'package:get/get.dart';

import 'confirm_inut_widget.dart';
import 'new_inut_widget.dart';

class FormInputWidget extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<UserProvider>(
      builder: (context, provider, child) {
        return FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              _buildUsernameInput(),
              NewInputWidget(),
              ConfirmInputWidget(_formKey),
              _buildSavePasswordButton(context, provider),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUsernameInput() {
    final username = GlobalVariable.username;

    return Visibility(
      visible: false,
      maintainState: true,
      child: FormBuilderTextField(
        initialValue: username,
        name: 'username',
      ),
    );
  }

  Widget _buildSavePasswordButton(context, provider) {
    return RoundedButton(
      vPadding: 14.0,
      text: "SAVE PASSWORD",
      onPressed: () async {
        _formKey.currentState.save();

        if (_formKey.currentState.validate()) {
          final formData = _formKey.currentState.value;
          final result = await provider.updatePassword(formData);

          if (result) {
            Get.back(result: false);
            successSnackBar('Success', 'The password has been saved.', 'top');
          } else {
            Get.back(result: false);
            dangerSnackBar('Error', 'Something went wrong.');
          }
        } else {
          return;
        }
      },
    );
  }
}
