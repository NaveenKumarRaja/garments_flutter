class Customer {
  static List<Customer> customers = customerStub;
  String name;
  String phoneNumber;
  String address;

  static String searchString;

  static get customerStub {
    List<Customer> customers = new List<Customer>();
    return customers;
  }

  static List<Customer> getCustomers() {
    return filterCustomer(searchString);
  }

  static void addCustomer(Customer customer) {
    customers.add(customer);
  }

  static void removeCustomer(Customer customer) {
    customers.remove(customer);
  }

  static List<Customer> filterCustomer(String searchString) {
    if (searchString == null || searchString.isEmpty) {
      return customers;
    }
    return customers
        .where((customer) => customer.name.contains(searchString))
        .toList();
  }
}
