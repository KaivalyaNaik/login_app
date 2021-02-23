import 'package:flutter/material.dart';
import 'package:login_app/Controllers/authController.dart';
import 'package:login_app/Controllers/userController.dart';
import 'package:login_app/components/ProfileTextField.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/models/user_model.dart';

class ProfileData extends StatefulWidget {
  @override
  _ProfileDataState createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  bool enabled = false;
  UserModel userModel;
  @override
  TextEditingController name, email, company, joined;
  void initState() {
    name = TextEditingController();
    email = TextEditingController();
    company = TextEditingController();
    joined = TextEditingController();

    name.text = '';
    email.text = '';
    company.text = '';
    joined.text = '';
    super.initState();
    getUser();
  }

  void getUser() async {
    userModel = await UserController().getUser(AuthController.firebaseUser.uid);
    setState(() {
      name.text = userModel.name;
      email.text = AuthController.firebaseUser.email;
      company.text = userModel.company;
      joined.text =
          "${AuthController.firebaseUser.metadata.creationTime.toLocal()}"
              .split(' ')[0];
    });
  }

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Stack(
        children: [
          Container(
            height: 0.7 * h,
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              ProfileTextField(
                controller: email,
                icon: Icons.email,
                enabled: false,
              ),
              SizedBox(
                height: 30,
              ),
              ProfileTextField(
                controller: name,
                icon: Icons.account_box,
                enabled: enabled,
              ),
              SizedBox(
                height: 30,
              ),
              ProfileTextField(
                controller: joined,
                icon: Icons.location_on,
                enabled: false,
              ),
              SizedBox(
                height: 30,
              ),
              ProfileTextField(
                controller: company,
                icon: Icons.account_balance,
                enabled: enabled,
              )
            ]),
          ),
          Positioned(
            child: !enabled
                ? FloatingActionButton(
                    backgroundColor: backgroundColor,
                    onPressed: () {
                      setState(() {
                        enabled = !enabled;
                      });
                    },
                    child: Icon(
                      Icons.edit,
                      color: primaryColor,
                    ),
                  )
                : FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        enabled = !enabled;
                        userModel.name = name.text.trim();
                        userModel.company = company.text.trim();
                        UserController().setUser(
                            AuthController.firebaseUser.uid, userModel);
                      });
                    },
                    child: Icon(
                      Icons.check,
                      color: primaryColor,
                    ),
                  ),
            top: h / 3,
            right: 20,
          )
        ],
      ),
    );
  }
}
