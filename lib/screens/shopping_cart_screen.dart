import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/providers/cart_provider.dart';
import 'package:malltiverse_hng/components/bottom_nav.dart';
import 'package:malltiverse_hng/components/cart_item.dart';
import 'package:malltiverse_hng/components/custom_button.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
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
        backgroundColor: constWhiteColor,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: cart.isNotEmpty
              ? Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      physics: const ScrollPhysics(),
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          cartItem: cart[index],
                        );
                      },
                    ),

                    // Summary
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: constBlackColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shopping Summary',
                            style: GoogleFonts.montserrat(
                              color: constBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Discount Code',
                            style: GoogleFonts.montserrat(
                              color: constBlackColor.withOpacity(0.5),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: constBlackColor,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                                  style: GoogleFonts.montserrat(
                                    color: constBlackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    padding: WidgetStateProperty.all(
                                      const EdgeInsets.symmetric(
                                        vertical: 17,
                                        horizontal: 20,
                                      ),
                                    ),
                                    backgroundColor: WidgetStateProperty.all(
                                      constPrimaryColor,
                                    ),
                                    shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ))),
                                child: Text(
                                  'Apply',
                                  style: GoogleFonts.montserrat(
                                    color: constBlackColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery Fee',
                                style: GoogleFonts.montserrat(
                                  color: constBlackColor.withOpacity(0.5),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'N 600',
                                style: GoogleFonts.montserrat(
                                  color: constBlackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Discount Amount',
                                style: GoogleFonts.montserrat(
                                  color: constBlackColor.withOpacity(0.5),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'N 0',
                                style: GoogleFonts.montserrat(
                                  color: constBlackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sub-Total',
                                style: GoogleFonts.montserrat(
                                  color: constBlackColor.withOpacity(0.5),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'N ${ref.watch(cartProvider.notifier).getSubTotal()}',
                                style: GoogleFonts.montserrat(
                                  color: constBlackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Image(
                              image:
                                  AssetImage('assets/images/dashed_line.png')),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Amount',
                                style: GoogleFonts.montserrat(
                                  color: constBlackColor.withOpacity(0.5),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'N ${ref.read(cartProvider.notifier).getTotalAmount()}',
                                style: GoogleFonts.montserrat(
                                  color: constBlackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: CustomButton(
                              title: 'Checkout',
                              url: '/checkout',
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Center(
                  child: Text(
                    'No item in Cart',
                    style: GoogleFonts.montserrat(
                      color: constBlackColor.withOpacity(0.5),
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
        ),
      ),

      // Custom Button Navigation
      bottomNavigationBar: const BottomNav(pageIndex: 3),
    );
  }
}
