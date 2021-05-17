import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:garments/pages/customers/Listall/List.dart';
import 'package:garments/pages/customers/api/GSheet.dart';
import 'package:garments/pages/customers/model/Service.dart';
import 'package:garments/pages/customers/detail/customer/Details.dart';

class CardWidget extends StatefulWidget {
  final List<Customer> customer;
  const CardWidget({Key key, @required this.customer}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  List<Customer> allCustomers = List<Customer>();
  var refresh = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    allCustomers = List<Customer>();
    super.initState();

    CustomerService().getCustomersList().then((customers) {
      print("customers :" + customers.toString());
      setState(() {
        this.allCustomers = customers;
      });
    });
  }

  void deleteCustomer(Customer delete) {
    CustomerService customerService = CustomerService();
    customerService.deleteCustomer(delete);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
            key: refresh,
            child: ListView.builder(
                itemCount: allCustomers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: ListTile(
                    title: Text(
                      allCustomers[index].name,
                      //Customer.getCustomers().elementAt(index).name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      allCustomers[index].phoneNumber,
                      // Customer.customers[index].phoneNumber,
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new DetailsPage(),
                            settings:
                                RouteSettings(arguments: allCustomers[index]),
                          ));
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: Text(
                                      "would you like to delete the customer"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("No"),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        deleteCustomer(allCustomers[index]);
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
            onRefresh: () {
              refreshlist();
            }));
  }

  Future<Null> refreshlist() async {
    refresh.currentState?.show(atTop: true);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new CustomerHomeWidget()));
    });
  }
}
