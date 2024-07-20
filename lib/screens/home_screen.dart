import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:malltiverse_hng/components/bottom_nav.dart';
import 'package:malltiverse_hng/components/category_with_products.dart';
import 'package:malltiverse_hng/utility/constant.dart';
import 'package:malltiverse_hng/viewmodel/products_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text('Product List'),
        leading: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Image(image: AssetImage('assets/images/logo.png')),
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
        leadingWidth: 120,
        titleTextStyle: GoogleFonts.montserrat(
          color: constBlackColor,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: constWhiteColor,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Banner Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Image(
                      image: AssetImage('assets/images/banner.png'),
                      height: 232,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Premium Sound, \nPremium Savings',
                            style: GoogleFonts.montserrat(
                                color: constWhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Limited offer, hope on and get yours now',
                            style: GoogleFonts.montserrat(
                                color: constWhiteColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Category Name With Products

            Padding(
              padding: const EdgeInsets.only(left: constPadding),
              child: products.when(data: (data) {
                return ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CategoryWithProducts(
                        products: data[index],
                      );
                    });
              }, error: (error, stackTrace) {
                return Text(error.toString());
              }, loading: () {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.green[600],
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),

      // Custom Button Navigation
      bottomNavigationBar: const BottomNav(pageIndex: 1),
    );
  }
}
