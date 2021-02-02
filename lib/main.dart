import 'package:app/screens/favorit_Screens.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/login.dart';
import 'package:app/screens/product_details_screens.dart';
import 'package:app/screens/profile_screens.dart';
import 'package:app/screens/register.dart';
import 'package:app/store/product_store.dart';
import 'package:app/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalStorage storage = new LocalStorage('usertoken');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductStore()),
        ChangeNotifierProvider(create: (context) => UserStore()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecom.com',
        theme: ThemeData(
          primaryColor: Colors.deepOrangeAccent,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: LoginScrrens.routeName,
        home: FutureBuilder(
          future: storage.ready,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (storage.getItem('token') == null) {
              return LoginScrrens();
            }
            return Home();
          },
        ),
        routes: {
          Home.routename: (ctx) => Home(),
          ProductDetailsScreens.routeName: (ctx) => ProductDetailsScreens(),
          ProfileScreens.routeName: (ctx) => ProfileScreens(),
          FavoritScreens.routeName: (ctx) => FavoritScreens(),
          LoginScrrens.routeName: (ctx) => LoginScrrens(),
          RegisterScreens.routeName: (ctx) => RegisterScreens(),
        },
      ),
    );
  }
}
