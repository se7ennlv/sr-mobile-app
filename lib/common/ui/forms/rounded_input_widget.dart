import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RoundedInputWidget extends StatelessWidget {
  final String name;
  final TextInputType keyboardType;
  final Color fillColor;
  final Widget prefixIcon;
  final String hintText;
  final Function(String) validator;

  RoundedInputWidget({
    this.name,
    this.keyboardType = TextInputType.text,
    this.fillColor = Colors.black45,
    this.prefixIcon,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      width: size.width * 0.8,
      child: FormBuilderTextField(
        name: name,
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.amber,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.0),
          filled: true,
          fillColor: fillColor,
          prefixIcon: prefixIcon,
          errorMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
