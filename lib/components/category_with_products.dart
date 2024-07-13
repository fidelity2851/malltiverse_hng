import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/components/current_item_indicator.dart';
import 'package:malltiverse_hng/components/product_item.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class CategoryWithProducts extends StatefulWidget {
  final String title;
  const CategoryWithProducts({
    super.key,
    required this.title,
  });

  @override
  State<CategoryWithProducts> createState() => _CategoryWithProductsState();
}

class _CategoryWithProductsState extends State<CategoryWithProducts> {
  var _currentPage = 0;
  final PageController _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.montserrat(
            color: constBlackColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 347,
          child: PageView.builder(
            padEnds: false,
            controller: _pageViewController,
            itemCount: 5,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemBuilder: (context, index) {
              return const ProductItem();
            },
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < 5; i++) ...[
              CurrentItemIndicator(isCurrentPage: _currentPage == i),
              const SizedBox(width: 13.0),
            ],
          ],
        )
      ],
    );
  }
}
