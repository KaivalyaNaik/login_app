import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Controllers/userController.dart';
import 'package:login_app/components/DynamicHeader.dart';
import 'package:login_app/components/TextComponent.dart';
import 'package:login_app/components/header.dart';
import 'package:login_app/models/picture.dart';
import 'package:login_app/models/user_model.dart';
import 'package:login_app/pages/TakePic.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserController _userController = UserController();

  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: FutureBuilder(
      future: _userController.getUser(user.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          UserModel userModel = snapshot.data;
          return Container(
              child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: DynamicHeader(),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    height: h,
                    color: Colors.white,
                    width: w,
                  );
                }, childCount: 1),
              )
            ],
          ));
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    ));
  }
}
