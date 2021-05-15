import 'package:flutter/material.dart';
import 'package:garments/pages/customer_item/service/CustomerItemService.dart';
import 'package:garments/pages/customer_item/widgets/CustomerItem.dart';

class TabbarWidget extends StatefulWidget {
  TabbarWidget({Key key}) : super(key: key);

  @override
  _TabbarWidgetState createState() => _TabbarWidgetState();
}

class _TabbarWidgetState extends State<TabbarWidget>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        body: TabBarView(
          controller: _tabController,
          children: [
            CustomerItemsWidget(CustomerItemSerivce.getCustomerItems()),
            Text('Account'),
          ],
        ));
  }
}
