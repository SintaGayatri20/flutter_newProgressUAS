import 'package:flutter/material.dart';
import 'package:sweetfood/pages/product_detail.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "CAKE",
      "picture": "images/product/p1.png",
      "old_price": "120",
      "price": "100",
    },
    {
      "name": "Winnie Cake",
      "picture": "images/product/p2.png",
      "old_price": "300",
      "price": "200",
    },
    {
      "name": "Dessert",
      "picture": "images/product/p3.png",
      "old_price": "800",
      "price": "700",
    },
    {
      "name": "Belle Drink",
      "picture": "images/product/p4.png",
      "old_price": "900",
      "price": "800",
    },
    {
      "name": "Cake",
      "picture": "images/product/p5.png",
      "old_price": "980",
      "price": "700",
    },
    {
      "name": "Cup Cake",
      "picture": "images/product/p6.png",
      "old_price": "990",
      "price": "600",
    },
    {
      "name": "Belle Drink",
      "picture": "images/product/p7.png",
      "old_price": "910",
      "price": "899",
    },
    {
      "name": "Belle Drink",
      "picture": "images/product/p8.png",
      "old_price": "999",
      "price": "900",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text("hero 1"),
          child: Material(
            child: InkWell(
              onTap: () => 
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => new ProductDetails(
                  product_detail_name: prod_name,
                  product_detail_picture: prod_picture,
                  product_detail_old_price: prod_old_price,
                  product_detail_price: prod_price,
                  
                ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white,
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                        ),
                        new Text("\$${prod_price}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                      ],
                    )
                  ),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )
                ),
            ),
          )),
    );
  }
}
