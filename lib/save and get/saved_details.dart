class SavedDetails {
  String name;
  String phoneNumber;
  String phoneNo;
  String address;
  String city;

  SavedDetails(
      this.name, this.phoneNumber, this.phoneNo, this.address, this.city);

  String toParams() =>
      "?name =$name&phoneNumber =$phoneNumber&phoneNo =$phoneNo&address =$address&city =$city";
}
