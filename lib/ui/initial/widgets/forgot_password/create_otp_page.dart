import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sr/common/ui/buttons/rounded_button.dart';
import 'package:flutter_sr/common/ui/snackbar.dart';
import 'package:flutter_sr/core/providers/auth_provider.dart';
import 'package:flutter_sr/core/providers/single_value_provider.dart';
import 'email_inut_widget.dart';

class CreateOtpPage extends StatelessWidget {
  final PageController pageControl;
  final AuthProvider authProvider;
  final SingleValueProvider singleProvider;

  CreateOtpPage({this.pageControl, this.authProvider, this.singleProvider});

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          EmailInputWidget(),
          authProvider.busy ? CircularProgressIndicator() : _buildResetButton(),
        ],
      ),
    );
  }

  Widget _buildResetButton() {
    return RoundedButton(
      vPadding: 14.0,
      text: "RESET",
      onPressed: () async {
        _formKey.currentState.save();

        if (_formKey.currentState.validate()) {
          final formData = _formKey.currentState.value;
          final isValidEmail = await authProvider.verifyUsername(formData);

          if (isValidEmail) {
            final otpCode = await authProvider.getOtp();

            if (otpCode != null) {
              Map<String, dynamic> mailOptions = {
                'to': formData['email'],
                'subject': 'E-SR Vertification',
                'body': '$otpCode is your verification code.'
              };

              final isSent = await authProvider.sendMail(mailOptions);

              if (isSent) {
                singleProvider.currentValue = otpCode;
                successSnackBar('Sent', 'Please check your email', 'top');

                pageControl.nextPage(
                  duration: Duration(microseconds: 1000),
                  curve: Curves.ease,
                );
              } else {
                String msg = 'Something went wrong on mail sending.';
                dangerSnackBar('Error', msg);
              }
            } else {
              dangerSnackBar('Error', 'OTP generation failed.');
            }
          } else {
            final String msg = "The email doesn't match the one registered.";
            dangerSnackBar('Failed!', msg);
          }
        } else {
          return;
        }
      },
    );
  }
}
