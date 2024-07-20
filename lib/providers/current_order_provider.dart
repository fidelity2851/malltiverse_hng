import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:malltiverse_hng/models/order.dart';

class CurrentOrderNotifier extends StateNotifier<Order> {
  // Initialise Orders Provider
  CurrentOrderNotifier() : super(Order(uid: '0000')) {
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
    // final box = await Hive.openBox('currentOrderBox');
    final initialOrder = Order(uid: generateUniqueId());
    state = initialOrder;
  }

  // Add Cart To Orders
  void addOrder(orderItem) async {
    state = orderItem;
  }

  // Add Shipping Info To Orders
  void addShippingInfo(shippingInfo) async {
    final order = state.copyWith(shippingAddress: shippingInfo['address']);
    state = order;
  }

  // Add Payment Info To Orders
  void addPaymentInfo(paymentInfo) async {
    final order = state.copyWith(paymentMethod: paymentInfo['type']);
    state = order;

    completeOrder();
  }

  void completeOrder() {
    final order =
        state.copyWith(status: 'Processing', orderDate: DateTime.now());
    state = order;
  }

}

final currentOrderProvider =
    StateNotifierProvider<CurrentOrderNotifier, Order>((ref) {
  return CurrentOrderNotifier();
});
