import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sr/common/ui/snackbar.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:flutter_sr/core/providers/boolean_provider.dart';
import 'package:flutter_sr/core/providers/user_provider.dart';
import 'package:flutter_sr/ui/base_view.dart';
import 'package:provider/provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

Future<dynamic> checkpointDialog(BuildContext context) async {
  var checkpointResult = await Get.defaultDialog(
    title: "First verify it's you",
    content: BaseView<BooleanProvider>(
      builder: (context, provider, child) {
        return FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderTextField(
              name: 'password',
              obscureText: !provider.currentValue,
              decoration: InputDecoration(
                labelText: 'Current password',
                errorMaxLines: 1,
                suffixIcon: InkWell(
                  onTap: () {
                    provider.currentValue = !provider.currentValue;
                  },
                  child: Icon(
                    provider.currentValue
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  context,
                  errorText: 'Please enter password',
                ),
              ]),
            ),
          ),
        );
      },
    ),
    radius: 4.0,
    cancel: _buildCancelButton(),
    confirm: _buildConfirmButton(context),
  );

  return checkpointResult;
}

Widget _buildCancelButton() {
  return TextButton(
    onPressed: () {
      Get.back(result: false);
    },
    child: Text(
      'CANCEL',
      style: TextStyle(color: AppColors.ACCENT_COLOR),
    ),
  );
}

Widget _buildConfirmButton(context) {
  final provider = Provider.of<UserProvider>(context, listen: false);

  return TextButton(
    onPressed: () async {
      _formKey.currentState.save();

      if (_formKey.currentState.validate()) {
        final formData = _formKey.currentState.value;
        final result = await provider.checkpoint(formData);
        final _password = formData['password'];

        if (result) {
          Get.back(result: _password);
        } else {
          Get.back(result: false);
          dangerSnackBar('Unauthorised', 'Incorrect password, try again');
        }
      }
    },
    child: Text(
      'NEXT',
      style: TextStyle(color: AppColors.ACCENT_COLOR),
    ),
  );
}
