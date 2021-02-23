import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_app/models/product_model.dart';
import 'package:login_app/services/product_service.dart';
import 'dart:async';

class ProductController {
  ProductService _productService = ProductService();

  Future<ProductModel> getProduct(int productId) {
    return _productService.getProduct(productId);
  }

  Future<void> addProduct(ProductModel _product) {
    return _productService.addProduct(_product);
  }

  Future<int> getNoItems() {
    return _productService.getNoOfItems();
  }

  Future<List<QueryDocumentSnapshot>> getAllProducts() {
    return _productService.getAllProducts();
  }
}
