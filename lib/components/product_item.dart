import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/providers/cart_provider.dart';
import 'package:malltiverse_hng/models/cart.dart';
import 'package:malltiverse_hng/models/product.dart';
import 'package:malltiverse_hng/providers/wishlist_provider.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class ProductItem extends ConsumerWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final wishlist = ref.watch(wishlistProvider);

    return SizedBox(
      width: (MediaQuery.sizeOf(context).width - 60) / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image(
                  image: NetworkImage(product.images[0]),
                  height: 174,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    ref.read(wishlistProvider.notifier).toggleToWishlist(product);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    color: constWhiteColor,
                    child:
                        // Check if the product is in the wishlist
                        wishlist.any((item) => item.uid == product.uid)
                            ? SvgPicture.asset(
                                'assets/images/fill-star.svg',
                                colorFilter: const ColorFilter.mode(
                                  constPrimaryColor,
                                  BlendMode.srcIn,
                                ),
                              )
                            : SvgPicture.asset(
                                'assets/images/star.svg',
                                colorFilter: const ColorFilter.mode(
                                  constPrimaryColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Text(
            product.name,
            style: GoogleFonts.montserrat(
                color: constBlackColor,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
          Text(
            product.desciption,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(
                color: constBlackColor,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 5),
          const Row(children: [
            Image(image: AssetImage('assets/images/fill_star.png')),
            Image(image: AssetImage('assets/images/fill_star.png')),
            Image(image: AssetImage('assets/images/fill_star.png')),
            Image(image: AssetImage('assets/images/fill_star.png')),
            Image(image: AssetImage('assets/images/fill_star.png')),
          ]),
          const SizedBox(height: 10),
          Text(
            'N${product.price}',
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(
                color: constPrimaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          // Check if the product is in the cart
          cart.any((item) => item.uid == product.uid)
              ? ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    backgroundColor: WidgetStateProperty.all(constPrimaryColor),
                    side: WidgetStateProperty.all(
                      const BorderSide(
                        color: constPrimaryColor,
                        width: 1.0,
                      ),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                  child: Text(
                    'Added',
                    style: GoogleFonts.montserrat(
                      color: constWhiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : OutlinedButton(
                  onPressed: () {
                    ref.read(cartProvider.notifier).addToCart(
                          Cart(
                            quantity: 1,
                            product: product,
                          ),
                        );
                  },
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    side: WidgetStateProperty.all(
                      const BorderSide(
                        color: constPrimaryColor,
                        width: 1.0,
                      ),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: GoogleFonts.montserrat(
                      color: constBlackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
