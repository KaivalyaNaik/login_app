import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String dob;
  String company;
  String uid;

  UserModel({this.dob = "", this.company, this.name, this.uid});

  factory UserModel.fromJson(DocumentSnapshot documentSnapshot) {
    return UserModel(
        name: documentSnapshot.data()["name"],
        dob: documentSnapshot.data()["dob"],
        company: documentSnapshot.data()["company"],
        uid: documentSnapshot.data()["uid"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "company": this.company,
      "dob": this.dob.toString(),
      "uid": this.uid
    };
  }
}
