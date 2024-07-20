import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/models/order.dart';
import 'package:malltiverse_hng/screens/order_details_screen.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class OrderItem extends StatelessWidget {
  final Order order;
  const OrderItem({super.key, required this.order});

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(order: order),
          ),
        );
      },
      child: Container(
        height: 170,
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
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'orderID',
                    style: GoogleFonts.montserrat(
                        color: constBlackColor.withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    order.uid,
                    style: GoogleFonts.montserrat(
                        color: constBlackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amount',
                            style: GoogleFonts.montserrat(
                                color: constBlackColor.withOpacity(0.5),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'N ${order.totalAmount}',
                            style: GoogleFonts.montserrat(
                              color: constBlackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status',
                            style: GoogleFonts.montserrat(
                                color: constBlackColor.withOpacity(0.5),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${order.status}',
                            style: GoogleFonts.montserrat(
                              color: constPrimaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment Type',
                            style: GoogleFonts.montserrat(
                                color: constBlackColor.withOpacity(0.5),
                                fontSize: 11,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            order.paymentMethod ?? 'None',
                            style: GoogleFonts.montserrat(
                                color: constBlackColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NO of items',
                            style: GoogleFonts.montserrat(
                                color: constBlackColor.withOpacity(0.5),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${order.products?.length}',
                            style: GoogleFonts.montserrat(
                              color: constBlackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date',
                            style: GoogleFonts.montserrat(
                                color: constBlackColor.withOpacity(0.5),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${order.orderDate?.year ?? 0000}-${_twoDigits(order.orderDate?.month ?? 0)}-${_twoDigits(order.orderDate?.day ?? 0)}',
                            style: GoogleFonts.montserrat(
                              color: constBlackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
