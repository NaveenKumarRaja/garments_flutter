import 'package:flutter/material.dart';
import 'package:garments/pages/customer%20page/customerhome.dart';

import 'customerlist.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: Customer.getCustomers().length,
          itemBuilder: (context, index) {
            return Container(
                child: ListTile(
              leading: CircleAvatar(radius: 20),
              title: Text(
                Customer.getCustomers().elementAt(index).name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                Customer.customers[index].phoneNumber,
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return AlertDialog(
                            title:
                                Text("would you like to delete the customer"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("No"),
                              ),
                              FlatButton(
                                onPressed: () {
                                  setState(() {
                                    Customer.customers.removeAt(index);
                                  });
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new CustomerHomeWidget()));
                                },
                                child: Text("Yes"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ));
          }),
    );
  }
}
