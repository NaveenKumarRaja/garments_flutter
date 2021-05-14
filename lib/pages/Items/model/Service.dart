class Items {
  String itemName;
  bool isDeleted;

  Items(this.itemName, this.isDeleted);

  String toParams() => "?&itemName=$itemName";

  Map<String, dynamic> gSheet() {
    return {'Name': itemName, 'IsDeleted': isDeleted};
  }

  static bool parseIsDeleted(String isDeleted) {
    return isDeleted.toLowerCase() == 'true';
  }

  List<String> toSheetList(bool isDeleted) {
    return [isDeleted.toString()];
  }
}
