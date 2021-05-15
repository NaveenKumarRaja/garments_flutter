import 'package:garments/pages/customer_item/model/CustomerItem.dart';

class CustomerItemSerivce {
  static List<CustomerItem> getCustomerItems() {
    CustomerItem customerItem_1 = new CustomerItem('customer_1', 'item_1', 5.0);
    CustomerItem customerItem_2 =
        new CustomerItem('customer_1', 'item_2', 15.0);
    CustomerItem customerItem_3 = new CustomerItem('customer_1', 'item_3', 5.5);
    CustomerItem customerItem_4 = new CustomerItem('customer_1', 'item_4', 5.0);
    CustomerItem customerItem_5 = new CustomerItem('customer_1', 'item_5', 5.0);

    return [
      customerItem_1,
      customerItem_2,
      customerItem_3,
      customerItem_4,
      customerItem_5
    ];
  }
}
