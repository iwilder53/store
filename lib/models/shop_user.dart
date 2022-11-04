class ShopUser {
  String name;
  String email;
  String id;
  String address;
  num number;
  List orders = [""];
  bool seller = false;
  static const List nullOrder = [];
  ShopUser(
      {required this.number,
      required this.address,
      required this.name,
      required this.email,
      required this.id,
      required this.seller,
      this.orders = nullOrder});
}
