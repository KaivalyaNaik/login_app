import 'package:flutter/material.dart';
import 'package:login_app/Controllers/authController.dart';
import 'package:login_app/Controllers/userController.dart';
import 'package:login_app/components/ProfileTextField.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/models/user_model.dart';

class ProfileData extends StatefulWidget {
  final UserModel userModel;
  ProfileData(this.userModel);
  @override
  _ProfileDataState createState() => _ProfileDataState(userModel);
}

class _ProfileDataState extends State<ProfileData> {
  final UserModel userModel;
  _ProfileDataState(this.userModel);
  bool enabled = false;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            ProfileTextField(
              icon: Icons.email,
              text: AuthController.firebaseUser.email,
              enabled: false,
            ),
            SizedBox(
              height: 30,
            ),
            ProfileTextField(
              icon: Icons.account_box,
              text: "${userModel.name}",
              enabled: enabled,
            ),
            SizedBox(
              height: 30,
            ),
            ProfileTextField(
              text: "Joined  " +
                  "${AuthController.firebaseUser.metadata.creationTime.toLocal()}"
                      .split(' ')[0],
              icon: Icons.location_on,
              enabled: false,
            ),
            SizedBox(
              height: 30,
            ),
            ProfileTextField(
              text: userModel.company != null
                  ? "${userModel.company}"
                  : "Not entered",
              icon: Icons.account_balance,
              enabled: enabled,
            )
          ]),
        ),
        Positioned(
          child: FloatingActionButton(
            backgroundColor: backgroundColor,
            onPressed: () {
              setState(() {
                enabled = true;
              });
            },
            child: Icon(Icons.edit),
          ),
          bottom: h / 8,
          right: w / 15,
        ),
      ],
    );
  }
}
