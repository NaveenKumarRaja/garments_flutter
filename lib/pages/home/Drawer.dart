import 'package:flutter/material.dart';
import 'package:garments/pages/Items/itemshome.dart';
import 'package:garments/pages/customers/Listall/List.dart';
import 'package:garments/pages/home/BalajiGarments.dart';

class MyDivider extends StatefulWidget {
  MyDivider({Key key, Container drawer}) : super(key: key);

  @override
  _MyDividerState createState() => _MyDividerState();
}

class _MyDividerState extends State<MyDivider> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 610,
        width: 200,
        color: Colors.white,
        child: Drawer(
          child: new Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.white,
              ],
            )),
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
                            builder: (context) => new ItemsHome()));
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
              ],
            ),
          ),
        ));

    /*Scaffold(
      drawer: Container(
        height: 400,
        width: 200,
        child: new Drawer(
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
      ),
    );*/
  }
}
