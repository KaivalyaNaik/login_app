import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:login_app/models/user_model.dart';

class AuthController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> createUser(String email, String password, UserModel userModel,
      BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await addUser(userModel);
      Navigator.pop(context, true);
    } on FirebaseAuthException catch (e) {
      print("Error :$e");
    } catch (e) {
      print("Error :$e");
    }
  }

  Future<void> signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print("Error:$e");
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

  Future<void> addUser(UserModel userModel) async {
    CollectionReference users = firestore.collection("users");
    return users.add(userModel.toJson());
  }
}
