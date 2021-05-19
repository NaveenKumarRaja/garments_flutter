import 'package:flutter/material.dart';
import 'package:editable/editable.dart';
import 'package:garments/pages/Items/api/Sheet.dart';
import 'package:garments/pages/Items/model/Item.dart';
import 'package:garments/pages/customer_item/model/CustomerItem.dart';
import 'package:garments/pages/customer_item/service/CustomerItemService.dart';
import 'package:garments/pages/customers/detail/customer/Details.dart';
import 'package:garments/pages/customers/model/Service.dart';

class ItemRate extends StatefulWidget {
  ItemRate({Key key}) : super(key: key);

  @override
  _ItemRateState createState() => _ItemRateState();
}

class _ItemRateState extends State<ItemRate> {
  List<Items> getallItems = [];
  TextEditingController rate = TextEditingController();
  final _editableKey = GlobalKey<EditableState>();

  @override
  void initState() {
    getallItems = [];

    super.initState();

    ItemSheet().getItems().then((items) {
      setState(() {
        this.getallItems = items;
      });
    });
  }

  List<ItemRate> rows1 = [];

  List rows = [
    {
      "name": '[index].itemName',
      "date": '23/09/2020',
    },
    {
      "name": 'Daniel Paul',
      "date": '12/4/2020',
    },
    {
      "name": 'Mark Zuckerberg',
      "date": '09/4/1993',
    },
    {
      "name": 'Jack',
      "date": '01/7/1820',
    },
  ];
  List cols = [
    {
      "title": 'Item Name',
      'widthFactor': 0.5,
      'key': 'name',
      'editable': false
    },
    {"title": 'Rate', 'widthFactor': 0.2, 'key': 'rate'},
  ];

  void _printEditedRows() {
    List editedRows = _editableKey.currentState.editedRows;
    print(editedRows);
  }

  @override
  Widget build(BuildContext context) {
    final Customer customer = ModalRoute.of(context).settings.arguments;
    /*return Scaffold(
      appBar: AppBar(
        title: Text("Item Rate"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => _printEditedRows(),
                child: Text('Print Edited Rows',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          )
        ],
      ),
      body: Editable(
        key: _editableKey,
        columns: cols,
        rows: rows,
        /*List.generate(
            getallItems.length,
            (int index) => [
                  {
                    "name": getallItems[index].itemName,
                  }
                ]),*/
        onRowSaved: (value) {
          print(value);
        },
        onSubmitted: (value) {
          print(value);
        },
        borderColor: Colors.black,
        tdStyle: TextStyle(fontWeight: FontWeight.bold),
        trHeight: 80,
        thStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        thAlignment: TextAlign.center,
        thVertAlignment: CrossAxisAlignment.end,
        thPaddingBottom: 3,
        showSaveIcon: true,
        saveIconColor: Colors.black,
        showCreateButton: true,
        tdAlignment: TextAlign.left,
        tdPaddingTop: 20.0,
        tdPaddingBottom: 14,
        tdPaddingLeft: 10,
        tdPaddingRight: 8,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(0))),
      ),
    );
  }*/

    return Scaffold(
      appBar: AppBar(
        title: Text("Item Rate", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            customer.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
              child: DataTable(
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
                        DataCell(
                            TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Rate'),
                            ), onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => new TextField());
                        })
                      ],
                    ),
                  ))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => new DetailsPage(),
                settings: RouteSettings(arguments: customer),
              ));
        },
      ),
    );
  }
}
