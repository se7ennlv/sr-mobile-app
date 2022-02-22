import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sr/common/ui/bottom_sheets/change_password/change_password_widget.dart';
import 'package:flutter_sr/common/ui/buttons/rounded_button.dart';
import 'package:flutter_sr/common/ui/snackbar.dart';
import 'package:flutter_sr/core/providers/single_value_provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'otp_input_widget.dart';
import 'package:get/get.dart';

class VerifyOtpPage extends StatelessWidget {
  final PageController pageControl;
  final SingleValueProvider singleProvider;

  VerifyOtpPage({this.pageControl, this.singleProvider});

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          OtpInputWidget(),
          _buildVerifyButton(context),
        ],
      ),
    );
  }

  Widget _buildVerifyButton(context) {
    return RoundedButton(
      vPadding: 14.0,
      text: "VERIFY",
      onPressed: () async {
        _formKey.currentState.save();

        if (_formKey.currentState.validate()) {
          final formData = _formKey.currentState.value;
          final sysOtp = singleProvider.currentValue;
          final enteredOtp = formData['otp'];

          if (enteredOtp == sysOtp) {
            Get.back(result: false);
            changePasswordWidget(context, true);
          } else {
            dangerSnackBar('Failed!', "You have entered invalid OTP.");
          }
        } else {
          return;
        }
      },
    );
  }
}
