import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/components/bottom_nav.dart';
import 'package:malltiverse_hng/components/custom_button.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Checkout'),
        leading: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Image(image: AssetImage('assets/images/logo.png')),
        ),
        leadingWidth: 120,
        titleTextStyle: GoogleFonts.montserrat(
          color: constBlackColor,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: constWhiteColor,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select how to receive your package(s)',
                style: GoogleFonts.montserrat(
                  color: constBlackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Pickup',
                style: GoogleFonts.montserrat(
                  color: constBlackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: selectedOption,
                    fillColor: WidgetStateProperty.all(
                      selectedOption == 1
                          ? constPrimaryColor
                          : constBlackColor.withOpacity(0.5),
                    ),
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value as int;
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Old Secretariat Complex, Area 1, Garki Abaji Abji',
                    style: GoogleFonts.montserrat(
                      color: constBlackColor.withOpacity(0.5),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: selectedOption,
                    fillColor: WidgetStateProperty.all(
                      selectedOption == 2
                          ? constPrimaryColor
                          : constBlackColor.withOpacity(0.5),
                    ),
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value as int;
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Sokoto Street, Area 1, Garki Area 1 AMAC',
                    style: GoogleFonts.montserrat(
                      color: constBlackColor.withOpacity(0.5),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Delivery',
                style: GoogleFonts.montserrat(
                  color: constBlackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: constBlackColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: constBlackColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: GoogleFonts.montserrat(
                        color: constBlackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Contact',
                style: GoogleFonts.montserrat(
                  color: constBlackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Phone nos 1',
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: constBlackColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: constBlackColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: GoogleFonts.montserrat(
                        color: constBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(width: 100),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Phone nos 1',
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: constBlackColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: constBlackColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: GoogleFonts.montserrat(
                        color: constBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(width: 100),
                ],
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomButton(
                  title: 'Go to Payment',
                  url: '/payment',
                ),
              ),
            ],
          ),
        ),
      ),

      // Custom Button Navigation
      bottomNavigationBar: const BottomNav(pageIndex: 3),
    );
  }
}
