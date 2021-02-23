import 'package:flutter/material.dart';
import 'package:login_app/components/ProfileData.dart';
import 'package:login_app/components/RoundedImage.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/models/picture.dart';
import 'package:login_app/models/user_model.dart';
import 'package:login_app/pages/TakePic.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  UserModel userModel;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          height: h * 2,
          width: w,
          color: backgroundColor,
          child: Stack(children: [
            Column(children: [
              Container(
                  height: h / 3.5,
                  width: w,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                  ),
                  child: Center(
                    child: Stack(children: [
                      Consumer<Picture>(
                        builder: (context, picture, child) {
                          return (picture.picName != null)
                              ? RoundedImage(
                                  imagePath: picture.picName.path,
                                  size: 200,
                                )
                              : Image.asset('assets/default.png');
                        },
                      ),
                      Positioned(
                        child: TakePicScreen(Colors.white),
                        bottom: 10,
                        right: 10,
                      )
                    ]),
                  )),
              Container(
                  height: h * 1.5,
                  width: w,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Expanded(child: ProfileData()),
                      ],
                    ),
                  ))
            ]),
          ]),
        ),
      ),
    );
  }
}
