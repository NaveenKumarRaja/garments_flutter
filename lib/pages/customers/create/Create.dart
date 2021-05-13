import 'package:flutter/material.dart';
import 'package:garments/pages/customers/Listall/List.dart';
import 'package:garments/pages/customers/api/GSheet.dart';
import 'package:garments/pages/customers/api/Service.dart';

class FormsWidget extends StatefulWidget {
  FormsWidget({Key key}) : super(key: key);

  @override
  _FormsWidgetState createState() => _FormsWidgetState();
}

class _FormsWidgetState extends State<FormsWidget> {
  final _formKey = GlobalKey<FormState>();
  final _scafoldKey = GlobalKey<ScaffoldState>();

  //List<CustomerList> customer = List<CustomerList>();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();

  get response => null;

  void _submitForm() {
    {
      CustomersForm addCustomers = CustomersForm(name.text, phoneNumber.text,
          phoneNo.text, address.text, city.text, false);
      FormController formController = FormController((String response) {
        print(response);
        if (response == null) {
          _showSnackBar("CustomersForm Submitted");
        } else {
          _showSnackBar("Error Occured");
        }
      });
      _showSnackBar("Submiiting Customer");
      formController.submitForm(addCustomers);
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
                  } else {
                    return null;
                  }
                },
                /*onSaved: (String value) {
                  customer.name = value;
                },*/
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
                /* onSaved: (String value) {
                  customer.phoneNumber = value;
                },*/
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
                /* onSaved: (String value) {
                  customer.phoneNo = value;
                },*/
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
                /*onSaved: (String value) {
                  customer.address = value;
                },*/
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
                /* onSaved: (String value) {
                  customer.city = value;
                },*/
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 110),
                child: new RaisedButton(
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                      _submitForm();

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
