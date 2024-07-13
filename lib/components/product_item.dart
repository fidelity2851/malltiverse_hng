import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.sizeOf(context).width),
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color(0xFFEDEDED),
            width: double.infinity,
            child: const Image(
              image: AssetImage('assets/images/product1.png'),
              height: 184,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Joystick Game Controller',
            style: GoogleFonts.montserrat(
                color: constBlackColor,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
          Text(
            'Wired UCOM USB Pad....',
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
            'N11,250',
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(
                color: constPrimaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {},
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
          ),
        ],
      ),
    );
  }
}
