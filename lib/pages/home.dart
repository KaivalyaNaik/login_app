import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Controllers/authController.dart';
import 'package:login_app/components/DrawerComponent.dart';
import 'package:login_app/components/HomeInfo.dart';
import 'package:login_app/components/RoundedImage.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/models/picture.dart';
import 'package:login_app/pages/HelpCenter.dart';
import 'package:login_app/pages/PrivacyPolicy.dart';
import 'package:login_app/pages/products.dart';
import 'package:login_app/pages/profile.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  User user = FirebaseAuth.instance.currentUser;

  PageController _pageController = PageController(initialPage: 2);
  int pageIndex = 2;

  List<Widget> pages = [
    Profile(),
    Privacy(),
    HomeInfo(),
    HelpCenter(),
    Product()
  ];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: AppBar(),
        drawer: Container(
          height: h,
          width: w / 1.5,
          decoration: BoxDecoration(
              color: primaryColor,
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  colors: [primaryColor, Colors.grey[50]])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: h / 4,
                width: w / 1.5,
                decoration: BoxDecoration(
                  color: backgroundColor,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Consumer<Picture>(
                        builder: (context, picture, child) {
                          return (picture != null)
                              ? RoundedImage(
                                  imagePath: picture.picName.path,
                                  size: 110,
                                  radius: 60,
                                )
                              : Image.asset('assets/default.png');
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        user.email,
                        style: TextStyle(color: primaryColor),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              DrawerComponent(
                field: "Settings",
                f: () {},
              ),
              Divider(
                color: backgroundColor,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              DrawerComponent(field: "Topics", f: () {}),
              Divider(
                color: backgroundColor,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              DrawerComponent(
                field: "Help Centre",
                f: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HelpCenter()));
                },
              ),
              Divider(
                color: backgroundColor,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              DrawerComponent(
                  field: "Privacy Policy",
                  f: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Privacy()));
                  }),
              Divider(
                color: backgroundColor,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(
                height: h / 8,
              ),
              TextButton(
                onPressed: () {
                  AuthController().signOut();
                },
                child: Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        body: PageView(
          children: pages,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: onChanged,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: onTapped,
          unselectedItemColor: Colors.black,
          selectedItemColor: backgroundColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_box,
                ),
                label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: "Settings"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.help_sharp,
                ),
                label: "Help Center"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag,
                ),
                label: "Products")
          ],
        ),
      ),
    );
  }

  void onChanged(int page) {
    setState(() {
      this.pageIndex = page;
    });
  }

  void onTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
