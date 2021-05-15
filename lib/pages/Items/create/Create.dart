import 'package:flutter/material.dart';
import 'package:garments/pages/Items/api/Sheet.dart';
import 'package:garments/pages/Items/itemshome.dart';
import 'package:garments/pages/Items/model/Item.dart';

class CreateItem extends StatefulWidget {
  CreateItem({Key key}) : super(key: key);

  @override
  _CreateItemState createState() => _CreateItemState();
}

class _CreateItemState extends State<CreateItem> {
  TextEditingController itemName = TextEditingController();
  void add() {
    Items addItems = Items(itemName.text, false);

    ItemSheet item = ItemSheet();

    item.add(addItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Add Item"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp),
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new ItemsHome()));
            },
          ),
        ),
        body: Form(
            child: new ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                children: <Widget>[
              SizedBox(
                height: 50,
              ),
              TextFormField(
                  controller: itemName,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.shopping_cart),
                      hintText: "Enter Item Name",
                      labelText: "Item Name")),
              Container(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 110),
                child: new RaisedButton(
                    onPressed: () {
                      add();
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new ItemsHome()));
                    },
                    child: Text('Add'),
                    color: Colors.blue,
                    textColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    splashColor: Colors.white),
              ),
            ])));
  }
}
