import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:malltiverse_hng/models/product.dart';

class WishlistNotifier extends StateNotifier<List<Product>> {
  // Initialise Wishlist Provider
  WishlistNotifier() : super([]) {
    _loadInitialWishlist();
  }

  // Load initial wishlist items from Hive
  void _loadInitialWishlist() async {
    final box = await Hive.openBox<Product>('wishlistBox');
    final initialWishlist = box.values.map((item) => item).toList();
    state = initialWishlist;
  }

  bool inWishlist(String uid) {
    return state.any((item) => item.uid == uid);
  }

  // Add Product To Wishlist
  void toggleToWishlist(Product wishItem) async {
    final box = await Hive.openBox<Product>('wishlistBox');
    if (state.any((item) => item.uid == wishItem.uid)) {
      state = [...state];
      state.removeWhere((item) => item.uid == wishItem.uid);
      await box.delete(wishItem.uid); // Remove from Hive
    } else {
      state = [...state, wishItem];
      await box.put(wishItem.uid, wishItem); // Add to Hive
    }
  }

  // Remove Product From Wishlist
  void removeFromWishlist(String uid) async {
    final box = await Hive.openBox<Product>('wishlistBox');
    // Ensure to create a new list to trigger state change
    state = [...state];
    // Remove the Wishlist Item with the uid
    state.removeWhere((item) => item.uid == uid);
    await box.delete(uid); // Remove from Hive
  }
}

final wishlistProvider =
    StateNotifierProvider<WishlistNotifier, List<Product>>((ref) {
  return WishlistNotifier();
});
