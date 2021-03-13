import 'package:flutter/material.dart';
import 'package:garments/pages/homepage.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(primarySwatch: Colors.teal),
    debugShowCheckedModeBanner: false,
  ));
}
