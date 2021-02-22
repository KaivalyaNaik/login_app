import 'package:flutter/material.dart';
import 'package:login_app/Controllers/authController.dart';
import 'package:login_app/components/Date.dart';
import 'package:login_app/components/FormInputField.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/models/user_model.dart';
import 'package:login_app/validator.dart';

class StepperSignUP extends StatefulWidget {
  @override
  _StepperSignUPState createState() => _StepperSignUPState();
}

class _StepperSignUPState extends State<StepperSignUP> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  List<GlobalKey<FormState>> _formKey = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];
  int _currentStep = 0;
  UserModel userModel;

  tapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  continued() {
    if (_formKey[_currentStep].currentState.validate()) {
      if (_currentStep < 2) {
        setState(() {
          _currentStep += 1;
        });
      } else {
        userModel = UserModel(
          name: nameController.text.trim(),
        );
        AuthController().createUser(emailController.text.trim(),
            passwordController.text.trim(), userModel, context);
      }
    }
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
          content: Form(
              key: _formKey[0],
              child: Column(
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
              )),
          isActive: _currentStep >= 0,
          state: _currentStep >= 0 ? StepState.complete : StepState.disabled),
      Step(
          title: Text(
            "Password",
            style: TextStyle(color: primaryColor),
          ),
          content: Form(
            key: _formKey[1],
            child: Column(
              children: [
                FormInputField(
                  controller: passwordController,
                  iconData: Icons.lock,
                  labelText: "Password",
                  validator: Validator().password,
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                FormInputField(
                  controller: confirmController,
                  iconData: Icons.lock,
                  labelText: "Confirm Password",
                  obscureText: true,
                  validator: (val) {
                    if (val != passwordController.text)
                      return 'Passwords do no Match !!';
                    return null;
                  },
                ),
              ],
            ),
          ),
          isActive: _currentStep >= 0,
          state: _currentStep >= 1 ? StepState.complete : StepState.disabled),
      Step(
          content: Form(key: _formKey[2], child: DateCompany(userModel)),
          title: Text(
            "Information",
            style: TextStyle(color: primaryColor),
          ),
          isActive: _currentStep >= 0,
          state: _currentStep >= 2 ? StepState.complete : StepState.disabled)
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
