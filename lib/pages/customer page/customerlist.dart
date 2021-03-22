class Customer {
  static List<Customer> customers = customerStub;
  String name;
  String phoneNumber;
  String phoneNo;
  String address;
  String city;

  static String searchString;

  static get customerStub {
    List<Customer> customers = new List<Customer>();
    Customer customer1 = new Customer();
    customer1.name = "Naveen";
    customer1.phoneNumber = "9876543210";
    customer1.phoneNo = "8373587533";
    customer1.address = "2.second street,Gandhi Nagar";
    customer1.city = "Tirupur";
    customers.add(customer1);

    Customer customer2 = new Customer();
    customer2.name = "Pavan";
    customer2.phoneNumber = "8758575666";
    customer2.phoneNo = "875837873";
    customer2.address = "Tirupur";
    customer2.city = "3,second street,Neru Nagar";
    customers.add(customer2);

    Customer customer3 = new Customer();
    customer3.name = "Sakthi";
    customer3.phoneNumber = "7658576610";
    customer3.phoneNo = "7788976854";
    customer3.address = "kangayam";
    customer3.city = "3,second street,Pandiyan Nagar";
    customers.add(customer3);

    Customer customer4 = new Customer();
    customer4.name = "Venu";
    customer4.phoneNumber = "6398534374";
    customer4.phoneNo = "8475876888";
    customer4.address = "Avinasi";
    customer4.city = "Nchipalyam,second street,Neru Nagar";
    customers.add(customer4);

    Customer customer5 = new Customer();
    customer5.name = "Nandha Kumar";
    customer5.phoneNumber = "9987385766";
    customer5.phoneNo = "9870789090";
    customer5.address = "New Busstand";
    customer5.city = "3,second street,Kangayam";
    customers.add(customer5);

    Customer customer6 = new Customer();
    customer6.name = "Barathi";
    customer6.phoneNumber = "7841825766";
    customer6.phoneNo = "09989888778";
    customer6.address = "usha Theatre";
    customer6.city = "67,second street,Neru Nagar";
    customers.add(customer6);

    Customer customer7 = new Customer();
    customer7.name = "Anand";
    customer7.phoneNumber = "8889762336";
    customer7.phoneNo = "9887765412";
    customer7.address = "Dharapuram";
    customer7.city = "67,second street,Metu Nagar";
    customers.add(customer7);

    Customer customer8 = new Customer();
    customer8.name = "Kathir";
    customer8.phoneNumber = "8364785766";
    customer8.phoneNo = "7766732344";
    customer8.address = "Palladam";
    customer8.city = "67,second street,Neru Nagar";
    customers.add(customer8);

    Customer customer9 = new Customer();
    customer9.name = "Anbu";
    customer9.phoneNumber = "8758507669";
    customer9.phoneNo = "999958869";
    customer9.address = "NP GoldCity";
    customer9.city = "67, First street,Neru Nagar";
    customers.add(customer9);

    Customer customer10 = new Customer();
    customer10.name = "Sivam";
    customer10.phoneNumber = "8004849366";
    customer10.phoneNo = "6745837833";
    customer10.address = "Rakiyapalayam";
    customer10.city = "67,Third street,Neru Nagar";
    customers.add(customer10);

    Customer customer11 = new Customer();
    customer11.name = "Vetri";
    customer11.phoneNumber = "8333585766";
    customer11.phoneNo = "999968869";
    customer11.address = "CTC";
    customer11.city = "67,second street,Nallur";
    customers.add(customer11);

    Customer customer12 = new Customer();
    customer12.name = "Vel";
    customer12.phoneNumber = "8883143392";
    customer12.phoneNo = "898498984";
    customer12.address = "15, Velampalyam";
    customer12.city = "1-146, kK nagar,Chennai";
    customers.add(customer12);
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
