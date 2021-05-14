import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garments/pages/customers/Listall/Card.dart';
import 'package:garments/pages/customers/Listall/Search.dart';
import 'package:garments/pages/customers/create/Create.dart';
import 'package:garments/pages/home/BalajiGarments.dart';
import 'package:garments/pages/home/Drawer.dart';

import 'Card.dart';
import 'Search.dart';

class CustomerHomeWidget extends StatelessWidget {
  CustomerHomeWidget({Key key}) : super(key: key);
  final TextEditingController searchbox = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDivider(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Customers ",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new HomePage()));
            },
          )
        ],
      ),
      body: new Column(children: <Widget>[
        new SearchWidget(),
        // new Refresh(),
        Expanded(
          child: new CardWidget(
            customer: [],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new FormsWidget()));
        },
      ),
    );
  }
}
