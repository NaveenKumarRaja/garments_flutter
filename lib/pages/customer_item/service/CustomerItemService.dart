import 'package:garments/pages/customer_item/model/CustomerItem.dart';
import 'package:gsheets/gsheets.dart';

const _credentials = r'''
    {
  "type": "service_account",
  "project_id": "balajigarments",
  "private_key_id": "26ee2bebfd346b81f3fddfcc2f6ed3f8cc7b4a8e",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDIGc47OrMXt+Rx\nO9xhrwRNW5Ssg5NP9uUPQlcN92j23h4pY/pfjUEbcqaojObj6VCt3arVU5qVYgrT\n3oE1+uSnF5FpbeMQ0oQfsXlohC/+VRbGdl5H7Z9goHAXsXonBVZ2KmdBY7ya5zp5\nTZn4SxyzStsHA8L8nF6GjMn5rQcjphgGvrMQxgknRbXuwIaBqtHEI3LM1NQ8npwz\nOV9v5inVLI/s1j+hR9fst7WJ6B+dhN94M3NQapjMMlXvRbjYLfpLsv3bM4igDisA\n1300afowIsQInseITzK6QM6nevG9vzJY87Pm92OLPaScRYZcQbJBxmZ3/gQ9U4sv\nHnuFhld5AgMBAAECggEAA/by7Zx/oOgtWAsCFlNj5+55FyPyPsLbDf7X/7hXtZB4\nE4TeGJeRYyxV3gAQsRJV3WQHdvuVlAEhysndUIb8kcz3PhoFxjcNlB0tlSMNWmIw\nNdVxj8ZHAqCbJ/UFwRErgeLcMeD6gy0yrOWbN96xHmJMzapG6j9k5hCTDeXePtgK\nKMyD6OfDiFexxw990uECZBXMbgEL3aFgy1drMyUCeD9JMpWj8WexM+HHpmc9ndrV\nnlb1GsfTtrOW8vrKSXMEg9k4MYK1817AoAa3gQN9JfE021Rpj2w0XV6HC8wIQZJU\nrNNWQpKDNLiZy7XoIBZBzw6fyg8jz3M2SuNA91CS4wKBgQDi1YydKqqWl34x6FGu\nPnL/BKAMFfcbR1H9E5f9sfSxb+sjNAiUZ9bJMrL/VpyvulGh0NnO0n6r5QTaonGB\nKJB4r9OHUkZiJTFlc94YJfPnNpVED0EoZqhDEe1eDWt9+E2AjOpTFj5zUIzO2bzW\nxeFAVceBdESBjFvNZB8tteYpzwKBgQDh1E2lPjME7MonUGjz/N5Df+UWHl/3Uk5p\nKNq+ll+ObP4b0S71DF23LVrcNt1sUejrmtDt+2vgk1QxKGhS2HbF8qvmX1i0Hd2o\n6K4tBTJSLNcs3jRXGv7PA7n5jrVxSVIaDxDBJCl03ZNCVBb2XZ7dHB0WwkjdXODs\nM8YPf3nkNwKBgH5+viqLN5RBKSOlvZ8gvjpOlv4GZcX1kNhDy/ey/JTSp9r60moI\nOjP7LOzNnRU2Hv3RHRWENxWe4oUWH5v6Rg63ZovJKuzidthvtAPdblWbD8RjiV+B\nWAYHAkr3yuD1ziqI6seo2Oyvl8ZmkDNpKEMbUuVzNBzWa/9u/SAdlxvrAoGBANBg\nTaUD15/bvky4bZ903MH76S6XqIVVdPSjtfPWXSXWfEK+qk2Cs5aqSwSXu4iPrBR6\nLf7p14jJaQ5S8rA+/Jl6ahOQNxE73aRVzyHLgbtBlOrZvgIB7syl65zSiamWtiNF\nc3hEHdyv94lkfiumB0iPAGhXrVRUt1Y8D62NOrPRAoGAMzOrlv16CesSmxxSL6nH\n/oOkP0QTped3YsHtZJ3XKdX420Yb1IrlH4EaepVZt8rNuzsRX4m9ZWlD361GZLK6\nVGkOWv1vZlHpc4TxQiAzwATOBY7GMQmmAmIMlx9gMxu25lPJ67KoseYeMwYNVJKK\ndQfmocwom45RkAMxwgGeNm0=\n-----END PRIVATE KEY-----\n",
  "client_email": "balajigarments@balajigarments.iam.gserviceaccount.com",
  "client_id": "114074597727629801689",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/balajigarments%40balajigarments.iam.gserviceaccount.com"
}
    ''';

class CustomerItemSerivce {
  final GSheets gsheets = GSheets(_credentials);

  Spreadsheet spreadSheet;
  Worksheet sheet;

  Future<void> init() async {
    spreadSheet ??= await gsheets
        .spreadsheet("1p5dka7tZmt25DWtdIY0zPNC2ZCqAEgdMdzzQWgvXdnM");
    sheet ??= await spreadSheet.worksheetByTitle('Customer Items');
  }

  static List<CustomerItem> getCustomerItems_dump() {
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

  Future<List<CustomerItem>> getCustomerItems(String customerName) async {
    await init();
    return await sheet.values.allRows(fromRow: 2).then((value) {
      List<CustomerItem> customerItems = value
          .map((customerItem) => new CustomerItem(
              customerItem[0], customerItem[1], double.parse(customerItem[2])))
          .where((element) =>
              customerName.toLowerCase() == element.customerName.toLowerCase())
          .toList();
      print('CustomeItem from sheet : ' + customerItems.length.toString());
      return Future.value(customerItems);
    });
  }
}
