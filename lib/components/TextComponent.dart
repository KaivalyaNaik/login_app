import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          style: GoogleFonts.lato(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}
