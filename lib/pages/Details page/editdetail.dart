import 'package:flutter/material.dart';
import 'package:garments/pages/Details%20page/detailspage.dart';
import 'package:garments/save%20and%20get/saved_details.dart';

class EditDetails extends StatefulWidget {
  EditDetails({Key key}) : super(key: key);

  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  List<CustomersForm> customer = List<CustomersForm>();
  TextEditingController sNo = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CustomersForm customer = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        //title: Text(customer.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(),
                  settings: RouteSettings(arguments: customer),
                ));
          },
        ),
      ),
      body: Center(
          child: new ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          TextFormField(
            controller: name,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.person),
                hintText: 'Enter your name',
                labelText: 'Name'),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter name';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: phoneNumber,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: const Icon(Icons.phone),
                hintText: 'Enter your phone number',
                labelText: 'Phone'),
            maxLength: 10,
            inputFormatters: [],
            keyboardType: TextInputType.phone,
            validator: (String value) {
              String patttern = r'^(?:[6-9])?[0-9]{10,12}$';
              RegExp regExp = new RegExp(patttern);
              if (value.length == 0) {
                return "Mobile is Required";
              } else if (value.length != 10) {
                return "Mobile number must 10 digits";
              } else if (!regExp.hasMatch(value)) {
                return "Mobile Number must be digits";
              }
              return null;
            },
          ),
          SizedBox(
            height: 11,
          ),
          TextFormField(
            controller: phoneNo,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: const Icon(Icons.phone_in_talk),
                hintText: 'Enter your another phone number',
                labelText: 'Phone 2'),
            maxLength: 10,
            inputFormatters: [],
            keyboardType: TextInputType.phone,
            validator: (String value) {
              String patttern = r'^(?:[6-9])?[0-9]{10,12}$';
              RegExp regExp = new RegExp(patttern);
              if (value.length == 0) {
                return "Mobile is Required";
              } else if (value.length != 10) {
                return "Mobile number must 10 digits";
              } else if (!regExp.hasMatch(value)) {
                return "Mobile Number must be digits";
              }
              return null;
            },
          ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: address,
            decoration: const InputDecoration(
                border: OutlineInputBorder(gapPadding: 20),
                icon: const Icon(Icons.location_on),
                hintText: 'Enter Address',
                labelText: 'Address'),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter address';
              }
              return null;
            },
          ),
          SizedBox(
            height: 35,
          ),
          TextFormField(
            controller: city,
            decoration: const InputDecoration(
                border: OutlineInputBorder(gapPadding: 20),
                icon: const Icon(Icons.location_city),
                hintText: 'Enter City',
                labelText: 'City'),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter city';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: Text("Are you sure to change the customer details"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("No"),
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (context) => DetailsPage(),
                                  settings: RouteSettings(arguments: customer),
                                ));
                          });
                        },
                        child: Text("Yes"),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
        child: const Icon(Icons.done),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
