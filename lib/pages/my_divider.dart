import 'package:flutter/material.dart';

class MyDivider extends StatefulWidget {
  MyDivider({Key key}) : super(key: key);

  @override
  _MyDividerState createState() => _MyDividerState();
}

class _MyDividerState extends State<MyDivider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
