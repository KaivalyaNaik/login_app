import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Controllers/userController.dart';
import 'package:login_app/components/DrawerComponent.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/models/user_model.dart';
import 'package:login_app/pages/HelpCenter.dart';
import 'package:login_app/pages/PrivacyPolicy.dart';
import 'package:login_app/pages/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserController _userController = UserController();
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            key: _key,
            appBar: AppBar(),
            drawer: Container(
              height: h,
              width: w / 1.5,
              decoration: BoxDecoration(
                  color: primaryColor,
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      colors: [primaryColor, Colors.grey[50]])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: w / 1.5,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                    ),
                  ),
                  SizedBox(
                    height: 250,
                  ),
                  DrawerComponent(
                    field: "Profile",
                    f: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                  ),
                  Container(
                    height: 1,
                    width: w / 3,
                    color: Colors.redAccent,
                  ),
                  DrawerComponent(
                    field: "Settings",
                    f: () {},
                  ),
                  Container(
                    height: 1,
                    width: w / 3,
                    color: Colors.redAccent,
                  ),
                  DrawerComponent(field: "Topics", f: () {}),
                  Container(
                    height: 1,
                    width: w / 3,
                    color: Colors.redAccent,
                  ),
                  DrawerComponent(
                    field: "Help Centre",
                    f: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HelpCenter()));
                    },
                  ),
                  Container(
                    height: 1,
                    width: w / 3,
                    color: Colors.redAccent,
                  ),
                  DrawerComponent(
                      field: "Privacy Policy",
                      f: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Privacy()));
                      })
                ],
              ),
            ),
            body: FutureBuilder(
              future: _userController.getUser(user.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  UserModel userModel = snapshot.data;
                  return Container(
                      height: h,
                      width: w,
                      decoration: BoxDecoration(color: backgroundColor),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 150,
                          color: primaryColor,
                        ),
                      ));
                }
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: primaryColor,
                    ),
                  ),
                );
              },
            )));
  }
}
