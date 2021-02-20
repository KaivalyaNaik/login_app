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
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          elevation: 10,
          child: Column(
            children: [
              DrawerHeader(
                  child: ClipRRect(
                child: Image.asset('assets/logo.png'),
              ))
            ],
          ),
        ),
        key: _key,
        body: FutureBuilder(
          future: _userController.getUser(user.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              UserModel userModel = snapshot.data;
              return Container(
                  child: CustomScrollView(
                slivers: <Widget>[
                  SliverPersistentHeader(delegate: DynamicHeader()),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        height: h,
                        color: Colors.white,
                        width: w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150,
                            ),
                            TextComponent(field: "", data: userModel.name),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  height: h / 12,
                                  width: w / 3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border:
                                          Border.all(color: Colors.grey[300])),
                                  child: TextComponent(
                                      field: "Age      ",
                                      data: userModel.age.toString()),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                    padding: EdgeInsets.all(20),
                                    height: h / 12,
                                    width: w / 2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: Colors.grey[300])),
                                    child: TextComponent(
                                      field: "Company     ",
                                      data: userModel.company,
                                    ))
                              ],
                            )
                          ],
                        ),
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
