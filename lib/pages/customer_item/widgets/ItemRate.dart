import 'package:flutter/material.dart';
import 'package:editable/editable.dart';
import 'package:garments/pages/Items/api/Sheet.dart';
import 'package:garments/pages/Items/model/Item.dart';
import 'package:garments/pages/customers/detail/customer/Details.dart';

class ItemRate extends StatefulWidget {
  ItemRate({Key key}) : super(key: key);

  @override
  _ItemRateState createState() => _ItemRateState();
}

class _ItemRateState extends State<ItemRate> {
  List<Items> getallItems = List<Items>();
  TextEditingController rate = TextEditingController();

  @override
  void initState() {
    getallItems = List<Items>();
    super.initState();

    ItemSheet().getItems().then((items) {
      setState(() {
        this.getallItems = items;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Rate", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: DataTable(
                dataRowHeight: 40,
                columnSpacing: 100,
                horizontalMargin: 70,
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Item Name',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Rate',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: List<DataRow>.generate(
                    getallItems.length,
                    (int index) => DataRow(
                          cells: <DataCell>[
                            DataCell(Text(getallItems[index].itemName)),
                            DataCell(Text(getallItems[index].itemName))
                          ],
                        ))),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new DetailsPage()));
        },
      ),
    );
  }
}
