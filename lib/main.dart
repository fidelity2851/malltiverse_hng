import 'package:flutter/material.dart';
import 'package:malltiverse_hng/screens/cart_screen.dart';
import 'package:malltiverse_hng/screens/checkout_screen.dart';
import 'package:malltiverse_hng/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:malltiverse_hng/screens/payment_screen.dart';
import 'package:malltiverse_hng/screens/shopping_cart_screen.dart';
import 'package:malltiverse_hng/screens/successful_screen.dart';

void main() {
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
        '/cart': (context) => const CartScreen(),
        '/shopping-cart': (context) => const ShoppingCartScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/successful_screen': (context) => const SuccessfulScreen(),
      },
    );
  }
}
