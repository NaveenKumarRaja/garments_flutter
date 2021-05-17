import 'package:flutter/material.dart';
import 'package:garments/pages/Items/api/Sheet.dart';
import 'package:garments/pages/Items/itemshome.dart';
import 'package:garments/pages/Items/model/Item.dart';

class ItemsPage extends StatefulWidget {
  ItemsPage({Key key}) : super(key: key);

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  List<Items> allItems = List<Items>();
  var refresh = GlobalKey<RefreshIndicatorState>();

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
        body: RefreshIndicator(
      key: refresh,
      child: ListView.builder(
          itemCount: allItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
              title: Text(allItems[index].itemName),
              onTap: () {},
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return AlertDialog(
                            title:
                                Text("would you like to delete the customer"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("No"),
                              ),
                              FlatButton(
                                onPressed: () {
                                  deleteItems(allItems[index]);
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new ItemsHome()));
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
              ),
            ));
          }),
      onRefresh: () {
        refreshlist();
      },
    ));
  }

  Future<Null> refreshlist() async {
    refresh.currentState?.show(
        atTop:
            true); // change atTop to false to show progress indicator at bottom
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new ItemsHome()));
    });
  }
}
