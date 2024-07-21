import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/components/bottom_nav.dart';
import 'package:malltiverse_hng/components/order_item.dart';
import 'package:malltiverse_hng/providers/order_provider.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(orderProvider);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text('Order History'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Image(image: AssetImage('assets/images/arrow-left.png')),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/orders');
            },
            child: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                'assets/images/order.svg',
                colorFilter: const ColorFilter.mode(
                  constPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
        titleTextStyle: GoogleFonts.montserrat(
          color: constBlackColor,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: constWhiteColor,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: order.isNotEmpty
              ? Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      physics: const ScrollPhysics(),
                      itemCount: order.length,
                      itemBuilder: (context, index) {
                        return OrderItem(order: order[index]);
                      },
                    ),
                  ],
                )
              : Center(
                  child: Text(
                    'No item in Order',
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
      bottomNavigationBar: const BottomNav(pageIndex: 0),
    );
  }
}
