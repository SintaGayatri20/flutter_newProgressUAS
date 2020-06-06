import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Kategori(
              image_location: 'images/cats/cake.png',
              image_caption: 'cake',
          ),
          Kategori(
              image_location: 'images/cats/dessert.png',
              image_caption: 'dessert',
          ),
          Kategori(
              image_location: 'images/cats/drink.png',
              image_caption: 'drink',
          ),
        ],
      ),
    );
  }
}

class Kategori extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Kategori({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 50.0,
              height: 50.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption, style: new TextStyle(fontSize: 12.0),),
            ),
          ),
        ),
      ),
    );
  }
}
