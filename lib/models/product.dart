class Product {
  String uid;
  String name;
  String desciption;
  int stock;
  int price;
  List<String> images;

  Product({
    required this.uid,
    required this.name,
    required this.desciption,
    required this.stock,
    required this.price,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      uid: json['id'],
      name: json['name'],
      desciption: json['description'] ?? 'No description',
      stock: (json['available_quantity']).toInt(),
      price: (json['current_price'][0]['NGN'][0]).toInt(),
      images: (json['photos'] as List)
          .map((photo) => 'https://api.timbu.cloud/images/${photo['url']}')
          .toList(),
    );
  }

  // Create a Product from a Map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      uid: map['id'],
      name: map['name'],
      desciption: map['description'] ?? 'No description',
      stock: (map['available_quantity']).toInt(),
      price: (map['current_price'][0]['NGN'][0]).toInt(),
      images: (map['photos'] as List)
          .map((photo) => 'https://api.timbu.cloud/images/${photo['url']}')
          .toList(),
    );
  }
}
