import 'package:flutter/material.dart';
import 'package:garments/Customer%20Editngs/saved_details.dart';

class CardDetail extends StatefulWidget {
  CardDetail({Key key}) : super(key: key);

  @override
  _CardDetailState createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  @override
  Widget build(BuildContext context) {
    final CustomersForm customer = ModalRoute.of(context).settings.arguments;

    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 220,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.phone, size: 18, color: Colors.blue),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          customer.phoneNumber,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " ,  ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          customer.phoneNo,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.location_on,
                          size: 18,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          customer.address,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.location_city,
                          size: 18,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          customer.city,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
