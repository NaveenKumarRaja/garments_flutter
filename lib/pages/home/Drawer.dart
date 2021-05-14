import 'package:flutter/material.dart';
import 'package:garments/pages/Items/itemshome.dart';
import 'package:garments/pages/Accounts/Bank.dart';
import 'package:garments/pages/customers/Listall/List.dart';
import 'package:garments/pages/home/BalajiGarments.dart';

class MyDivider extends StatefulWidget {
  MyDivider({
    Key key,
  }) : super(key: key);

  @override
  _MyDividerState createState() => _MyDividerState();
}

class _MyDividerState extends State<MyDivider> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            decoration: BoxDecoration(),
            child: UserAccountsDrawerHeader(
              accountName: Text("BalajiGarments"),
              accountEmail: Text("balajigarments@gmail.com"),
              currentAccountPicture: const CircleAvatar(
                child: FlutterLogo(size: 35.0),
              ),
            ),
          ),
          new ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new HomePage()));
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
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new ItemsHome()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Account Details'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Account()));
            },
          ),
        ],
      ),
    );
  }
}
