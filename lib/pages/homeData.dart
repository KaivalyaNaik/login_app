import 'package:flutter/material.dart';
import 'package:login_app/components/TextComponent.dart';
import 'package:login_app/models/user_model.dart';

class HomeData extends StatefulWidget {
  final UserModel userModel;
  HomeData({this.userModel});
  @override
  _HomeDataState createState() => _HomeDataState(userModel);
}

class _HomeDataState extends State<HomeData> {
  final UserModel userModel;
  _HomeDataState(this.userModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Name :" + userModel.name),
          Text("Age" + userModel.toString()),
          Text("Company" + userModel.toString())
        ],
      ),
    );
  }
}
