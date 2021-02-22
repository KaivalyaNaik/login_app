import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/models/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static User firebaseUser;

  Future<void> createUser(String email, String password, UserModel userModel,
      BuildContext context) async {
    print("here");
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser = userCredential.user;
      userModel.uid = firebaseUser.uid;
      await addUser(userModel, firebaseUser);
      Navigator.pop(context, true);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {
      if (e.code == 'email-already-exists')
        Fluttertoast.showToast(
            msg: "User Already Exists!!",
            backgroundColor: primaryColor,
            textColor: backgroundColor);
      print("Error :$e");
    }
  }

  Future<void> signInUser(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      firebaseUser = userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'wrong-password') {
        //Scaffold.of(context).showSnackBar(snackbar("Wrong Password!!"));
        Fluttertoast.showToast(
            msg: "Wrong Password!!!",
            backgroundColor: primaryColor,
            textColor: backgroundColor);
      }
    } catch (e) {
      print("Error:$e");
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Error:$e");
    }
  }

  Future addUser(UserModel userModel, User user) async {
    CollectionReference users = firestore.collection("users");
    return users
        .doc("${user.uid}")
        .set(userModel.toJson())
        .then((value) => {print("Added Successfully")});
  }
}

Widget snackbar(String msg) {
  return SnackBar(
      content: Container(
    height: 10,
    width: 100,
    color: backgroundColor,
    child: Text(
      msg,
      style: TextStyle(color: Colors.white),
    ),
  ));
}
