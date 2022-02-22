import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sr/common/ui/bottom_sheets/change_password/change_password_widget.dart';
import 'package:flutter_sr/common/ui/buttons/rounded_button.dart';
import 'package:flutter_sr/common/ui/snackbar.dart';
import 'package:flutter_sr/common/utils/global_variable.dart';
import 'package:flutter_sr/core/models/user_model.dart';
import 'package:flutter_sr/core/providers/auth_provider.dart';
import 'package:flutter_sr/ui/initial/widgets/inputs/username_input_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../base_view.dart';
import 'forgot_password/forgot_password_widget.dart';
import 'inputs/password_input_widget.dart';

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthProvider>(
      builder: (context, provider, child) {
        return Container(
          width: double.infinity,
          height: 155.0,
          child: FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: <Widget>[
                Column(
                  children: [
                    UsernameInputWidget(),
                    provider.busy
                        ? CircularProgressIndicator()
                        : _buildNextButton(provider),
                  ],
                ),
                Column(
                  children: [
                    PasswordInputWidget(),
                    provider.busy
                        ? CircularProgressIndicator()
                        : _buildLoginButton(provider),
                    ForgetPasswordWidget(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNextButton(provider) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 18.0),
      child: RoundedButton(
        vPadding: 14.0,
        text: "NEXT",
        onPressed: () async {
          _formKey.currentState.save();

          if (_formKey.currentState.validate()) {
            final formData = _formKey.currentState.value;
            final isValidUser = await provider.verifyUsername(formData);

            if (isValidUser) {
              GlobalVariable.username = formData['username'];

              _pageController.nextPage(
                duration: Duration(microseconds: 1000),
                curve: Curves.ease,
              );
            } else {
              dangerSnackBar('Sorry!', 'Invalid ID or not register yet.');
            }
          } else {
            return;
          }
        },
      ),
    );
  }

  Widget _buildLoginButton(provider) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: RoundedButton(
        vPadding: 14.0,
        text: "LOGIN",
        onPressed: () async {
          _formKey.currentState.save();

          if (_formKey.currentState.validate()) {
            final formData = _formKey.currentState.value;
            final authSuccess = await provider.authentication(formData);

            if (authSuccess) {
              final String isDefault =
                  Provider.of<UserModel>(context, listen: false)
                      .passwordUpdatedAt;

              Get.offAllNamed('/home');

              if (isDefault == null) {
                _showChangePassword(context);
              }
            } else {
              dangerSnackBar('Unauthorised', 'Incorrect password, try again');
            }
          } else {
            return;
          }
        },
      ),
    );
  }

  void _showChangePassword(context) {
    changePasswordWidget(context, false);
  }
}
