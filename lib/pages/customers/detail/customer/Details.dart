import 'package:flutter/material.dart';
import 'package:garments/pages/customer_item/widgets/ItemRate.dart';
import 'package:garments/pages/customers/Listall/List.dart';
import 'package:garments/pages/customers/detail/Tabbar.dart';
import 'package:garments/pages/customers/model/Service.dart';
import 'Carddetail.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var refresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final Customer customer = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new CustomerHomeWidget()));
          },
        ),
        centerTitle: true,
        title: Text("Details", style: TextStyle(color: Colors.white)),
      ),
      body: new Column(
        children: <Widget>[
          new CardDetail(),
          Expanded(
            child: new TabbarWidget(customer.name),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new ItemRate()));
        },
      ),
    );
  }
}
