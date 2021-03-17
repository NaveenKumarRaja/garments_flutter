class Customer {
  static List<Customer> customers = new List<Customer>();

  static void removeCustomer(Customer customer) {
    customers.remove(customer);
  }
}
