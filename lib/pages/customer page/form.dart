import 'package:flutter/material.dart';

import 'formswidget.dart';

class Forms extends StatelessWidget {
  const Forms({Key key}) : super(key: key);

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
