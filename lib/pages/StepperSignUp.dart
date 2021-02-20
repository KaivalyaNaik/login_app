import 'package:flutter/material.dart';
import 'package:login_app/components/FormInputField.dart';
import 'package:login_app/components/TextComponent.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/validator.dart';

class StepperSignUP extends StatefulWidget {
  @override
  _StepperSignUPState createState() => _StepperSignUPState();
}

class _StepperSignUPState extends State<StepperSignUP> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  int _currentStep = 0;

  tapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      Step(
          title: Text(
            "New Account",
            style: TextStyle(color: primaryColor),
          ),
          content: Column(
            children: [
              FormInputField(
                controller: nameController,
                iconData: Icons.account_box,
                labelText: "Name",
                validator: Validator().name,
              ),
              SizedBox(
                height: 30,
              ),
              FormInputField(
                controller: emailController,
                iconData: Icons.email,
                labelText: "Email",
                validator: Validator().email,
              ),
            ],
          ),
          isActive: _currentStep >= 0,
          state: _currentStep >= 0 ? StepState.complete : StepState.disabled),
      Step(
          title: Text(
            "Password",
            style: TextStyle(color: primaryColor),
          ),
          content: Column(
            children: [
              FormInputField(
                controller: passwordController,
                iconData: Icons.lock,
                labelText: "Password",
                validator: Validator().password,
              ),
            ],
          ),
          isActive: _currentStep >= 0,
          state: _currentStep >= 1 ? StepState.complete : StepState.disabled)
    ];

    return SafeArea(
        child: Scaffold(
            body: Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: Column(
        children: [
          Expanded(
              child: Theme(
                  data: ThemeData(
                      primaryColor: primaryColor,
                      primaryColorLight: primaryColor,
                      colorScheme: ColorScheme(
                        onPrimary: primaryColor,
                        background: backgroundColor,
                        primary: primaryColor,
                        secondary: backgroundColor,
                        brightness: Brightness.light,
                        error: Colors.white,
                        onBackground: Colors.redAccent,
                        onError: primaryColor,
                        onSecondary: backgroundColor,
                        onSurface: backgroundColor,
                        primaryVariant: primaryColor,
                        surface: backgroundColor,
                        secondaryVariant: backgroundColor,
                      ),
                      textTheme: TextTheme(
                          bodyText2: TextStyle(color: backgroundColor))),
                  child: Stepper(
                    type: StepperType.vertical,
                    steps: steps,
                    currentStep: _currentStep,
                    onStepTapped: (step) => tapped(step),
                    onStepContinue: continued,
                    onStepCancel: cancel,
                  )))
        ],
      ),
    )));
  }
}
