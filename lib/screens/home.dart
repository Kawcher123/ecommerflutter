import 'package:app/models/carosoul.dart';
import 'package:app/screens/category_products.dart';
import 'package:app/screens/product_details.dart';
import 'package:app/store/cart_state.dart';
import 'package:app/store/product_store.dart';
import 'package:app/store/user_store.dart';
import 'package:app/widgets/drower_app.dart';
import 'package:app/widgets/single_Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const routename = "/home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _init = true;
  bool _isloading = false;
  int _current = 0;
  @override
  void didChangeDependencies() async {
    if (_init) {
      Provider.of<CartState>(context).getCartDatas();
      Provider.of<CartState>(context).getoldOrders();
      _isloading =
          await Provider.of<ProductStore>(context, listen: false).getProduct();
      Provider.of<UserStore>(context, listen: false).getUserData();
      setState(() {});
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
          actions: [
            IconButton(
              onPressed: () {
                //Navigator.of(context).pushNamed(CartScreens.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ],
        ),
        drawer: DrowerApp(),
        body: ListView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 16,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carosal.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(carosal[index].image),
                                  fit: BoxFit.cover)),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    "Our Top Collections ",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(CategoryProducts.routename),
              child: Container(
                height: 150,
                //margin: EdgeInsets.only(left: 4, right: 4),
                color: Colors.white,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 10.0),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildCategory(context, "categories");
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    "Featured Products ",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ),
            Container(
              height: 250,
              //margin: EdgeInsets.only(left: 4, right: 4),
              color: Colors.white,
              child: _isloading
                  ? ListView.builder(
                      padding: EdgeInsets.only(left: 10.0),
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = products[index];
                        return SingleProduct(
                          id: data.id,
                          title: data.title,
                          marcketPrice: data.marcketPrice,
                          sellingPrice: data.sellingPrice,
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
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    "Hot Deals ",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              color: Colors.white,
              //margin: EdgeInsets.only(left: 4, right: 4),
              child: ListView.builder(
                padding: EdgeInsets.only(left: 10.0),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return _buildCategory(context, "Hot Deals");
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    "New Arrivals ",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              //margin: EdgeInsets.only(left: 4, right: 4),
              color: Colors.white,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 10.0),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return _buildCategory(context, "Hot Deals");
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  _buildCategory(BuildContext context, String order) {
    return Container(
      width: 180,
      height: 150,
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
            height: 80.0,
            //width: 100.0,
            image: AssetImage("assets/images/2.png"),
            fit: BoxFit.cover,
          ),
          Text(
            order,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
