import 'package:flutter/material.dart';
import 'package:login_app/constants.dart';

class DrawerComponent extends StatelessWidget {
  final String field;
  final Function f;
  DrawerComponent({this.field, this.f});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
        height: 60,
        width: w / 1.5,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                colors: [primaryColor, Colors.grey[50]])),
        child: Center(
          child: Text(
            field,
            style: TextStyle(color: backgroundColor, fontSize: 20),
          ),
        ),
      ),
      onTap: f,
    );
  }
}
