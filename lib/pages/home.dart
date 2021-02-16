import 'package:flutter/material.dart';
import 'package:login_app/authController.dart';
import 'package:login_app/components/CustomButton.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthController _authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[300], Colors.blue[500]],
              begin: Alignment.topCenter,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CustomButton("SignOut", _authController.signOut)],
        )
      ],
    ));
  }
}
