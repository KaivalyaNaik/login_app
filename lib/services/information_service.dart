import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class InformationService {
  CollectionReference information =
      FirebaseFirestore.instance.collection("information");

  Future<String> getInfo() async {
    return information.doc('YuoHia7mzVn2NhnS3V5f').get().then((value) {
      return value.data()["info"];
    });
  }
}
