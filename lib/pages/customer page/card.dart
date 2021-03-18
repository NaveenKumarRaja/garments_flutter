import 'package:flutter/material.dart';

import 'customerlist.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  void initState() {
    super.initState();
    Customer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: Customer.getCustomers().length,
          itemBuilder: (context, index) {
            return Container(
                child: ListTile(
              leading: CircleAvatar(radius: 20),
              title: Text(
                Customer.getCustomers().elementAt(index).name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                Customer.customers[index].phoneNumber,
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
              trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showAlertDialog(context);
                    /*setState(() {
                      Customer.customers.removeAt(index);
                    });*/
                  }),
            ));
          }),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  /*Widget yesButton = FlatButton(
    child: Text("Yes"),
    onPressed: () {
      
      
    },
  );
  Widget noButton = FlatButton(
    child: Text("No"),
    onPressed: () {},
  );*/

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content: Text(
        "Would you like to delete the customer details from the CUSTOMER PAGE"),
    actions: [
      FlatButton(
        child: Text("Yes"),
        onPressed: () {
          // Customer.customers.removeAt(context);
        },
      ),
      FlatButton(
        child: Text("No"),
        onPressed: () {},
      )
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
