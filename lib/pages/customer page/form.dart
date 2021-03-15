import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  FormWidget({Key key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController name = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Form(
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                  SizedBox(
                    height: 150.0,
                  ),
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) =>
                        value.isEmpty ? 'Name cannot be blank' : null,
                  ),
                  TextFormField(
                    controller: phone,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    obscureText: true,
                    validator: (value) =>
                        value.isEmpty ? 'PhoneNo cannot be blank' : null,
                  ),
                  TextFormField(
                    controller: address,
                    decoration: InputDecoration(labelText: 'Address'),
                    obscureText: true,
                    validator: (value) =>
                        value.isEmpty ? 'Address cannot be blank' : null,
                  )
                ]))));
  }
}
