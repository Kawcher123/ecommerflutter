import 'package:app/screens/favorit_Screens.dart';
import 'package:app/screens/login.dart';
import 'package:app/screens/profile_screens.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class DrowerApp extends StatefulWidget {
  @override
  _DrowerAppState createState() => _DrowerAppState();
}

class _DrowerAppState extends State<DrowerApp> {
  LocalStorage storage = LocalStorage("usertoken");
  logoutNew() async {
    await storage.clear();
    Navigator.of(context).pushReplacementNamed(LoginScrrens.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              height: 200,
              color: Colors.deepOrange,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Ecom Online Shopping",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(ProfileScreens.routeName);
              },
              leading: Icon(
                Icons.supervised_user_circle,
                color: Colors.black,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(FavoritScreens.routeName);
              },
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: Text("Favorites"),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text("Setting"),
            ),
            ListTile(
              onTap: () {
                logoutNew();
              },
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
