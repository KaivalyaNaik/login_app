import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  String _imageLogo = "assets/default.png";
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        foregroundColor: Colors.blue,
        backgroundColor: Colors.transparent,
        radius: 60.0,
        child: ClipOval(
          child: Image.asset(
            _imageLogo,
            fit: BoxFit.cover,
            width: 120.0,
            height: 120.0,
          ),
        ));
  }
}
