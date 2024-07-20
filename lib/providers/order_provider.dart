import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:malltiverse_hng/models/order.dart';

class OrderNotifier extends StateNotifier<List<Order>> {
  // Initialise Orders Provider
  OrderNotifier() : super([]) {
    _loadInitialOrders();
  }

  String generateUniqueId() {
    final random = Random();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomValue = random.nextInt(1000000); // Adjust the range as needed
    return '$timestamp$randomValue';
  }

  // Load initial order items from Hive
  void _loadInitialOrders() async {
    final box = await Hive.openBox<Order>('orderBox');
    final initialOrders = box.values.map((item) => item).toList();
    state = initialOrders;
  }

  // Add Product To Orders
  Future<void> addToOrders(Order orderItem) async {
    final box = await Hive.openBox<Order>('orderBox');
    await box.put(orderItem.uid, orderItem); // Add to Hive


    state = [...state];
    state = [...state, orderItem];
  }
}

final orderProvider = StateNotifierProvider<OrderNotifier, List<Order>>((ref) {
  return OrderNotifier();
});
