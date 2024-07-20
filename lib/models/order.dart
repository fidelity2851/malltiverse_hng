import 'package:hive_flutter/adapters.dart';
import 'package:malltiverse_hng/models/cart.dart';
import 'package:malltiverse_hng/models/product.dart';
part 'order.g.dart';

@HiveType(typeId: 2)
class Order {
  @HiveField(0)
  final String uid;
  @HiveField(1)
  final DateTime? orderDate;
  @HiveField(2)
  final List<Cart>? products;
  @HiveField(3)
  final int? totalAmount;
  @HiveField(4)
  final String? status;
  @HiveField(5)
  final String? paymentMethod;
  @HiveField(6)
  final String? shippingAddress;

  Order({
    required this.uid,
    this.orderDate,
    this.products,
    this.totalAmount,
    this.status,
    this.paymentMethod,
    this.shippingAddress,
  });

  // Copy with method
  Order copyWith({
    String? uid,
    DateTime? orderDate,
    List<Cart>? products,
    int? totalAmount,
    String? status,
    String? paymentMethod,
    String? shippingAddress,
  }) {
    return Order(
      uid: uid ?? this.uid,
      orderDate: orderDate ?? this.orderDate,
      products: products ?? this.products,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      shippingAddress: shippingAddress ?? this.shippingAddress,
    );
  }

  // Convert an Order into a Map
  // Map<String, dynamic> fromJson() {
  //   return {
  //     'uid': uid,
  //     'customerId': customerId,
  //     'orderDate': orderDate.toIso8601String(),
  //     'products': products.map((product) => Product.fromJson(Map<String, dynamic>.from(product))).toList(),
  //     'totalAmount': totalAmount,
  //     'status': status,
  //     'paymentMethod': paymentMethod,
  //     'shippingAddress': shippingAddress,
  //   };
  // }

  // Create an Order from a Map
  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      uid: map['uid'],
      orderDate: DateTime.parse(map['orderDate']),
      products: List<Cart>.from(map['products']
          .map((item) => Product.fromMap(Map<String, dynamic>.from(item)))),
      totalAmount: map['totalAmount'],
      status: map['status'],
      paymentMethod: map['paymentMethod'],
      shippingAddress: map['shippingAddress'],
    );
  }
}
