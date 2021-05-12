/*import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CustomerList {
  String name;
  String phoneNumber;
  String phoneNo;
  String address;
  String city;

  static const String URL =
      "https://script.google.com/macros/s/AKfycbyDPfD5aMVQprFvgKKD8inVa2DxiH6Ni-JcGxNye8F2ToP0OdgA/exec";

  CustomerList(
      {this.name, this.phoneNumber, this.phoneNo, this.address, this.city});

  factory CustomerList.fromJson(dynamic json) {
    return CustomerList(
      name: "${json['name']}",
      phoneNumber: "${json['phoneNumber']}",
      phoneNo: "${json['phoneNo']}",
      address: "${json['address']}",
      city: "${json['city']}",
    );
  }

  Map toJson() => {
        "name": name,
        "phoneNumber": phoneNumber,
        "phoneNo": phoneNo,
        "address": address,
        "city": city
      };

  Future<List<CustomerList>> getFeedbackList() async {
    return await http.get(URL).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => CustomerList.fromJson(json)).toList();
    });
  }
}
*/
