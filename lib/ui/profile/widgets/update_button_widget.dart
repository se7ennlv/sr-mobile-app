import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/snackbar.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:flutter_sr/core/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UpdateButtonWidget extends StatelessWidget {
  final formKey;

  UpdateButtonWidget({this.formKey});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    return Container(
      width: double.infinity,
      child: SizedBox(
        height: 44.0,
        child: ElevatedButton(
          onPressed: () async {
            formKey.currentState.save();

            if (formKey.currentState.validate()) {
              var formData = formKey.currentState.value;
              var result = await provider.updateContact(formData);

              if (result) {
                successSnackBar('Success', 'Contact has been updated', 'top');
              } else {
                dangerSnackBar('Error', 'Something went wrong!');
              }
            }
          },
          child: Text('UPDATE'),
          style: ElevatedButton.styleFrom(
            primary: AppColors.PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}
