import 'package:app/store/product_store.dart';
import 'package:app/widgets/drower_app.dart';
import 'package:app/widgets/single_Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritScreens extends StatelessWidget {
  static const routeName = '/favorit-screens';
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductStore>(context).favorites;
    return Scaffold(
      drawer: DrowerApp(),
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, i) {
          var data = products[i];
          return SingleProduct(
            id: data.id,
            title: data.title,
            marcketPrice: data.marcketPrice,
            sellingPrice: data.sellingPrice,
            image: "assets/images/pg2.jpg", //image1,
            favorit: data.favorit,
          );
        },
      ),
    );
  }
}
