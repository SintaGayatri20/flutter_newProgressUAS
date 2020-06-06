import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shared_preferences/shared_preferences.dart';

//own import
import 'package:sweetfood/komponen/horizontal_listview.dart';
import 'package:sweetfood/komponen/products.dart';
import 'package:sweetfood/pages/cart.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'dart:async';

class HomePage extends StatefulWidget {
  final VoidCallback signOut;
  HomePage(this.signOut);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  signOut(){
    setState(() {
      widget.signOut();
    });
  }

  String username = "", nama= "";

  getPref()async{
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
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/m4.png'),
          AssetImage('images/m3.png'),
          AssetImage('images/m2.png'),
          AssetImage('images/m1.png'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.purple,
        title: Text('DAPUR PAPA EL'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //HEADER//
            new UserAccountsDrawerHeader(
              accountName: Text('$nama'),
              accountEmail: Text('$username'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.purple),
            ),

            //BODY//
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(
                  Icons.home,
                  color: Colors.purple,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(
                  Icons.person,
                  color: Colors.purple,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.purple,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              },
              child: ListTile(
                title: Text('Shopping cart'),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.purple,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favorietes'),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.purple,
                ),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {
                signOut();
              },
              child: ListTile(
                title: Text('Log Out'),
                leading: Icon(
                  Icons.backspace,
                  color: Colors.purple,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.purple),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.help,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
      body: new Column(
        children: <Widget>[
          //IMAGE CAROUSEL
          image_carousel,

          //PADDING WIDGET
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.centerLeft, child: new Text('Categories')),
          ),

          //HORIZONTAL LIAST VIEW
          HorizontalList(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),

          Container(
            alignment: Alignment.center,
            child: new Text(
              'RECENT PRODUCTS',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),

          //GRID VIEW
          Flexible(
            child: Products(),
          )
        ],
      ),
    );
  }
}
