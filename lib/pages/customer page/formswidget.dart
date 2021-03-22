import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'customerhome.dart';
import 'customerlist.dart';

class FormsWidget extends StatefulWidget {
  FormsWidget({Key key}) : super(key: key);

  @override
  _FormsWidgetState createState() => _FormsWidgetState();
}

class _FormsWidgetState extends State<FormsWidget> {
  final _formKey = GlobalKey<FormState>();
  final _scafoldKey = GlobalKey<ScaffoldState>();
  Customer customer = new Customer();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      SavedDetails savedDetails = SavedDetails(
          name.text, phoneNumber.text, phoneNo.text, address.text, city.text);

      FormController formController = FormController((String response) {
        print(response);
        if (response == FormController.STATUS_SUCCESS) {
          _showSnackBar("Form Submiited");
        } else {
          _showSnackBar("Error Occured");
        }
      });
      _showSnackBar("Submitting Form");
      formController.submitForm(savedDetails);
    }
  }

  _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    _scafoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Add customer",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new CustomerHomeWidget()));
            },
          )),
      body: Form(
          key: _formKey,
          child: new ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
                onSaved: (String value) {
                  customer.name = value;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: phoneNumber,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: const Icon(Icons.phone),
                    hintText: 'Enter your phone number',
                    labelText: 'Phone'),
                maxLength: 10,
                inputFormatters: [],
                keyboardType: TextInputType.phone,
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
                onSaved: (String value) {
                  customer.phoneNumber = value;
                },
              ),
              SizedBox(
                height: 11,
              ),
              TextFormField(
                controller: phoneNo,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: const Icon(Icons.phone),
                    hintText: 'Enter your another phone number',
                    labelText: 'Phone 2'),
                maxLength: 10,
                inputFormatters: [],
                keyboardType: TextInputType.phone,
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
                onSaved: (String value) {
                  customer.phoneNo = value;
                },
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: address,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(gapPadding: 20),
                    icon: const Icon(Icons.location_on),
                    hintText: 'Enter Address',
                    labelText: 'Address'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter address';
                  }
                  return null;
                },
                onSaved: (String value) {
                  customer.address = value;
                },
              ),
              SizedBox(
                height: 35,
              ),
              TextFormField(
                controller: city,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(gapPadding: 20),
                    icon: const Icon(Icons.location_city),
                    hintText: 'Enter City',
                    labelText: 'City'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter city';
                  }
                  return null;
                },
                onSaved: (String value) {
                  customer.city = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 110),
                child: new RaisedButton(
                    onPressed: () {
                      Customer customer = new Customer();
                      customer.name = name.text;
                      customer.phoneNumber = phoneNumber.text;
                      customer.phoneNo = phoneNo.text;
                      customer.address = address.text;
                      customer.city = city.text;

                      _submitForm();
                      /*  if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();*/

                      Customer.addCustomer(customer);

                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new CustomerHomeWidget()));
                      showDialog(
                        context: context,
                        child: AlertDialog(
                          content: Text('Entered Successfully'),
                        ),
                      );
                    },
                    child: Text('SUBMIT'),
                    color: Colors.blue,
                    textColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    splashColor: Colors.white),
              )
            ],
          )),
    );
  }
}

class SavedDetails {
  String name;
  String phoneNumber;
  String phoneNo;
  String address;
  String city;

  SavedDetails(
      this.name, this.phoneNumber, this.phoneNo, this.address, this.city);

  String toParams() =>
      "?name =$name&phoneNumber =$phoneNumber&phoneNo =$phoneNo&address =$address&city =$city";
}

class FormController {
  final void Function(String) callback;

  static const String URL =
      "https://script.google.com/macros/s/AKfycbyDPfD5aMVQprFvgKKD8inVa2DxiH6Ni-JcGxNye8F2ToP0OdgA/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  get http => null;

  void submitForm(SavedDetails savedDetails) async {
    try {
      await http.get(URL + savedDetails.toParams()).then((response) {
        callback(convert.jsonDecode(response.body)["status"]);
      });
    } catch (e) {
      print(e);
    }
  }
}
