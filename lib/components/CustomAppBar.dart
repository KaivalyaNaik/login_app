import 'package:flutter/material.dart';
import 'package:login_app/constants.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      child: Column(
        children: [
          Expanded(
              flex: 20,
              child: Container(
                color: Color.fromRGBO(251, 241, 23, 1),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: primaryColor,
              ))
        ],
      ),
    );
  }
}
