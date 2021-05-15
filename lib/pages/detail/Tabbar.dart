import 'package:flutter/material.dart';
import 'package:garments/pages/customer_item/model/CustomerItem.dart';
import 'package:garments/pages/customer_item/service/CustomerItemService.dart';
import 'package:garments/pages/customer_item/widgets/CustomerItem.dart';

class TabbarWidget extends StatefulWidget {
  final String customerName;
  TabbarWidget(this.customerName, {Key key}) : super(key: key);

  @override
  _TabbarWidgetState createState() => _TabbarWidgetState(customerName);
}

class _TabbarWidgetState extends State<TabbarWidget>
    with TickerProviderStateMixin {
  TabController _tabController;
  CustomerItemSerivce customerItemSerivce;
  List<CustomerItem> customerItems = List.empty();
  String customerName;

  _TabbarWidgetState(this.customerName);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    this.customerItemSerivce = new CustomerItemSerivce();
    customerItemSerivce.getCustomerItems(customerName).then((value) {
      print('setting customer items : ' + value.toString());
      setState(() {
        this.customerItems = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: "Items",
            ),
            Tab(
              text: "Bank Account",
            ),
          ],
        ),
        body: Scrollbar(
          child: TabBarView(
            controller: _tabController,
            children: [
              CustomerItemsWidget(customerItems),
              Text('Account'),
            ],
          ),
        ));
  }
}
