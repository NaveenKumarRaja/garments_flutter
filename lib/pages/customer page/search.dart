import 'package:flutter/material.dart';

import 'customerhome.dart';
import 'customerlist.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({Key key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController searchBox = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new Container(
        color: Colors.white,
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Card(
            child: new ListTile(
              leading: new Icon(Icons.search),
              title: new TextField(
                controller: searchBox,
                decoration: new InputDecoration(
                    hintText: 'Search', border: InputBorder.none),
                onSubmitted: (t) {
                  Customer.searchString = toString();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new CustomerHomeWidget()));
                },
              ),
              trailing: new IconButton(
                icon: new Icon(Icons.cancel),
                onPressed: () {
                  searchBox.clear();
                  Customer.searchString = null;
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new CustomerHomeWidget()));
                },
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
