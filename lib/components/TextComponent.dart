import 'package:flutter/material.dart';
import 'package:login_app/constants.dart';

class TextComponent extends StatelessWidget {
  final String field;
  final String data;
  TextComponent(this.field, this.data);
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: field,
          children: [
            TextSpan(
              text: data,
            )
          ],
          style: ThemeInfo.textStyle),
    );
  }
}
