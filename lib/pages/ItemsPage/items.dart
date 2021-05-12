import 'package:flutter/material.dart';

class ItemsPage extends StatefulWidget {
  ItemsPage({Key key}) : super(key: key);

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
      child: ListTile(
        title: Text("Item Name"),
      ),
    ));
  }
}
