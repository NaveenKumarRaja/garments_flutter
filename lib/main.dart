import 'package:flutter/material.dart';
import 'package:garments/pages/homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(primarySwatch: Colors.lightBlue),
  ));
}
