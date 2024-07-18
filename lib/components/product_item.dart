import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/cart_provider.dart';
import 'package:malltiverse_hng/models/cart.dart';
import 'package:malltiverse_hng/models/product.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class ProductItem extends ConsumerWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return SizedBox(
      width: (MediaQuery.sizeOf(context).width - 60) / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image(
              image: NetworkImage(product.images[0]),
              height: 174,
            ),
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
