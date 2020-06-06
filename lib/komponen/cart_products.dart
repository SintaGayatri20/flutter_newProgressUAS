import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var products_on_the_cart = [
    {
      "name": "Winnie Cake",
      "picture": "images/product/p2.png",
      "price": 100,
    },
    {
      "name": "Cup Cake",
      "picture": "images/product/p6.png",
      "price": 100,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: products_on_the_cart[index]["name"],
            cart_prod_picture: products_on_the_cart[index]["picture"],
            cart_prod_price: products_on_the_cart[index]["price"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;

  Single_cart_product(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      }
    );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        
// ================ LEADING SECTION ================
        leading: new Image.asset(cart_prod_picture, width: 80.0, height: 80.0,),

// ================== TITLE SECTION =================
        title: new Text(cart_prod_name),

// =================== SUBTITLE SECTION =================
        subtitle: new Column(
          children: <Widget>[
             
//    ============= PRODUCT PRICE =================
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${cart_prod_price}", 
                style: TextStyle(
                  fontSize: 15.0, 
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        // trailing: new Column(
        //   children: <Widget>[
        //     new IconButton(
        //       icon: Icon(Icons.arrow_drop_up),
        //       onPressed: (){},
        //     ),
        //     new Text("$cart_prod_quantity"),
        //     new IconButton(
        //       icon: Icon(Icons.arrow_drop_down),
        //       onPressed: (){},
        //     ),
        //   ],
        // ),
      ),
    );

  }
}
