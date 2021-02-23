import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_app/constants.dart';

class RoundedImage extends StatelessWidget {
  final String imagePath;
  final double size;
  final double radius;
  RoundedImage({this.imagePath, this.size, this.radius = 75});
  @override
  Widget build(BuildContext context) {
    File image = File(imagePath);
    return CircleAvatar(
        backgroundColor: primaryColor,
        radius: radius,
        child: ClipOval(
          child: Image.file(
            image,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ));
  }
}
