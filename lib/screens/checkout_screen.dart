import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/components/bottom_nav.dart';
import 'package:malltiverse_hng/providers/current_order_provider.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  String selectedOption = 'Old Secretariat Complex, Area 1, Garki Abaji Abji';

  final _formKey = GlobalKey<FormState>();

  final phone1Controller = TextEditingController();
  final phone2Controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    phone1Controller.dispose();
    phone2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentOrderAction = ref.watch(currentOrderProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
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
          child: Form(
            key: _formKey,
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
                      value:
                          'Old Secretariat Complex, Area 1, Garki Abaji Abji',
                      groupValue: selectedOption,
                      fillColor: WidgetStateProperty.all(
                        selectedOption ==
                                'Old Secretariat Complex, Area 1, Garki Abaji Abji'
                            ? constPrimaryColor
                            : constBlackColor.withOpacity(0.5),
                      ),
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value ?? '';
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
                      value: 'Sokoto Street, Area 1, Garki Area 1 AMAC',
                      groupValue: selectedOption,
                      fillColor: WidgetStateProperty.all(
                        selectedOption ==
                                'Sokoto Street, Area 1, Garki Area 1 AMAC'
                            ? constPrimaryColor
                            : constBlackColor.withOpacity(0.5),
                      ),
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value ?? '';
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
                      child: TextFormField(
                        initialValue: selectedOption,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Address';
                          }
                          return null;
                        },
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
                      child: TextFormField(
                        controller: phone1Controller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Phone number 1',
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
                      child: TextFormField(
                        controller: phone2Controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Phone number 2',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        currentOrderAction.addShippingInfo({
                          'address': selectedOption,
                          'phone1': phone1Controller.text,
                          'phone2': phone2Controller.text,
                        });
                        Navigator.pushNamed(context, '/payment');
                      } else {
                        print('Failed');
                      }
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
                      'Go to payment',
                      style: GoogleFonts.montserrat(
                        color: constBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Custom Button Navigation
      bottomNavigationBar: const BottomNav(pageIndex: 3),
    );
  }
}
