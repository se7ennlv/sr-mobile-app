import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sr/core/models/user_model.dart';
import 'package:flutter_sr/core/providers/boolean_provider.dart';
import 'package:flutter_sr/core/providers/single_value_provider.dart';
import 'package:flutter_sr/ui/profile/widgets/contact_function.dart';
import 'package:provider/provider.dart';
import '../../base_view.dart';

class EmailInputWidget extends StatelessWidget {
  final dynamic initialValue;
  final SingleValueProvider singleProvider;

  EmailInputWidget({this.initialValue, this.singleProvider});

  @override
  Widget build(BuildContext context) {
    final email = Provider.of<UserModel>(context).email;
    return BaseView<BooleanProvider>(
      builder: (context, provider, child) {
        return Row(
          children: [
            Expanded(
              child: FormBuilderTextField(
                name: 'email',
                initialValue: email,
                enabled: provider.currentValue,
                decoration: InputDecoration(
                  labelText: 'EMAIL',
                  border: InputBorder.none,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    context,
                    errorText: 'Please enter valid email address',
                  ),
                  FormBuilderValidators.email(context),
                ]),
              ),
            ),
            IconButton(
              onPressed: () {
                ContactFunction().showUpdateButton(context, provider);
              },
              icon: provider.currentValue ? Icon(Icons.edit_off) : Icon(Icons.edit_outlined),
            )
          ],
        );
      },
    );
  }
}
