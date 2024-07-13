import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          const Image(
            image: AssetImage('assets/images/product1.png'),
            height: 70,
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ladies Leather Chic Bag',
                  style: GoogleFonts.montserrat(
                      color: constBlackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Text(
                  'Office Trendy Handbag Brown dsfw er',
                  softWrap: true,
                  style: GoogleFonts.montserrat(
                    color: constBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                const Spacer(),
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
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
                        '1',
                        style: GoogleFonts.montserrat(
                          color: constBlackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
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
              SvgPicture.asset(
                'assets/images/trash.svg',
                height: 20,
                colorFilter: ColorFilter.mode(
                  constBlackColor.withOpacity(0.5),
                  BlendMode.srcIn,
                ),
              ),
              const Spacer(),
              Text(
                'N 20,950',
                style: GoogleFonts.montserrat(
                    color: constBlackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
