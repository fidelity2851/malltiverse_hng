import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/models/product.dart';
import 'package:malltiverse_hng/providers/wishlist_provider.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class WishlistItem extends ConsumerWidget {
  final Product wishItem;
  const WishlistItem({
    super.key,
    required this.wishItem,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishAction = ref.read(wishlistProvider.notifier);
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
            image: NetworkImage(wishItem.images[0]),
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
                  wishItem.name,
                  style: GoogleFonts.montserrat(
                      color: constBlackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                const Spacer(),
                Text(
                  'N ${wishItem.price}',
                  style: GoogleFonts.montserrat(
                    color: constBlackColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => wishAction.removeFromWishlist(wishItem.uid),
                child: SvgPicture.asset(
                  'assets/images/trash.svg',
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    constBlackColor.withOpacity(0.5),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
