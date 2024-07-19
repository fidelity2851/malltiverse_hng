import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:malltiverse_hng/screens/order_details_screen.dart';
import 'package:malltiverse_hng/screens/order_screen.dart';
import 'package:malltiverse_hng/screens/wishlist_screen.dart';
import 'package:malltiverse_hng/screens/checkout_screen.dart';
import 'package:malltiverse_hng/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:malltiverse_hng/screens/payment_screen.dart';
import 'package:malltiverse_hng/screens/shopping_cart_screen.dart';
import 'package:malltiverse_hng/screens/successful_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

// Initialise Hive
  await Hive.initFlutter();


  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/cart': (context) => const WishlistScreen(),
        '/orders': (context) => const OrderScreen(),
        '/order_details': (context) => const OrderDetailsScreen(),
        '/shopping-cart': (context) => const ShoppingCartScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/successful_screen': (context) => const SuccessfulScreen(),
      },
    );
  }
}
