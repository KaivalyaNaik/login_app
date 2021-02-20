import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextComponent extends StatelessWidget {
  final String field;
  final String data;
  final double fSize;
  TextComponent({this.field, this.data, this.fSize = 20});
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
              color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
