import 'package:flutter/material.dart';
import 'package:garments/pages/homepage/homepage.dart';
import 'package:garments/pages/my_divider.dart';

import 'card.dart';
import 'form.dart';
import 'search.dart';

class CustomerHomeWidget extends StatelessWidget {
  CustomerHomeWidget({Key key}) : super(key: key);
  final TextEditingController searchbox = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDivider(),
      appBar: AppBar(
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
        new Container(
          child: Text("Customers Page",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Open sans',
                  fontSize: 30)),
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(10.0),
        ),
        new SearchWidget(),
        Expanded(
          child: CardWidget(),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new Forms()));
        },
      ),
    );
  }
}
