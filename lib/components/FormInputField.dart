import 'package:flutter/material.dart';
import 'package:login_app/constants.dart';

class FormInputField extends StatelessWidget {
  final TextEditingController controller;
  final IconData iconData;
  final String labelText;
  final String Function(String) validator;
  final bool obscureText;
  final Function onSaved;
  final keyboardType;

  FormInputField(
      {this.controller,
      this.obscureText = false,
      this.iconData,
      this.labelText,
      this.validator,
      this.onSaved,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: primaryColor)),
          errorStyle: TextStyle(color: primaryColor),
          labelStyle: TextStyle(color: primaryColor),
          filled: true,
          prefixIcon: Icon(
            iconData,
            color: primaryColor,
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
              borderRadius: BorderRadius.circular(30)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: primaryColor)),
          labelText: labelText),
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboardType,
    );
  }
}
