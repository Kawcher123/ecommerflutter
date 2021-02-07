import 'package:flutter/material.dart';

class CategoryProducts extends StatefulWidget {
  static const routename = "/categoryproduct";
  @override
  _CategoryProductsState createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 320,
                width: MediaQuery.of(context).size.width,
                image: AssetImage("assets/images/1.png"),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 20.0),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.deepOrange,
                    size: 30.0,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                bottom: 20,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Category Products",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(5, (index) {
                return _buildCategoryProduct("food");
              }),
            ),
          )
        ],
      ),
    );
  }

  _buildCategoryProduct(String menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/2.png"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15.0)),
          ),
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black87.withOpacity(0.3),
                      Colors.black54.withOpacity(0.3),
                      Colors.black38.withOpacity(0.3),
                    ])),
          ),
          Positioned(
            bottom: 65.0,
            child: Column(
              children: [
                Text(
                  menuItem,
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                ),
                Text(
                  '\$${menuItem}',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Theme.of(context).primaryColor,
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
