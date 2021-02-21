import 'package:flutter/material.dart';
import 'package:login_app/components/RoundedImage.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/models/picture.dart';
import 'package:login_app/pages/TakePic.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: h * 1.5,
          width: w,
          color: backgroundColor,
          child: Stack(children: [
            Column(children: [
              Flexible(
                child: Container(
                    height: h / 3.5,
                    width: w,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                    ),
                    child: Center(
                      child: Stack(children: [
                        Consumer<Picture>(
                          builder: (context, picture, child) {
                            return picture.picName != null
                                ? RoundedImage(
                                    imagePath: picture.picName.path,
                                    size: 200,
                                  )
                                : CircularProgressIndicator();
                          },
                        ),
                        Positioned(
                          child: TakePicScreen(Colors.white),
                          bottom: 10,
                          right: 10,
                        )
                      ]),
                    )),
              ),
              Flexible(
                  child: Container(
                height: h * 1.5,
                width: w,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ))
            ]),
            Positioned(
              child: IconButton(
                  color: primaryColor,
                  alignment: Alignment.topLeft,
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  }),
              top: 40,
              left: 30,
            ),
          ]),
        ),
      )),
    );
  }
}
