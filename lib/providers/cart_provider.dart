import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:malltiverse_hng/models/cart.dart';

class CartNotifer extends StateNotifier<List<Cart>> {
  // Initialise cart provider
  CartNotifer() : super([]);

  bool inCart(uid) {
    return state.any((item) => item.uid == uid);
  }

  // Add Product To Cart
  void addToCart(Cart cartItem) {
    state = [...state, cartItem];
  }

  // Increment Quantity
  void increamentQuatity(Cart cartItem) {
    state = [...state];
    final currentCart = state.firstWhere((cart) => cart == cartItem);
    currentCart.quantity < currentCart.product.stock
        ? currentCart.quantity++
        : null;
  }

  // Decrement Quantity
  void decreamentQuatity(Cart cartItem) {
    state = [...state];
    final currentCart = state.firstWhere((cart) => cart == cartItem);
    currentCart.quantity > 1 ? currentCart.quantity-- : null;
  }

  int getSubTotal() {
    int subTotal = 0;
    for (int i = 0; i < state.length; i++) {
      subTotal += state[i].product.price * state[i].quantity;
    }

    return subTotal;
  }

  int getTotalAmount() {
    int deliveryFee = 600;
    int discountAmount = 0;
    int totalAmount = deliveryFee;
    for (int i = 0; i < state.length; i++) {
      totalAmount += state[i].product.price * state[i].quantity;
    }

    return totalAmount - discountAmount;
  }

  // Remove Product From Cart
  void removeFromCart(String uid) {
    // Ensure to create a new list to trigger state change
    state = [...state];
    // Remove the Cart Item with the uid
    state.removeWhere((item) => item.uid == uid);
  }
}

final cartProvider = StateNotifierProvider<CartNotifer, List<Cart>>((ref) {
  return CartNotifer();
});
