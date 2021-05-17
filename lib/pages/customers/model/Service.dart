class Customer {
  String name;
  String phoneNumber;
  String phoneNo;
  String address;
  String city;
  bool isDeleted;

  static String searchString;

  Customer(this.name, this.phoneNumber, this.phoneNo, this.address, this.city,
      this.isDeleted);
  String toParams() =>
      "?&name=$name&phoneNumber=$phoneNumber&phoneNo=$phoneNo&address=$address&city=$city";

  /*factory CustomersForm.fromGsheets(Map<String, dynamic> json) {
    return CustomersForm("${json['name']}", "${json['phoneNumber']}",
        "${json['phoneNo']}", "${json['address']}", "${json['city']}");
  }*/
  Map<String, dynamic> toGsheets() {
    return {
      'Name': name,
      'PhoneNumber': phoneNumber,
      'PhoneNo': phoneNo,
      'Address': address,
      'City': city,
      'IsDeleted': isDeleted
    };
  }

  static bool parseIsDeleted(String isDeletedStr) {
    return isDeletedStr.toLowerCase() == 'true';
  }

  List<String> toGsheetsList(bool isDeleted) {
    return [phoneNumber, phoneNo, address, city, isDeleted.toString()];
  }
}
