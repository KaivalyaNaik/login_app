import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  final String field;
  final Function f;
  DrawerComponent({this.field, this.f});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text(field),
        ),
      ),
      onTap: f,
    );
  }
}
