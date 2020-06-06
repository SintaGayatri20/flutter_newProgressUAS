import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweetfood/viewsAdmin/home.dart';
import 'package:sweetfood/viewsAdmin/product.dart';
import 'package:sweetfood/viewsAdmin/profile.dart';
import 'package:sweetfood/viewsAdmin/users.dart';

class AdminPage extends StatefulWidget {
  final VoidCallback signOut;
  AdminPage(this.signOut);
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  String username = "", nama = "";
  TabController tabController;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username");
      nama = preferences.getString("nama");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.purple,
          title: Text('DAPUR PAPA EL'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.lock_open, color: Colors.white),
                onPressed: () {
                  signOut();
                }),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Home(),
            Product(),
            Users(),
            Profile(),
          ],
        ),
        bottomNavigationBar: TabBar(
          labelColor: Colors.purple,
          unselectedLabelColor: Colors.grey,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              style: BorderStyle.none
            )
          ),
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.apps),
              text: "Product",
            ),
            Tab(
              icon: Icon(Icons.group),
              text: "Users",
            ),
            Tab(
              icon: Icon(Icons.account_circle),
              text: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
