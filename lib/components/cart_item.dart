import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/cart_provider.dart';
import 'package:malltiverse_hng/models/cart.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class CartItem extends ConsumerWidget {
  final Cart cartItem;
  const CartItem({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAction = ref.read(cartProvider.notifier);
    return Container(
      height: 138,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: constBlackColor.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: NetworkImage(cartItem.product.images[0]),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.name,
                  style: GoogleFonts.montserrat(
                      color: constBlackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Text(
                  cartItem.product.desciption,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    color: constBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                const Spacer(),
                // Increamentals
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          cartAction.decreamentQuatity(cartItem);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: constBlackColor),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            '-',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              height: 1,
                              color: constBlackColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        '${cartItem.quantity}',
                        style: GoogleFonts.montserrat(
                          color: constBlackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          cartAction.increamentQuatity(cartItem);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: constBlackColor),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            '+',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              height: 1,
                              color: constBlackColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => cartAction.removeFromCart(cartItem.uid),
                child: SvgPicture.asset(
                  'assets/images/trash.svg',
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    constBlackColor.withOpacity(0.5),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'N ${cartItem.tPrice()}',
                style: GoogleFonts.montserrat(
                  color: constBlackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
