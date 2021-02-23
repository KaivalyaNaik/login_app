import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_app/models/product_model.dart';

class ProductService {
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future<ProductModel> getProduct(int productId) async {
    return products.doc('$productId').get().then((value) {
      return ProductModel.fromJson(value);
    });
  }

  Future<List<QueryDocumentSnapshot>> getAllProducts() async {
    QuerySnapshot _snapshot = await products.get();
    return _snapshot.docs;
  }

  Future<void> addProduct(ProductModel _product) async {
    return products.doc('${_product.productId}').set(_product.toJson());
  }

  Future<int> getNoOfItems() async {
    return products.get().then((value) {
      return value.size;
    });
  }
}
