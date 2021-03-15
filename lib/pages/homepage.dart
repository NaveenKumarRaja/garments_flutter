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
        title: Text(
          'Garments',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        leading: GestureDetector(
          child: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new HomePage()));
            },
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Scaffold(
        drawer: MyDivider(),
      ),
    );
  }
}
