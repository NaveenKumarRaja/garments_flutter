import 'package:flutter/material.dart';
import 'package:garments/pages/customer%20page/customerhome.dart';
import 'package:garments/pages/homepage.dart';

class MyDivider extends StatefulWidget {
  MyDivider({Key key}) : super(key: key);

  @override
  _MyDividerState createState() => _MyDividerState();
}

class _MyDividerState extends State<MyDivider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
      child: new Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF3366FF),
              const Color(0xFF00CCFF),
            ],
          ),
        ),
        child: new ListView(
          children: <Widget>[
            new ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new HomePage()));
              },
            ),
            new ListTile(
              leading: Icon(Icons.person),
              title: Text('Customers'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new CustomerHomeWidget()));
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_outlined),
              title: Text('Items'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new HomePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Account Details'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new HomePage()));
              },
            ),
            Divider(
              height: 15,
              thickness: 20,
            )
          ],
        ),
      ),
    ));
  }
}
