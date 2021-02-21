import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Controllers/authController.dart';
import 'package:login_app/Controllers/picController.dart';
import 'package:login_app/models/picture.dart';
import 'package:login_app/pages/WelcomePage.dart';
import 'package:login_app/pages/sign_in.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Picture(picName: null))
        ],
        child: GestureDetector(
          child: MaterialApp(
            title: 'Login App',
            theme: ThemeData(primaryColor: Colors.white),
            debugShowCheckedModeBanner: false,
            home: LandingPage(),
          ),
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              FocusManager.instance.primaryFocus.unfocus();
            }
          },
        ));
  }
}

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text(snapshot.error.toString())),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  AuthController.firebaseUser = snapshot.data;
                  print(AuthController.firebaseUser.toString());
                  User user = snapshot.data;
                  if (user == null)
                    return WelcomePage();
                  else {
                    PicController _picController = PicController();
                    _picController.getImage(context);
                  }
                  return Home();
                }
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
