import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garments/save%20and%20get/controller.dart';
import 'package:garments/save and get/controller.dart';
import 'package:garments/save%20and%20get/saved_details.dart';
import 'customerhome.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  List<CustomersForm> customer = List<CustomersForm>();

  void Function(String p1) get callback => null;

  @override
  void initState() {
    super.initState();

    FormController(this.callback).getCustomersList().then((customer) {
      setState(() {
        this.customer = customer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: customer.length,
          itemBuilder: (context, index) {
            return Container(
                child: ListTile(
              leading: CircleAvatar(radius: 20),
              title: Text(
                customer[index].name,
                //Customer.getCustomers().elementAt(index).name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                customer[index].phoneNumber,
                //Customer.customers[index].phoneNumber,
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
                                    customer.removeAt(index);
                                    // Customer.customers.removeAt(index);
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

/* @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' '),
      ),
      body: ListView.builder(
        itemCount: customer.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.person),
                Expanded(
                  child: Text(
                      "${customer[index].name} "),
                )
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                Icon(Icons.phone),
                Expanded(
                  child: Text(customer[index].phoneNumber),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}







/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garments/pages/customer%20page/customerhome.dart';
//import 'package:garments/save%20and%20get/get_customers.dart';
//import 'package:garments/save%20and%20get/get_customers.dart';

//import 'dart:convert' as convert;
//import 'package:http/http.dart' as http;

import 'customerlist.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  /* List<CustomerList> customer = List<CustomerList>();

  @override
  void initState() {
    super.initState();

    CustomerList().getFeedbackList().then((customer) {
      setState(() {
        this.customer = customer;
      });
    });
  }*/

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
                // customer[index].name,
                Customer.getCustomers().elementAt(index).name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                //customer[index].phoneNumber,
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
*/*/
