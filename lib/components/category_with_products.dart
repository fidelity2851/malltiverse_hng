import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/components/product_item.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class CategoryWithProducts extends StatelessWidget {
  final String title;
  const CategoryWithProducts({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(
            color: constBlackColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        FlutterCarousel.builder(
          itemCount: 5,
          options: CarouselOptions(
            height: 370,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            showIndicator: true,
          ),
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return const ProductItem();
          },
        ),
      ],
    );
  }
}
