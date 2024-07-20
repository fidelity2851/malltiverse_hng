import 'package:hive_flutter/adapters.dart';
import 'package:malltiverse_hng/models/product.dart';

part 'cart.g.dart';

@HiveType(typeId: 3)
class Cart {
   @HiveField(0)
  String uid = '';
   @HiveField(1)
  int quantity;
   @HiveField(2)
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

  // Create a Product from a Map
  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      quantity: map['quantity'],
      product: map['product'],
    );
  }
}
