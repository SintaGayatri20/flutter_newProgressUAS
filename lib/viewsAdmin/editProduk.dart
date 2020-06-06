import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sweetfood/modal/api.dart';
import 'package:sweetfood/modal/produkModel.dart';
import 'package:http/http.dart' as http;

class EditProduk extends StatefulWidget {
  final ProdukModel model;
  final VoidCallback reload;
  EditProduk(this.model, this.reload);

  @override
  _EditProdukState createState() => _EditProdukState();
}

class _EditProdukState extends State<EditProduk> {
  final _key = new GlobalKey<FormState>();
  String namaProduk, qty, harga;

  TextEditingController txtNama, txtQty, txtHarga;

  setup(){
    txtNama = TextEditingController(text: widget.model.namaProduk);
    txtQty = TextEditingController(text: widget.model.qty);
    txtHarga = TextEditingController(text: widget.model.harga);
  }

  check(){
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      submit();
    } else {
    }
  }

  submit()async{
    final response = await http.post(BaseUrl.editProduk, body: {
      "namaProduk" : namaProduk,
      "qty" : qty,
      "harga" : harga,
      "idProduk" : widget.model.id
    });

    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    if (value == 1) {
      setState(() {
        widget.reload();
        Navigator.pop(context);
      });
    } else {
      print(pesan);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.purple,
        title: Text('EDIT PRODUCT'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {})
        ],
      ),
      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: txtNama,
              onSaved: (e) => namaProduk = e,
              decoration: InputDecoration(labelText: 'Name of Produk'),
            ),
            TextFormField(
              controller: txtQty,
              onSaved: (e) => qty = e,
              decoration: InputDecoration(labelText: 'Qty'),
            ),
            TextFormField(
              controller: txtHarga,
              onSaved: (e) => harga = e,
              decoration: InputDecoration(labelText: 'Price'),
            ),

            MaterialButton(
              onPressed: (){
                check();
              },
              child: Text("SUBMIT"),
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}