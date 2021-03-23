import 'package:flutter/material.dart';

import 'formswidget.dart';

class Forms extends StatelessWidget {
  const Forms({Key key}) : super(key: key);
  // final String name, phoneNumber, phoneNo, address, city;
  //Forms({this.name, this.phoneNumber, this.phoneNo, this.address, this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: new Container(
        child: new FormsWidget(),
      ),
    ));
  }
}
