import 'package:flutter/material.dart';
import 'package:login_app/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function f;
  CustomButton({this.text, this.f});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
          height: h / 13,
          width: w / 1.5,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: backgroundColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ))),
      onTap: f,
    );
  }
}
