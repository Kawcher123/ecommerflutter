import 'dart:convert';

import 'package:app/models/product1.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

class ProductStore with ChangeNotifier {
  List<Product> _products = [];
  LocalStorage storage = new LocalStorage('usertoken');
  Future<bool> getProduct() async {
    String url = "http://ecomecoomerce.herokuapp.com/api/products/";
    var token = storage.getItem('token');

    try {
      http.Response response =
          await http.get(url, headers: {"Authorization": 'token ${token}'});

      if (response.statusCode == 200) {
        final jsonproduct = jsonDecode(response.body);
        List<Product> newList = [];
        // print(response.statusCode);

        for (var item in jsonproduct) {
          //print(Product.fromJson(item));
          newList.add(Product.fromJson(item));
        }
        _products = newList;
        notifyListeners();
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  List<Product> get products {
    return [..._products];
  }

  Product singleProduct(int id) {
    return _products.firstWhere((element) => element.id == id);
  }

  List<Product> get favorites {
    return _products.where((element) => element.favorit == true).toList();
  }

  Future<void> favoritButton(int id) async {
    String url = 'http://ecomecoomerce.herokuapp.com/api/favorit/';
    var token = storage.getItem('token');

    try {
      http.Response response = await http.post(url,
          body: json.encode({
            'id': id,
          }),
          headers: {
            "Content-Type": "application/json",
            'Authorization': "token ${token}"
          });
      // var data = json.decode(response.body);
      // print(data);
      getProduct();
    } catch (e) {
      print("e favoritButton");
      print(e);
    }
  }
}
