import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sr/core/models/user_model.dart';
import 'package:flutter_sr/core/providers/boolean_provider.dart';
import 'package:flutter_sr/ui/profile/widgets/contact_function.dart';
import 'package:provider/provider.dart';
import '../../base_view.dart';

class PhoneInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final phoneNumber = Provider.of<UserModel>(context).tel;

    return BaseView<BooleanProvider>(
      builder: (context, provider, child) {
        return Row(
          children: [
            Expanded(
              child: FormBuilderTextField(
                name: 'tel',
                initialValue: phoneNumber,
                enabled: provider.currentValue,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'PHONE',
                  border: InputBorder.none,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    context,
                    errorText: 'Please enter valid phone number',
                  ),
                ]),
              ),
            ),
            IconButton(
              onPressed: () {
                ContactFunction().showUpdateButton(context, provider);
              },
              icon: provider.currentValue
                  ? Icon(Icons.edit_off)
                  : Icon(Icons.edit_outlined),
            )
          ],
        );
      },
    );
  }

}
