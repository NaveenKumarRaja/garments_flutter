import 'package:flutter/material.dart';

class ItemAccount extends StatefulWidget {
  ItemAccount({Key key}) : super(key: key);

  @override
  _ItemAccountState createState() => _ItemAccountState();
}

class _ItemAccountState extends State<ItemAccount> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.shopping_cart_sharp),
                selectedIcon: Icon(Icons.shopping_cart),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.account_balance),
                selectedIcon: Icon(Icons.account_balance_outlined),
                label: Text('Second'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Center(
              child: Text('selectedIndex: $_selectedIndex'),
            ),
          )
        ],
      ),
    );
  }
}
