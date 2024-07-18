import 'package:malltiverse_hng/models/product.dart';

class Order {
  String name;
  List<Product> products;

  Order({
    required this.name,
    required this.products,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    final categoryName = json['categories'].length > 0
        ? json['categories'][0]['name']
        : 'Others';

    return Order(name: categoryName, products: []);
  }
}
