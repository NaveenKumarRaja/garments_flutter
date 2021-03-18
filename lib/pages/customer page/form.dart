import 'package:flutter/material.dart';

import 'customerhome.dart';
import 'customerlist.dart';

class Forms extends StatelessWidget {
  const Forms({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('   '),
        ),
        body: Center(
          child: new Container(
            child: new FormsWidget(),
          ),
        ));
  }
}

class FormsWidget extends StatefulWidget {
  FormsWidget({Key key}) : super(key: key);

  @override
  _FormsWidgetState createState() => _FormsWidgetState();
}

class _FormsWidgetState extends State<FormsWidget> {
  final _formKey = GlobalKey<FormState>();
  Customer customer = new Customer();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: new ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
          children: <Widget>[
            Center(
                child: Text(
              "Add customer",
              style: TextStyle(fontSize: 25, color: Colors.black54),
            )),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.person),
                  hintText: 'Enter your name',
                  labelText: 'Name'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter name';
                }
                return null;
              },
              onSaved: (value) {
                customer.name = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: phoneNumber,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: const Icon(Icons.phone),
                  hintText: 'Enter your phone number',
                  labelText: 'Phone'),
              inputFormatters: [],
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter valid phone number';
                }
                return null;
              },
              onSaved: (value) {
                customer.phoneNumber = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: address,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(gapPadding: 20),
                  icon: const Icon(Icons.location_on),
                  hintText: 'Enter Address',
                  labelText: 'Address'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter address';
                }
                return null;
              },
              onSaved: (value) {
                customer.address = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: RaisedButton(
                onPressed: () {
                  Customer customer = new Customer();
                  customer.name = name.text;
                  customer.phoneNumber = phoneNumber.text;
                  customer.address = address.text;

                  Customer.addCustomer(customer);

                  if (!_formKey.currentState.validate()) {
                    return;
                  }
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
              ),
            )
          ],
        ));
  }
}
