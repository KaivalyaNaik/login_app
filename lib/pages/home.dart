import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Controllers/authController.dart';
import 'package:login_app/Controllers/userController.dart';
import 'package:login_app/components/TextComponent.dart';
import 'package:login_app/models/user_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthController _authController = AuthController();
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
          return SingleChildScrollView(
              child: Container(
            height: h,
            width: w,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: h / 3,
                    width: w / 1.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        TextComponent("Name : ", userModel.name),
                        SizedBox(
                          height: 24,
                        ),
                        TextComponent("Age : ", userModel.age.toString()),
                        SizedBox(
                          height: 24,
                        ),
                        TextComponent("Company : ", userModel.company),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
