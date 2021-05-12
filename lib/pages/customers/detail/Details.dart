import 'package:flutter/material.dart';
import 'package:garments/pages/customers/Edit/edit.dart';
import 'package:garments/pages/customers/Listall/List.dart';
import 'package:garments/pages/customers/api/Service.dart';

import 'Carddetail.dart';
import 'RailNavigate.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final CustomersForm customer = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new CustomerHomeWidget()));
            },
          ),
          centerTitle: true,
          title: Text(customer.name, style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new EditDetails(),
                      settings: RouteSettings(arguments: customer),
                    ));
              },
            )
          ],
        ),
        body: new Column(
          children: <Widget>[
            new CardDetail(),
            Expanded(
              child: new ItemAccount(),
            )
          ],
        ));
  }
}