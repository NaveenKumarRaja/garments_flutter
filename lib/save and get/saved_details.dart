class CustomersForm {
  static List<CustomersForm> customers = customerStub;
  String name;
  String phoneNumber;
  String phoneNo;
  String address;
  String city;

  static String searchString;

  static get customerStub {
    List<CustomersForm> customers = new List<CustomersForm>();

    return customers;
  }

  static List<CustomersForm> getCustomers() {
    return filterCustomer(searchString);
  }

  static void addCustomer(CustomersForm customer) {
    customers.add(customer);
  }

  static void removeCustomer(CustomersForm customer) {
    customers.remove(customer);
  }

  static List<CustomersForm> filterCustomer(String searchString) {
    if (searchString == null || searchString.isEmpty) {
      return customers;
    }
    return customers
        .where((customer) => customer.name.contains(searchString))
        .toList();
  }

  CustomersForm(
    this.name,
    this.phoneNumber,
    this.phoneNo,
    this.address,
    this.city,
  );
  String toParams() =>
      "?name=$name&phoneNumber=$phoneNumber&phoneNo=$phoneNo&address=$address&city=$city";

  factory CustomersForm.fromJson(dynamic json) {
    return CustomersForm(
      "${json['name']}",
      "${json['phoneNumber']}",
      "${json['phoneNo']}",
      "${json['address']}",
      "${json['city']}",
    );
  }
}
