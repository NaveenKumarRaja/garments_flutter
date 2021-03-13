import 'package:flutter/material.dart';
import 'package:garments/pages/my_divider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text("garments"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: Scaffold(
        drawer: MyDivider(),
      ),
    );
  }
}

class CenterMenu extends StatefulWidget {
  CenterMenu({Key key}) : super(key: key);

  @override
  _CenterMenuState createState() => _CenterMenuState();
}

class _CenterMenuState extends State<CenterMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
      onPressed: () {},
      color: Colors.orangeAccent,
      icon: Icon(Icons.star),
      disabledColor: Colors.grey,
      highlightColor: Colors.black38,
    ));
  }
}
