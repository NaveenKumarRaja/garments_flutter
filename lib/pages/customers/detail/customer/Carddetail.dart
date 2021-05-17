import 'package:flutter/material.dart';
import 'package:garments/pages/customers/edit/Edit.dart';

import 'package:garments/pages/customers/model/Service.dart';
import 'package:garments/pages/customers/detail/customer/Details.dart';

class CardDetail extends StatefulWidget {
  CardDetail({Key key}) : super(key: key);

  @override
  _CardDetailState createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  var refresh = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    final Customer customer = ModalRoute.of(context).settings.arguments;

    return Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        height: 230,
        width: double.maxFinite,
        child: new RefreshIndicator(
          key: refresh,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              customer.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.phone,
                                  size: 18, color: Colors.blue),
                              onPressed: () {},
                            ),
                            Text(
                              customer.phoneNumber,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "  ,  ",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              customer.phoneNo,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal),
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
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(icon: Icon(Icons.edit), onPressed: () {})
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          onRefresh: () {
            refreshlist();
          },
        ));
  }

  Future<Null> refreshlist() async {
    refresh.currentState?.show(atTop: true);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new DetailsPage()));
    });
  }
}
