import 'package:flutter/material.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/models/product_model.dart';

class SingleProduct extends StatelessWidget {
  final ProductModel product;
  final int index;
  SingleProduct(this.product, this.index);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            child: Hero(
              tag: "Product$index",
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        child: Image.network(
                          product.photoURL,
                          fit: BoxFit.contain,
                          width: w / 2,
                          height: h / 4,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Container(
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: product.name + "\n\n",
                              style: TextStyle(
                                  color: backgroundColor, fontSize: 30)),
                          TextSpan(
                              text: product.description + "\n\n",
                              style: TextStyle(
                                  color: backgroundColor, fontSize: 20)),
                          TextSpan(
                              text: "Rs." + product.price.toString(),
                              style: TextStyle(
                                  color: backgroundColor, fontSize: 50))
                        ])),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
