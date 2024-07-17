import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:malltiverse_hng/models/product.dart';
import 'package:http/http.dart' as http;

class ProductController {
  final String orgId = '328f3079aa0a41d69ebf6b45fd0a0963';
  final String appId = '0V4LP27NSFRQSS3';
  final String apiKey = 'ad798766142f4427ae0ae31ab757929f20240705135733718036';

  List<Map<String, dynamic>> categories = [];

  ProductController();

  bool checkIfCategoryExist(String value, product) {
    for (var item in categories) {
      if (item['name'] == value) {
        item['products'].add(Product.fromJson(product));

        return true;
      }
    }
    return false;
  }

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final url =
        'https://api.timbu.cloud/products?organization_id=$orgId&Appid=$appId&Apikey=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body)['items'];

      json.map((productJson) {
        final cateName = productJson['categories'].length > 0
            ? productJson['categories'][0]['name']
            : 'Others';
        final category = {
          'name': cateName,
          'products': [
            Product.fromJson(productJson),
          ]
        };
        if (checkIfCategoryExist(cateName, productJson)) {
        } else {
          categories.add(category);
        }

        // print(categories);

        return Product.fromJson(productJson);
      }).toList();

      return categories;
    } else {
      throw Exception('Failed to load products');
    }
  }
}

final productProvider = FutureProvider<List<Map<String, dynamic>>>((ref) {
  return ProductController().fetchProducts();
});
