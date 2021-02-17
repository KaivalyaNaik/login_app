import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  int age;
  String company;
  String uid;

  UserModel({this.age, this.company, this.name, this.uid});

  factory UserModel.fromJson(DocumentSnapshot documentSnapshot) {
    return UserModel(
        name: documentSnapshot.data()["name"],
        age: documentSnapshot.data()["age"],
        company: documentSnapshot.data()["company"],
        uid: documentSnapshot.data()["uid"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "company": this.company,
      "age": this.age,
      "uid": this.uid
    };
  }
}
