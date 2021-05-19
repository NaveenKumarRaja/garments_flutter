import 'package:flutter/material.dart';
import 'package:garments/pages/customers/edit/Edit.dart';
import 'package:garments/pages/customers/model/Service.dart';
import 'package:garments/pages/customers/detail/customer/Details.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

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
        height: 250,
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
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.phone,
                                  size: 18, color: Colors.blue),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        return AlertDialog(
                                          title: Text("Call"),
                                          actions: <Widget>[
                                            Align(
                                              alignment: Alignment.center,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FlatButton(
                                                  onPressed: () async {
                                                    var url =
                                                        'tel:${customer.phoneNumber}';
                                                    if (await canLaunch(url)) {
                                                      await launch(url);
                                                    } else {
                                                      throw 'Could not launch $url';
                                                    }
                                                  },
                                                  child: Text(
                                                    customer.phoneNumber,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                FlatButton(
                                                  onPressed: () async {
                                                    var url =
                                                        'tel:${customer.phoneNo}';
                                                    if (await canLaunch(url)) {
                                                      await launch(url);
                                                    } else {
                                                      throw 'Could not launch $url';
                                                    }
                                                  },
                                                  child: Text(customer.phoneNo),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              },
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
                            IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                        builder: (context) => new EditDetails(),
                                        settings:
                                            RouteSettings(arguments: customer),
                                      ));
                                })
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
