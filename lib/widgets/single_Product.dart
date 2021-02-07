import 'package:app/screens/product_details.dart';
import 'package:app/screens/product_details_screens.dart';
import 'package:app/store/product_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleProduct extends StatelessWidget {
  final int id;
  final String title;
  final int marcketPrice;
  final int sellingPrice;
  final String image;
  final bool favorit;
  SingleProduct({
    this.id,
    this.title,
    this.marcketPrice,
    this.sellingPrice,
    this.image,
    this.favorit,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailPage.routeName,
            arguments: id,
          );
        },
        child: Stack(
          children: [
            Container(
              width: 180,
              height: 250,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0)
                  ],
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[200],
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    height: 140.0,
                    //width: 100.0,
                    image: AssetImage("assets/images/pg2.jpg"),
                    fit: BoxFit.cover,
                  ),
                  Text(
                    title,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "BDT $sellingPrice",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  favorit ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {
                  Provider.of<ProductStore>(context, listen: false)
                      .favoritButton(id);
                },
                iconSize: 30,
              ),
            ),
          ],
        ));
  }
}
