import 'package:flutter/material.dart';
import 'package:login_app/components/CustomButton.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/pages/StepperSignUp.dart';
import 'package:login_app/pages/sign_in.dart';

class WelcomePage extends StatelessWidget {
  PageController _controller =
      PageController(initialPage: 1, viewportFraction: 1.0);

  gotoLogin() {
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoSignup() {
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeIn,
    );
  }

  Widget Welcome(BuildContext context, Function page1, Function page2) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_rounded,
                  size: 100,
                  color: primaryColor,
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(text: "LOGIN", f: page1),
                SizedBox(
                  height: 30,
                ),
                CustomButton(text: "SIGNUP", f: page2)
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: MediaQuery.of(context).size.height,
      child: PageView(
        controller: _controller,
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          SignIn(),
          Welcome(context, gotoLogin, gotoSignup),
          StepperSignUP()
        ],
      ),
    ));
  }
}
