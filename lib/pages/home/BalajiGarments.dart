import 'package:flutter/material.dart';
import 'package:garments/pages/home/Drawer.dart';

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
      ),

      /* Scaffold(
        endDrawerEnableOpenDragGesture: true,
        endDrawer: MyDivider(),
      ),*/
    );
  }
}
