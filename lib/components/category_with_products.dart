import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/components/current_item_indicator.dart';
import 'package:malltiverse_hng/components/product_item.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class CategoryWithProducts extends StatefulWidget {
  final Map<String, dynamic> products;
  const CategoryWithProducts({
    super.key,
    required this.products,
  });

  @override
  State<CategoryWithProducts> createState() => _CategoryWithProductsState();
}

class _CategoryWithProductsState extends State<CategoryWithProducts> {
  var _currentPage = 0;
  final PageController _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.products['name'],
            style: GoogleFonts.montserrat(
              color: constBlackColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 347,
            child: PageView.builder(
              padEnds: false,
              controller: _pageViewController,
              itemCount: (widget.products['products'].length / 2).ceil(),
              onPageChanged: (i) => setState(() => _currentPage = i),
              itemBuilder: (context, index) {
                final firstIndex = index * 2;
                final product1 = widget.products['products'][firstIndex];
                final product2 =
                    firstIndex + 1 < widget.products['products'].length
                        ? widget.products['products'][firstIndex + 1]
                        : null;
                return Row(
                  children: [
                    ProductItem(product: product1),
                    const SizedBox(width: 20),
                    if (product2 != null) ...[
                      ProductItem(product: product2),
                      const SizedBox(width: 20),
                    ],
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0;
                  i < (widget.products['products'].length / 2).ceil();
                  i++) ...[
                CurrentItemIndicator(isCurrentPage: _currentPage == i),
                const SizedBox(width: 13.0),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
