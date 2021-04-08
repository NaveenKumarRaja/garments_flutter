import 'package:flutter/material.dart';

class CardDetail extends StatefulWidget {
  CardDetail({Key key}) : super(key: key);

  @override
  _CardDetailState createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 300,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
      ),
    );
  }
}
