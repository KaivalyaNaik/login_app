import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final bool enabled;
  final IconData icon;
  final String text;
  final Function f;
  ProfileTextField({this.enabled = false, this.icon, this.text, this.f});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        enabled: enabled,
        decoration: InputDecoration(
            icon: Icon(
              icon,
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(30)),
            labelText: text),
      ),
    );
  }
}
