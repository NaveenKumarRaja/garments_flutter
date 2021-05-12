import 'package:flutter/material.dart';
import 'package:garments/pages/customers/Listall/List.dart';

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
