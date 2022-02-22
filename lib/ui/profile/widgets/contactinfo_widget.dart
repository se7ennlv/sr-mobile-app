import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sr/core/providers/single_value_provider.dart';
import 'package:flutter_sr/core/providers/user_provider.dart';
import 'package:flutter_sr/ui/profile/widgets/input_phone_widget.dart';
import 'package:flutter_sr/ui/profile/widgets/update_button_widget.dart';
import '../../base_view.dart';
import 'input_email_widget.dart';

class ContactInfoWidget extends StatefulWidget {
  @override
  _ContactInfoWidgetState createState() => _ContactInfoWidgetState();
}

class _ContactInfoWidgetState extends State<ContactInfoWidget> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

    return BaseView<UserProvider>(
      builder: (context, userProvider, child) {
        return SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 22.0),
              child: BaseView<SingleValueProvider>(
                builder: (context, singleProvider, child) {
                  int hasEnabled = singleProvider.currentValue;

                  return Column(
                    children: [
                      PhoneInputWidget(),
                      EmailInputWidget(),
                      Divider(),
                      SizedBox(height: 8.0),
                      hasEnabled != null && hasEnabled > 0
                          ? userProvider.busy
                              ? CircularProgressIndicator()
                              : UpdateButtonWidget(formKey: _formKey)
                          : SizedBox(),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
