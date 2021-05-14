import 'package:flutter/material.dart';
import 'package:garments/pages/Items/api/Sheet.dart';
import 'package:garments/pages/Items/itemshome.dart';
import 'package:garments/pages/Items/model/Service.dart';

class ItemsPage extends StatefulWidget {
  ItemsPage({Key key}) : super(key: key);

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  List<Items> allItems = List<Items>();

  @override
  void initState() {
    allItems = List<Items>();
    super.initState();

    ItemSheet().getItems().then((items) {
      setState(() {
        this.allItems = items;
      });
    });
  }

  void deleteItems(Items delete) {
    ItemSheet sheetDelete = ItemSheet();
    sheetDelete.deleteItem(delete);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: allItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: ListTile(
                title: Text(allItems[index].itemName),
                onTap: () {},
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    deleteItems(allItems[index]);
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new ItemsHome()));
                  },
                ),
              ));
            }));
  }
}
