import 'package:flutter/material.dart';
import 'package:garments/pages/homepage/homepage.dart';
import 'package:garments/pages/my_divider.dart';

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
            icon: Icon(Icons.home),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new HomePage()));
            },
          )
        ],
      ),
      body: Center(
        child: Text("items"),
      ),
    );
  }
}
