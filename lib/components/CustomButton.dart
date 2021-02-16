import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function f;
  CustomButton(this.text, this.f);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        text,
      ),
      textColor: Colors.white,
      onPressed: f,
      color: Colors.blue,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(50)),
      elevation: 4,
      height: 40,
      minWidth: 100,
    );
  }
}
