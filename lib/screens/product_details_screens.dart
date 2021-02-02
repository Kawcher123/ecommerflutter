import 'package:app/store/product_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreens extends StatelessWidget {
  static const routeName = '/product-details-screens';
  @override
  Widget build(BuildContext context) {
    final prodId = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<ProductStore>(context).singleProduct(prodId);
    print(prodId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: ListView(
        children: [
          Image.asset(
            "assets/images/pg2.jpg",
            height: 200,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Product Name : ${product.title}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    "Product Price : ",
                    style: TextStyle(fontSize: 20),
                  ),
                  product.sellingPrice != null
                      ? Row(
                          children: [
                            Stack(
                              children: [
                                Text(
                                  "${product.marcketPrice}",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Positioned(
                                  bottom: 10,
                                  top: 0,
                                  child: Text("---------"),
                                )
                              ],
                            ),
                            Text(
                              "${product.sellingPrice}",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        )
                      : Text(
                          "${product.marcketPrice}",
                          style: TextStyle(fontSize: 20),
                        ),
                ],
              )),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Descriptions: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(product.description),
                Text(product.description),
                Text(product.description),
              ],
            ),
          ),
          RaisedButton.icon(
            color: Colors.green,
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            label: Text(
              "Add To Cart",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
