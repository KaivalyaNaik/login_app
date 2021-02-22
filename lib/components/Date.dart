import 'package:flutter/material.dart';
import 'package:login_app/components/FormInputField.dart';
import 'package:login_app/components/header.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/models/user_model.dart';
import 'package:login_app/pages/TakePic.dart';
import 'package:login_app/validator.dart';

class DateCompany extends StatefulWidget {
  final UserModel userModel;
  DateCompany(this.userModel);
  @override
  _DateCompanyState createState() => _DateCompanyState(userModel);
}

class _DateCompanyState extends State<DateCompany> {
  final UserModel userModel;
  _DateCompanyState(this.userModel);
  TextEditingController companyController = TextEditingController();
  DateTime now = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null && picked != now) {
      setState(() {
        picked = now;
      });
    }
    userModel.dob = "${picked.toLocal()}".split(' ')[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Stack(
          children: [
            // Text(
            //   "Select Date of Birth",
            //   style: TextStyle(color: primaryColor),
            // ),
            Header(),
            // Text(
            //   "${now.toLocal()}".split(' ')[0],
            //   style: TextStyle(color: primaryColor),
            // // )
            // Positioned(
            //   child: TakePicScreen(Colors.white70),
            //   bottom: 0,
            //   right: 0,
            // )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        FormInputField(
          controller: companyController,
          labelText: "Enter Company",
          iconData: Icons.account_balance,
          validator: Validator().name,
          onSaved: (val) {
            companyController.text = val;
            userModel.company = val;
          },
        )
      ],
    ));
  }
}
