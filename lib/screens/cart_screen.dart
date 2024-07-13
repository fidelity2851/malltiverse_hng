import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/components/bottom_nav.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('My Cart'),
        leading: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Image(image: AssetImage('assets/images/logo.png')),
        ),
        leadingWidth: 120,
        titleTextStyle: GoogleFonts.montserrat(
          color: constBlackColor,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: const Color(0xFAFAFAFA),
      ),

      body: Center(
        child: Text(
          'No item in Cart',
          style: GoogleFonts.montserrat(
            color: constBlackColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Custom Button Navigation
      bottomNavigationBar: const BottomNav(pageIndex: 2),
    );
  }
}
