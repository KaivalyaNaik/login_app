import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  final TextEditingController controller;
  final IconData iconData;
  final String labelText;
  final String Function(String) validator;
  final bool obscureText;
  final Function onSaved;

  FormInputField(
      {this.controller,
      this.obscureText = false,
      this.iconData,
      this.labelText,
      this.validator,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: Color(0x1E90FF),
          labelStyle: TextStyle(color: Colors.blue),
          filled: true,
          prefixIcon: Icon(
            iconData,
            color: Colors.blue,
          ),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          labelText: labelText),
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
