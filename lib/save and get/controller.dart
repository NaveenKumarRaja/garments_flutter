import 'saved_details.dart';
import 'dart:convert' as convert;

class FormController {
  final void Function(String) callback;

  static const String URL =
      "https://script.google.com/macros/s/AKfycbyDPfD5aMVQprFvgKKD8inVa2DxiH6Ni-JcGxNye8F2ToP0OdgA/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  get http => null;

  void submitForm(SavedDetails savedDetails) async {
    try {
      await http.get(URL + savedDetails.toParams()).then((response) {
        callback(convert.jsonDecode(response.body)["status"]);
      });
    } catch (e) {
      print(e);
    }
  }
}
