import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garments/pages/customer%20page/customerhome.dart';
import 'package:garments/save%20and%20get/get_customers.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'customerlist.dart';

//import 'customerlist.dart';

class CardWidget extends StatefulWidget {
  final String name, phoneNumber, phoneNo, address, city;
  CardWidget(
      {this.name, this.phoneNumber, this.phoneNo, this.address, this.city});

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  List<CustomerList> customer = List<CustomerList>();

  getCustomerListFromSheet() async {
    var list = await http.get(
        "https://script.google.com/macros/s/AKfycbyDPfD5aMVQprFvgKKD8inVa2DxiH6Ni-JcGxNye8F2ToP0OdgA/exec");

    var jsonCustomer = convert.jsonDecode(list.body);
    // print('this is json Customer $jsonCustomer');

    jsonCustomer.forEach((element) {
      // print('$element THIS IS NEXT>>>>>>>>');
      CustomerList customerList = new CustomerList();
      customerList.name = element['name'];
      customerList.phoneNumber = element['phoneNumber'];
      customerList.phoneNo = element['phoneNo'];
      customerList.address = element['address'];
      customerList.city = element['city'];
      customer.add(customerList);

      // print('customer length: ${customer.length}');
    });
    //customer = jsonCustomer.map((json) => CustomerList.fromJson(json));

    //print('${customer[0]}');
  }

  @override
  void initState() {
    getCustomerListFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          /*  itemCount: customer.length,
        itemBuilder: (context, index),{
          return Container (

            name:customer[index].name,
            phoneNumber:customer[index].phoneNumber,
            phoneNo:customer[index].phoneNo,
            address:customer[index].address,
            city:customer[index].city
          )*/
          itemCount: Customer.getCustomers().length, //customer.length,
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
                                    //customer.removeAt(index);
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
