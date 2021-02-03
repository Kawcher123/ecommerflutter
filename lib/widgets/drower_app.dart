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
      child: Column(
        children: [
          AppBar(
            title: Text("Welcome"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            trailing: Icon(
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
            trailing: Icon(
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
            trailing: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            title: Text("Favorites"),
          ),
          Spacer(),
          ListTile(
            onTap: () {
              logoutNew();
            },
            trailing: Icon(Icons.logout),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
