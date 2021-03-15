import 'package:flutter/material.dart';

import 'card.dart';
import 'form.dart';

class CustomerHomeWidget extends StatelessWidget {
  const CustomerHomeWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: new Column(children: <Widget>[
          new Container(
            child: Text("Customers Page",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Open Sans',
                    fontSize: 30)),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(10.0),
          ),
          Expanded(
            child: CardWidget(),
          ),
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new FormWidget()));
            },
          ),
        ]));
  }
}
