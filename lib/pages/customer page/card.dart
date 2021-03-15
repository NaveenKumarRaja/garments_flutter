import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            title: Text('and'),
            subtitle: Text('9845787460'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            title: Text('kij'),
            subtitle: Text('987644354'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            title: Text('Arun'),
            subtitle: Text('984508746'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            title: Text('Kg'),
            subtitle: Text('987578746'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            title: Text('Navi'),
            subtitle: Text('984878746'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            title: Text('Kumar'),
            subtitle: Text('994578746'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}
