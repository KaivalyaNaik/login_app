import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String name;
  String description;
  num price;
  String photoURL;
  final int productId;

  ProductModel(
      {this.name, this.description, this.price, this.productId, this.photoURL});

  factory ProductModel.fromJson(DocumentSnapshot documentSnapshot) {
    return ProductModel(
        name: documentSnapshot.data()["name"],
        description: documentSnapshot.data()["description"],
        price: documentSnapshot.data()["price"],
        productId: documentSnapshot.data()["productId"],
        photoURL: documentSnapshot.data()["photoURL"]);
  }

  factory ProductModel.fromSnapshot(QueryDocumentSnapshot snapshot) {
    return ProductModel(
        name: snapshot.data()["name"],
        description: snapshot.data()["description"],
        price: snapshot.data()["price"],
        productId: snapshot.data()["productId"],
        photoURL: snapshot.data()["photoURL"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "productId": productId,
      "photoURL": photoURL
    };
  }
}
