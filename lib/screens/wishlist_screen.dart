import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/components/bottom_nav.dart';
import 'package:malltiverse_hng/components/wishlist_item.dart';
import 'package:malltiverse_hng/providers/wishlist_provider.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlist = ref.watch(wishlistProvider);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text('My Wishlist'),
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
          padding: const EdgeInsets.all(20),
          child: wishlist.isNotEmpty
              ? Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      physics: const ScrollPhysics(),
                      itemCount: wishlist.length,
                      itemBuilder: (context, index) {
                        return WishlistItem(
                          wishItem: wishlist[index],
                        );
                      },
                    ),
                  ],
                )
              : Center(
                  child: Text(
                    'No item in Wishlist',
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
      bottomNavigationBar: const BottomNav(pageIndex: 2),
    );
  }
}
