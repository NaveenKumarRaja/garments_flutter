import 'package:gsheets/gsheets.dart';

import 'Service.dart';

class FormController {
  final void Function(String) callback;
  var _credentials = r'''
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

  static const String URL =
      "POST https://sheets.googleapis.com/v4/spreadsheets/{1p5dka7tZmt25DWtdIY0zPNC2ZCqAEgdMdzzQWgvXdnM}/values/{A:E}:append";

  FormController(this.callback);

  void submitForm(CustomersForm customersForm) async {
    final gsheets = GSheets(_credentials);
    final ss = await gsheets
        .spreadsheet("1p5dka7tZmt25DWtdIY0zPNC2ZCqAEgdMdzzQWgvXdnM");

    var sheet = ss.worksheetByTitle("Customers");
    await sheet.values.map
        .appendRow(customersForm.toGsheets())
        .then((response) {})
        .catchError((e) => {});
  }

  Future<List<CustomersForm>> getCustomersList() async {
    final gsheets = GSheets(_credentials);
    final ss = await gsheets
        .spreadsheet("1p5dka7tZmt25DWtdIY0zPNC2ZCqAEgdMdzzQWgvXdnM");

    var sheet = ss.worksheetByTitle("Customers");

    return await sheet.values.allRows(fromRow: 2).then((response) {
      print(response);
      List<CustomersForm> customers = response
          .map((listOfstr) => new CustomersForm(
              listOfstr[0],
              listOfstr[1],
              listOfstr[2],
              listOfstr[3],
              listOfstr[4],
              CustomersForm.parseIsDeleted(listOfstr[5])))
          .where((customer) => !customer.isDeleted)
          .toList();
      return Future.value(customers);
    });
  }

  void updateForm(CustomersForm customersForm) async {
    final gsheets = GSheets(_credentials);
    final ss = await gsheets
        .spreadsheet("1p5dka7tZmt25DWtdIY0zPNC2ZCqAEgdMdzzQWgvXdnM");

    var sheet = ss.worksheetByTitle("Customers");
    print("customerForm :" + customersForm.toGsheetsList(false).toString());
    await sheet.values
        .insertRowByKey(customersForm.name, customersForm.toGsheetsList(false))
        .then((response) => print("Response : " + response.toString()));
  }

  void deleteCustomer(CustomersForm customersForm) async {
    final gsheets = GSheets(_credentials);
    final ss = await gsheets
        .spreadsheet("1p5dka7tZmt25DWtdIY0zPNC2ZCqAEgdMdzzQWgvXdnM");

    var sheet = ss.worksheetByTitle("Customers");
    print("customerForm :" + customersForm.toGsheetsList(true).toString());

    await sheet.values
        .insertRowByKey(customersForm.name, customersForm.toGsheetsList(true));
  }
}
