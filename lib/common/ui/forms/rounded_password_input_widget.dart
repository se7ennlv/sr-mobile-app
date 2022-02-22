import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sr/core/providers/boolean_provider.dart';
import 'package:flutter_sr/ui/base_view.dart';

class RoundedPasswordInputWidget extends StatelessWidget {
  final String name;
  final Color fillColor;
  final Widget prefixIcon;
  final String hintText;
  final bool autofocus;
  final TextInputAction textInputAction;
  final Function(String) validator;
  final Function onSubmitted;

  RoundedPasswordInputWidget({
    this.name,
    this.fillColor = Colors.black45,
    this.prefixIcon,
    this.hintText,
    this.autofocus = false,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BaseView<BooleanProvider>(
      builder: (context, provider, child) {
        return Container(
          margin: EdgeInsets.only(bottom: 8.0),
          width: size.width * 0.8,
          child: FormBuilderTextField(
            name: name,
            obscureText: !provider.currentValue,
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.amber,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0, horizontal: 12.0),
              filled: true,
              fillColor: fillColor,
              prefixIcon: prefixIcon,
              errorMaxLines: 1,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white),
              suffixIcon: _buildSuffixIcon(provider),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(width: 0, style: BorderStyle.none),
              ),
            ),
            autofocus: autofocus,
            textInputAction: textInputAction,
            validator: validator,
            onSubmitted: onSubmitted,
          ),
        );
      },
    );
  }

  Widget _buildSuffixIcon(provider) {
    return InkWell(
      onTap: () {
        provider.currentValue = !provider.currentValue;
      },
      child: Icon(
        provider.currentValue ? Icons.visibility : Icons.visibility_off,
        color: Colors.white,
      ),
    );
  }
}
