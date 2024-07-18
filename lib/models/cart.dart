import 'package:malltiverse_hng/models/product.dart';

class Cart {
  String uid = '';
  int quantity;
  Product product;

  Cart({
    required this.quantity,
    required this.product,
  }) {
    uid = product.uid;
  }

  int tPrice() {
    return quantity * product.price;
  }
}
