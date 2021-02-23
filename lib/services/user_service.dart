import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_app/models/user_model.dart';

class UserService {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<UserModel> getUser(String uid) {
    return users.doc("$uid").get().then((DocumentSnapshot documentSnapshot) {
      return UserModel.fromJson(documentSnapshot);
    });
  }

  Future<void> setUser(String uid, UserModel userModel) {
    return users.doc("$uid").set(userModel.toJson());
  }
}
