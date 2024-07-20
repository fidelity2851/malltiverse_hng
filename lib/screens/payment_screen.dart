import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/components/bottom_nav.dart';
import 'package:malltiverse_hng/providers/cart_provider.dart';
import 'package:malltiverse_hng/providers/current_order_provider.dart';
import 'package:malltiverse_hng/providers/order_provider.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();

  final cardNumberController = TextEditingController();
  final cardDateController = TextEditingController();
  final cardCvvController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    cardNumberController.dispose();
    cardDateController.dispose();
    cardCvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final order = ref.watch(orderProvider.notifier);
    final currentOrderAction = ref.watch(currentOrderProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: const Text('Payment'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Image(image: AssetImage('assets/images/arrow-left.png')),
        ),
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    color: constBlackColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const Positioned(
                        top: 0,
                        right: 50,
                        child: Image(
                            image: AssetImage('assets/images/ellipse1.png')),
                      ),
                      const Positioned(
                        top: 0,
                        right: 0,
                        child: Image(
                            image: AssetImage('assets/images/ellipse2.png')),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Text(
                          'VISA',
                          style: GoogleFonts.montserrat(
                            color: constWhiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '5047 1245 7689 2345',
                                style: GoogleFonts.montserrat(
                                  color: constWhiteColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Card holder name',
                                        style: GoogleFonts.montserrat(
                                          color: constWhiteColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        'Hafsat Ardo',
                                        style: GoogleFonts.montserrat(
                                          color: constWhiteColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Card holder name',
                                        style: GoogleFonts.montserrat(
                                          color: constWhiteColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '02/30',
                                        style: GoogleFonts.montserrat(
                                          color: constWhiteColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Image(
                                    image: AssetImage('assets/images/chip.png'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Card Number',
                  style: GoogleFonts.montserrat(
                    color: constBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: cardNumberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please card number';
                          } else if (value.length > 16 || value.length < 16) {
                            return 'Not a valid card number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0000 0000 0000 0000',
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: constBlackColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: constBlackColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: GoogleFonts.montserrat(
                          color: constBlackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expiry Date',
                            style: GoogleFonts.montserrat(
                              color: constBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  controller: cardDateController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter expiry date';
                                    } else if (value.length > 4 ||
                                        value.length < 4) {
                                      return 'Date must be 4 values';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'MM/YY',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: constBlackColor,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: constBlackColor,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  style: GoogleFonts.montserrat(
                                    color: constBlackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CVV',
                            style: GoogleFonts.montserrat(
                              color: constBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  controller: cardCvvController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your CVV';
                                    } else if (value.length > 3 ||
                                        value.length < 3) {
                                      return 'CVV must be 3 values';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '123',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: constBlackColor,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: constBlackColor,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  style: GoogleFonts.montserrat(
                                    color: constBlackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        currentOrderAction.addPaymentInfo({
                          'type': 'Card',
                        });

                        await order.addToOrders(ref.read(currentOrderProvider));
                        ref.read(cartProvider.notifier).clearCart();

                        Navigator.pushNamed(context, '/successful_screen');
                      }
                    },
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(
                        const Size.fromHeight(50),
                      ),
                      backgroundColor: WidgetStateProperty.all(
                        constPrimaryColor,
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      'Make Payment',
                      style: GoogleFonts.montserrat(
                        color: constBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Custom Button Navigation
      bottomNavigationBar: const BottomNav(pageIndex: 3),
    );
  }
}
