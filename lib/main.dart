import 'package:flutter/material.dart';

import 'pages/homepage/homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(primarySwatch: Colors.lightBlue),
  ));
}
