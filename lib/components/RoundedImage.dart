import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_app/constants.dart';

class RoundedImage extends StatelessWidget {
  final String imagePath;
  final double size;
  RoundedImage({this.imagePath, this.size});
  @override
  Widget build(BuildContext context) {
    File image = File(imagePath);
    return CircleAvatar(
        backgroundColor: primaryColor,
        radius: 75,
        child: ClipOval(
          child: Image.file(
            image,
            width: 130,
            height: 130,
            fit: BoxFit.cover,
          ),
        ));
  }
}
