import 'package:flutter/material.dart';
import 'package:garments/save%20and%20get/saved_details.dart';

class DetailsPage extends StatefulWidget {
  final int index;
  DetailsPage({Key key, this.index}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<CustomersForm> customer = List<CustomersForm>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("w"),
      ),
    );
  }
}
