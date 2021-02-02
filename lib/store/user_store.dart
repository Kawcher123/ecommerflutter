import 'dart:convert';

import 'package:app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';

class UserStore with ChangeNotifier {
  LocalStorage storage = LocalStorage("usertoken");

  User _user;

  Future<void> getUserData() async {
    String url = 'http://ecomecoomerce.herokuapp.com/api/user/';
    var token = storage.getItem('token');
    try {
      http.Response response =
          await http.get(url, headers: {"Authorization": 'token ${token}'});
      if (response.statusCode == 200) {
        //print(response.body);
        var data = json.decode(response.body);
        // print(data["id"]);
        User newUser = User(
          id: data['id'],
          username: data['username'],
          firstName: data['first_name'],
          lastName: data['last_name'],
          email: data['email'],
        );
        print(newUser);
        //print(response.statusCode);
        _user = newUser;
      }
    } catch (e) {
      print(e);
    }
  }

  User get user {
    return _user;
  }

  Future<bool> loginNow(String uname, String passw) async {
    String url = 'http://ecomecoomerce.herokuapp.com/api/login/';
    try {
      http.Response response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({"username": uname, "password": passw}));
      var data = json.decode(response.body) as Map;

      if (data.containsKey("token")) {
        storage.setItem("token", data['token']);
        print(storage.getItem('token'));
        return true;
      }
      return false;
    } catch (e) {
      print("e loginNow");
      print(e);
      return false;
    }
  }

  Future<bool> registernow(String uname, String passw) async {
    String url = 'http://ecomecoomerce.herokuapp.com/api/register/';
    try {
      http.Response response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({"username": uname, "password": passw}));
      var data = json.decode(response.body) as Map;
      print(data);
      if (data["error"] == false) {
        return true;
      }
      return false;
    } catch (e) {
      print("e loginNow");
      print(e);
      return false;
    }
  }
}
