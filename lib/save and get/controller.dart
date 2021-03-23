import 'saved_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FormController {
  final void Function(String) callback;

  static const String URL =
      "https://script.google.com/macros/s/AKfycbyDPfD5aMVQprFvgKKD8inVa2DxiH6Ni-JcGxNye8F2ToP0OdgA/exec";

  FormController(this.callback);

  void submitForm(CustomersForm customersForm) async {
    try {
      await http.get(URL + customersForm.toParams()).then((response) {
        callback(convert.jsonDecode(response.body)["status"]);
      });
    } catch (e) {
      print(e);
    }
  }
}
