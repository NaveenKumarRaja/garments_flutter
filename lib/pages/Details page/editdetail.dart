import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:garments/pages/Details%20page/detailspage.dart';
import 'package:garments/pages/customer%20page/customerlist.dart';
import 'package:garments/save%20and%20get/controller.dart';
import 'package:garments/save%20and%20get/saved_details.dart';

class EditDetails extends StatefulWidget {
  EditDetails({Key key}) : super(key: key);

  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  final _form = GlobalKey<FormState>();
  final _scafold = GlobalKey<ScaffoldState>();

  List<CustomersForm> customer = List<CustomersForm>();

  TextEditingController sNo = TextEditingController();
  TextEditingController name;
  TextEditingController phoneNumber;
  TextEditingController phoneNo;
  TextEditingController address;
  TextEditingController city;

  get response => null;
  @override
  void initState() {
    super.initState();
    name = new TextEditingController();
    phoneNumber = new TextEditingController();
    phoneNo = new TextEditingController();
    address = new TextEditingController();
    city = new TextEditingController();
  }

  void _submitForm() {
    if (_form.currentState.validate()) {
      CustomersForm customersForm = CustomersForm(
          name.text, phoneNumber.text, phoneNo.text, address.text, city.text);
      FormController formController = FormController((String response) {
        print(response);
        if (response == null) {
          _showSnackBar("CustomersForm Submitted");
        } else {
          _showSnackBar("Error Occured");
        }
      });
      _showSnackBar("Submiiting Customer");
      formController.submitForm(customersForm);
    }
    setState(() {
      String jsonsDataString = response.toString();
      customer = jsonDecode(jsonsDataString);
      print(customer.toString());
    });
  }

  _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    _scafold.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final CustomersForm customer = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: _scafold,
      appBar: AppBar(
        //title: Text(customer.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(),
                  settings: RouteSettings(arguments: customer),
                ));
          },
        ),
      ),
      body: Center(
          child: new ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          TextFormField(
            initialValue: customer.name,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.person),
                hintText: 'Enter your name',
                labelText: 'Name'),
            onChanged: (String value) {
              name = value as TextEditingController;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter name';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            initialValue: customer.phoneNumber,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: const Icon(Icons.phone),
                hintText: 'Enter your phone number',
                labelText: 'Phone'),
            maxLength: 10,
            inputFormatters: [],
            keyboardType: TextInputType.phone,
            onChanged: (String value) {
              phoneNumber = value as TextEditingController;
            },
            validator: (String value) {
              String patttern = r'^(?:[6-9])?[0-9]{10,12}$';
              RegExp regExp = new RegExp(patttern);
              if (value.length == 0) {
                return "Mobile is Required";
              } else if (value.length != 10) {
                return "Mobile number must 10 digits";
              } else if (!regExp.hasMatch(value)) {
                return "Mobile Number must be digits";
              }
              return null;
            },
          ),
          SizedBox(
            height: 11,
          ),
          TextFormField(
            initialValue: customer.phoneNo,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: const Icon(Icons.phone_in_talk),
                hintText: 'Enter your another phone number',
                labelText: 'Phone 2'),
            maxLength: 10,
            inputFormatters: [],
            keyboardType: TextInputType.phone,
            onChanged: (String value) {
              phoneNo = value as TextEditingController;
            },
            validator: (String value) {
              String patttern = r'^(?:[6-9])?[0-9]{10,12}$';
              RegExp regExp = new RegExp(patttern);
              if (value.length == 0) {
                return "Mobile is Required";
              } else if (value.length != 10) {
                return "Mobile number must 10 digits";
              } else if (!regExp.hasMatch(value)) {
                return "Mobile Number must be digits";
              }
              return null;
            },
          ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            initialValue: customer.address,
            decoration: const InputDecoration(
                border: OutlineInputBorder(gapPadding: 20),
                icon: const Icon(Icons.location_on),
                hintText: 'Enter Address',
                labelText: 'Address'),
            onChanged: (String value) {
              address = value as TextEditingController;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter address';
              }
              return null;
            },
          ),
          SizedBox(
            height: 35,
          ),
          TextFormField(
            initialValue: customer.city,
            decoration: const InputDecoration(
                border: OutlineInputBorder(gapPadding: 20),
                icon: const Icon(Icons.location_city),
                hintText: 'Enter City',
                labelText: 'City'),
            onChanged: (String value) {
              city = value as TextEditingController;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter city';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: Text("Are you sure to change the customer details"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("No"),
                      ),
                      FlatButton(
                        onPressed: () {
                          if (!_form.currentState.validate()) {
                            return;
                          }
                          _form.currentState.save();
                          _submitForm();
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => DetailsPage(),
                                settings: RouteSettings(arguments: customer),
                              ));
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
        child: const Icon(Icons.done),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
