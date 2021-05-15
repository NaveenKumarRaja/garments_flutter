import 'package:flutter/material.dart';

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
      body: TabBar(
        controller: _tabController,
        tabs: <Widget>[
          Tab(
            text: "Items Sale",
          ),
          Tab(
            text: "Bank Account",
          ),
        ],
      ),
    );
  }
}
