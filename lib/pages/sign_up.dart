import 'package:flutter/material.dart';
import 'package:login_app/Controllers/authController.dart';
import 'package:login_app/components/CustomButton.dart';
import 'package:login_app/components/FormInputField.dart';
import 'package:login_app/components/header.dart';
import 'package:login_app/models/user_model.dart';
import 'package:login_app/pages/TakePic.dart';
import 'package:login_app/validator.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  AuthController _authController = AuthController();
  UserModel userModel;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _formKey,
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.blue, width: 2)),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          GestureDetector(
                            child: Header(),
                            onTap: () {
                              print("here");
                            },
                          ),
                          TakePicScreen(Colors.white)
                        ],
                      ),
                      FormInputField(
                        controller: nameController,
                        iconData: Icons.account_box,
                        labelText: "Name",
                        validator: Validator().name,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      FormInputField(
                        controller: emailController,
                        iconData: Icons.email,
                        labelText: "Email",
                        validator: Validator().email,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      FormInputField(
                        controller: passwordController,
                        iconData: Icons.lock,
                        labelText: "Password",
                        validator: Validator().password,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      FormInputField(
                        controller: ageController,
                        iconData: Icons.access_time,
                        labelText: "Age",
                        validator: Validator().number,
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      FormInputField(
                        controller: companyController,
                        iconData: Icons.work,
                        labelText: "Company",
                        validator: Validator().name,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomButton("SignUp", () {
                        userModel = UserModel(
                            name: nameController.text,
                            age: int.parse(ageController.text),
                            company: companyController.text);
                        _authController.createUser(emailController.text,
                            passwordController.text, userModel, context);
                      }),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
