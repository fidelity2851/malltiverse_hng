
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String url;
  const CustomButton({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, url);
      },
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          const Size.fromHeight(50),
        ),
        backgroundColor: WidgetStateProperty.all(
          constPrimaryColor,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          color: constBlackColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
