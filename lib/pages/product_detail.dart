import 'package:flutter/material.dart';
import 'home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_picture;
  final product_detail_old_price;
  final product_detail_price;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_picture,
      this.product_detail_old_price,
      this.product_detail_price});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.purple,
        title: InkWell(
          child: Text('DAPUR PAPA EL')),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text(
                        "\$${widget.product_detail_old_price}",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )),
                      Expanded(
                        child: new Text("\$${widget.product_detail_price}",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w800)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

//    ================ FIRS BUTTOM ====================
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Type"),
                        content: new Text("Choose the type"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: new Text("close"),)
                        ],
                      );
                    }
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Type")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),


                Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Color"),
                        content: new Text("Choose the color"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: new Text("close"),)
                        ],
                      );
                    }
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Color")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),


                Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Qty"),
                        content: new Text("Choose the Qty"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: new Text("close"),)
                        ],
                      );
                    }
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Qty")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),


          //    ================ 2ND BUTTOM ====================
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Buy Now"),
                ),
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.red), onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite_border, color: Colors.red), onPressed: (){})
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text("Dapur Papa El merupakan store cake, dessert & drink kekinian yang ada di Singaraja, Dapur Papa El mempunyai dua cabang store, yaitu di Singaraja dan Di Seririt")
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("Product name", style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text(widget.product_detail_name),)
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("Product condition", style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text("New"),)
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Similar products"),
          ),

// ================= SIMILAR PRODUCT SECTION========================

        Container(
          height: 340.0,
          child: Similar_products(),
        )
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
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
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}
class Similar_single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_single_prod({
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

