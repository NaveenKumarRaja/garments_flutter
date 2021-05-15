import 'package:flutter/material.dart';
import 'package:garments/pages/customer_item/model/CustomerItem.dart';

class CustomerItemsWidget extends StatelessWidget {
  const CustomerItemsWidget(List<CustomerItem> customerItems, {Key key})
      : this.customerItems = customerItems,
        super(key: key);

  final List<CustomerItem> customerItems;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: const <DataColumn>[
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
              customerItems.length,
              (int index) => DataRow(
                    cells: <DataCell>[
                      DataCell(Text(customerItems[index].itemName)),
                      DataCell(Text(customerItems[index].rate.toString()))
                    ],
                  )),
        ));
  }
}
