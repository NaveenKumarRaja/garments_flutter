import 'package:flutter/material.dart';

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
        color: Colors.lightGreenAccent,
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Card(
            child: new ListTile(
              leading: new Icon(Icons.search),
              title: new TextField(
                controller: searchBox,
                decoration: new InputDecoration(
                    hintText: 'Search', border: InputBorder.none),
              ),
              trailing: new IconButton(
                  icon: new Icon(Icons.cancel), onPressed: () {}),
            ),
          ),
        ),
      ),
    ]);
  }
}
