import 'package:app/screens/product_details_screens.dart';
import 'package:app/store/product_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleProduct extends StatelessWidget {
  final int id;
  final String title;
  final String image;
  final bool favorit;
  SingleProduct({
    this.id,
    this.title,
    this.image,
    this.favorit,
  });
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailsScreens.routeName,
            arguments: id,
          );
        },
        child: Image.asset(
          "assets/images/pg2.jpg",
          fit: BoxFit.cover,
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(
            favorit ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () {
            Provider.of<ProductStore>(context, listen: false).favoritButton(id);
          },
        ),
        title: Text(title),
      ),
    );
  }
}
