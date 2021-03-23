class CustomerList {
  String name;
  String phoneNumber;
  String phoneNo;
  String address;
  String city;

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
}
