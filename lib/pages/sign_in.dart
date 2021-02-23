import 'package:flutter/material.dart';
import 'package:login_app/Controllers/authController.dart';

import 'package:login_app/components/CustomButton.dart';
import 'package:login_app/components/FormInputField.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/validator.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Builder(builder: (BuildContext context) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                height: h,
                width: w,
                decoration: BoxDecoration(color: backgroundColor),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Icon(
                        Icons.person,
                        size: 70,
                        color: primaryColor,
                      ),
                      SizedBox(height: 50),
                      FormInputField(
                        labelText: "Email",
                        controller: emailController,
                        iconData: Icons.email,
                        validator: Validator().email,
                        onSaved: (value) => {emailController.text = value},
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      FormInputField(
                        labelText: "Password",
                        controller: passwordController,
                        iconData: Icons.lock,
                        validator: Validator().password,
                        obscureText: true,
                        onSaved: (value) => (passwordController.text = value),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                          f: () async {
                            if (_formKey.currentState.validate()) {
                              _authController.signInUser(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                  context);
                            }
                          },
                          text: "LOGIN"),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
