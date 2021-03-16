import 'package:flutter/material.dart';

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
          child: new FormsWidget(),
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
            TextFormField(
              controller: name,
              decoration: InputDecoration(
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
            TextFormField(
              controller: phoneNumber,
              decoration: const InputDecoration(
                  icon: const Icon(Icons.phone),
                  hintText: 'Enter your phone number',
                  labelText: 'Phone'),
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
            TextFormField(
              controller: address,
              decoration: const InputDecoration(
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: RaisedButton(
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

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
