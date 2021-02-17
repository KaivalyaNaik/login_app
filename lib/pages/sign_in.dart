import 'package:flutter/material.dart';
import 'package:login_app/Controllers/authController.dart';
import 'package:login_app/components/CustomButton.dart';
import 'package:login_app/components/FormInputField.dart';
import 'package:login_app/components/header.dart';
import 'package:login_app/validator.dart';
import 'sign_up.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.blue, width: 2)),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Header(),
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
                            onSaved: (value) =>
                                (passwordController.text = value),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton("Login", () async {
                                if (_formKey.currentState.validate()) {
                                  _authController.signInUser(
                                      emailController.text,
                                      passwordController.text);
                                }
                              }),
                              CustomButton("SignUp", () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
