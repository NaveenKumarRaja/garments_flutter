import 'package:flutter/material.dart';
import 'package:garments/pages/customers/api/GSheet.dart';
import 'package:garments/pages/customers/api/Service.dart';
import 'package:garments/pages/customers/detail/Details.dart';

class EditDetails extends StatefulWidget {
  EditDetails({Key key}) : super(key: key);

  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  //final _form = GlobalKey<FormState>();
  final _scafold = GlobalKey<ScaffoldState>();

  List<CustomersForm> customer = List<CustomersForm>();

  TextEditingController name = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController phoneNo = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController city = new TextEditingController();

  get response => null;
  //@override
  void initState() {
    super.initState();
    /*phoneNumber = new TextEditingController();
    phoneNo = new TextEditingController();
    address = new TextEditingController();
    city = new TextEditingController();*/
  }

  void _updateForm() {
    CustomersForm updateCustomer = CustomersForm(name.text, phoneNumber.text,
        phoneNo.text, address.text, city.text, false);
    print("Customer : " + updateCustomer.toParams());
    FormController formController = FormController((String response) {
      print(response);
      if (response == null) {
        _showSnackBar("CustomersForm Submitted");
      } else {
        _showSnackBar("Error Occured");
      }
    });
    _showSnackBar("Update Customer");
    formController.updateForm(updateCustomer);
  }

  _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    _scafold.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final CustomersForm customer = ModalRoute.of(context).settings.arguments;
    name.text = customer.name;
    phoneNo.text = customer.phoneNo;
    phoneNumber.text = customer.phoneNumber;
    address.text = customer.address;
    city.text = customer.city;

    return Scaffold(
      key: _scafold,
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
            initialValue: customer.name,
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
            onChanged: (String value) {
              print("Name : " + value);
              name.text = value;
              print("Name : " + name.text);
            },
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            initialValue: customer.phoneNumber,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: const Icon(Icons.phone),
                hintText: 'Enter your phone number',
                labelText: 'Phone'),
            maxLength: 10,
            inputFormatters: [],
            keyboardType: TextInputType.phone,
            onChanged: (String value) {
              phoneNumber.text = value;
            },
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
            initialValue: customer.phoneNo,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: const Icon(Icons.phone_in_talk),
                hintText: 'Enter your another phone number',
                labelText: 'Phone 2'),
            maxLength: 10,
            inputFormatters: [],
            keyboardType: TextInputType.phone,
            onChanged: (String value) {
              phoneNo.text = value;
            },
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
            initialValue: customer.address,
            decoration: const InputDecoration(
                border: OutlineInputBorder(gapPadding: 20),
                icon: const Icon(Icons.location_on),
                hintText: 'Enter Address',
                labelText: 'Address'),
            onChanged: (String value) {
              address.text = value;
            },
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
            initialValue: customer.city,
            decoration: const InputDecoration(
                border: OutlineInputBorder(gapPadding: 20),
                icon: const Icon(Icons.location_city),
                hintText: 'Enter City',
                labelText: 'City'),
            onChanged: (String value) {
              city.text = value;
            },
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
                    actions: [
                      FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("No"),
                      ),
                      FlatButton(
                        onPressed: () {
                          _updateForm();
                          setState(() {});
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => DetailsPage(),
                                settings: RouteSettings(arguments: customer),
                              ));
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
