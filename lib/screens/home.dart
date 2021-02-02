import 'package:app/store/product_store.dart';
import 'package:app/store/user_store.dart';
import 'package:app/widgets/drower_app.dart';
import 'package:app/widgets/single_Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const routename = "/home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _init = true;
  bool _isloading = false;
  @override
  void didChangeDependencies() async {
    if (_init) {
      _isloading =
          await Provider.of<ProductStore>(context, listen: false).getProduct();
      Provider.of<UserStore>(context, listen: false).getUserData();
    }
    _init = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductStore>(context).products;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ecom Online Shopping"),
      ),
      drawer: DrowerApp(),
      body: _isloading
          ? GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                //childAspectRatio: 3 / 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemCount: products.length,
              itemBuilder: (ctx, i) {
                var data = products[i];

                var image1 = "http://ecomecoomerce.herokuapp.com" + data.image;
                return SingleProduct(
                  id: data.id,
                  title: data.title,
                  image: "assets/images/pg2.jpg", //image1,
                  favorit: data.favorit,
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            ),
    );
  }
}
