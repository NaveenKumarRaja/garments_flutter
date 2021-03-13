import 'package:flutter/material.dart';

class MyDivider extends StatefulWidget {
  MyDivider({Key key}) : super(key: key);

  @override
  _MyDividerState createState() => _MyDividerState();
}

class _MyDividerState extends State<MyDivider> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Item1'),
              )
            ],
          ),
        ),
      ),
    );

    /*child: new ListView(children: <Widget>[
          new ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new HomePage()));
            },
          ),
        ]));*/
  }
}
