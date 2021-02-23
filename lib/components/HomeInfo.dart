import 'package:flutter/material.dart';

import 'package:login_app/constants.dart';
import 'package:login_app/services/information_service.dart';

class HomeInfo extends StatefulWidget {
  @override
  _HomeInfoState createState() => _HomeInfoState();
}

class _HomeInfoState extends State<HomeInfo> {
  double size = 20;
  String text;

  void initState() {
    text = '';
    super.initState();
    getText();
  }

  void getText() async {
    text = await InformationService().getInfo();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
            width: w,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: backgroundColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "What is a Paragraph ?",
                  style: TextStyle(color: primaryColor, fontSize: 50),
                ),
                SizedBox(
                  height: 30,
                ),
                Stack(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(text,
                            style:
                                TextStyle(color: primaryColor, fontSize: size)),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                  Positioned(
                    child: FloatingActionButton(
                      onPressed: () {
                        if (size < 35) {
                          setState(() {
                            size += 5;
                          });
                        }
                      },
                      child: Icon(
                        Icons.add,
                        color: backgroundColor,
                      ),
                      backgroundColor: primaryColor,
                    ),
                    bottom: 20,
                    right: 10,
                  ),
                  Positioned(
                    child: FloatingActionButton(
                      onPressed: () {
                        if (size > 10) {
                          setState(() {
                            size -= 5;
                          });
                        }
                      },
                      child: Icon(
                        Icons.remove,
                        color: backgroundColor,
                      ),
                      backgroundColor: primaryColor,
                    ),
                    bottom: 20,
                    left: 10,
                  ),
                ]),
              ],
            )),
      ),
    );
  }
}
