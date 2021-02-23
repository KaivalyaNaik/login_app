import 'package:flutter/material.dart';
import 'package:login_app/Controllers/ProductController.dart';
import 'package:login_app/components/SingleProduct.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/models/product_model.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    return Container(
        color: primaryColor,
        child: Stack(
          children: [
            FutureBuilder(
                future: ProductController().getAllProducts(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          ProductModel _product =
                              ProductModel.fromSnapshot(snapshot.data[index]);
                          print(_product.photoURL);
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SingleProduct(_product, index)));
                            },
                            child: Container(
                                height: h / 5,
                                width: w - 20,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Hero(
                                          tag: "Product${index}",
                                          child: ClipRRect(
                                            child: Image.network(
                                              _product.photoURL,
                                              height: h / 8,
                                              width: w / 3,
                                              fit: BoxFit.contain,
                                            ),
                                            clipBehavior: Clip.hardEdge,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                              "Rs.${_product.price.toString()}",
                                              style: TextStyle(
                                                  color: backgroundColor,
                                                  fontSize: 30),
                                            ),
                                            Text(
                                              "${_product.name}",
                                              style: TextStyle(
                                                  color: backgroundColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              _product.description,
                                              style: TextStyle(
                                                  color: backgroundColor,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Divider(
                                      color: Colors.grey[100],
                                      height: h / 100,
                                      thickness: 3,
                                    )
                                  ],
                                )),
                          );
                        });
                  }
                  return Center(child: CircularProgressIndicator());
                }),
            Positioned(
              child: FloatingActionButton(
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.refresh,
                    color: backgroundColor,
                  ),
                  onPressed: () {
                    setState(() {});
                  }),
              right: 10,
              top: 10,
            )
          ],
        ));
  }
}
