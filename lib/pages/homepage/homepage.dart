import 'package:flutter/material.dart';
import 'package:garments/pages/customer%20page/formswidget.dart';
import 'package:garments/pages/my_divider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDivider(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Balaji Garments',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new FormsWidget()));
            },
          )
        ],
      ),

      /* Scaffold(
        endDrawerEnableOpenDragGesture: true,
        endDrawer: MyDivider(),
      ),*/
    );
  }
}
