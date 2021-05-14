import 'package:flutter/material.dart';
import 'package:garments/pages/Items/create/Create.dart';
import 'package:garments/pages/Items/list/ListCard.dart';
import 'package:garments/pages/home/Drawer.dart';

class ItemsHome extends StatelessWidget {
  const ItemsHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDivider(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Items",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new CreateItem()));
            },
          )
        ],
      ),
      body: Center(
        child: ItemsPage(),
      ),
    );
  }
}
