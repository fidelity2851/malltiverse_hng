import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class BottomNav extends StatelessWidget {
  final int pageIndex;
  const BottomNav({
    super.key,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 67,
        decoration: BoxDecoration(
          color: constBlackColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:
                      pageIndex == 1 ? constPrimaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: SvgPicture.asset(
                  'assets/images/home.svg',
                  colorFilter: ColorFilter.mode(
                    pageIndex == 1 ? constBlackColor : constWhiteColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
              child: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:
                      pageIndex == 2 ? constPrimaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: SvgPicture.asset(
                  'assets/images/star.svg',
                  colorFilter: ColorFilter.mode(
                    pageIndex == 2 ? constBlackColor : constWhiteColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/shopping-cart');
              },
              child: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color:
                      pageIndex == 3 ? constPrimaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: SvgPicture.asset(
                  'assets/images/shopping-cart.svg',
                  colorFilter: ColorFilter.mode(
                    pageIndex == 3 ? constBlackColor : constWhiteColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
