import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malltiverse_hng/components/bottom_nav.dart';
import 'package:malltiverse_hng/models/order.dart';
import 'package:malltiverse_hng/utility/constant.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;
  const OrderDetailsScreen({
    super.key,
    required this.order,
  });

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Image(image: AssetImage('assets/images/arrow-left.png')),
        ),
        title: const Text('Order History'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/orders');
            },
            child: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                'assets/images/order.svg',
                colorFilter: const ColorFilter.mode(
                  constPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
        titleTextStyle: GoogleFonts.montserrat(
          color: constBlackColor,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: constWhiteColor,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'orderID',
                      style: GoogleFonts.montserrat(
                          color: constBlackColor.withOpacity(0.5),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      order.uid,
                      style: GoogleFonts.montserrat(
                          color: constBlackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Amount',
                              style: GoogleFonts.montserrat(
                                  color: constBlackColor.withOpacity(0.5),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'N ${order.totalAmount}',
                              style: GoogleFonts.montserrat(
                                color: constBlackColor,
                                fontSize: 20,
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
                              'Status',
                              style: GoogleFonts.montserrat(
                                  color: constBlackColor.withOpacity(0.5),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '${order.status}',
                              style: GoogleFonts.montserrat(
                                color: constPrimaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
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
              order.products?.length != null
                  ? Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          physics: const ScrollPhysics(),
                          itemCount: order.products?.length,
                          itemBuilder: (context, index) {
                            return order.products?.length != null
                                ? Container(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(
                                          image: NetworkImage(order
                                                  .products?[index]
                                                  .product
                                                  .images[0] ??
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3vrTUU3CKbUDThpm8aZzFXdTmai6PodNfXA&s"),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                order.products?[index].product
                                                        .name ??
                                                    "",
                                                style: GoogleFonts.montserrat(
                                                    color: constBlackColor,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                'Quantity',
                                                style: GoogleFonts.montserrat(
                                                    color: constBlackColor
                                                        .withOpacity(0.5),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                '${order.products?[index].quantity}',
                                                style: GoogleFonts.montserrat(
                                                  color: constBlackColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                'N ${order.products?[index].tPrice()}',
                                                style: GoogleFonts.montserrat(
                                                  color: constBlackColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox();
                          },
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        'No item in order',
                        style: GoogleFonts.montserrat(
                          color: constBlackColor.withOpacity(0.5),
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),

      // Custom Button Navigation
      bottomNavigationBar: const BottomNav(pageIndex: 0),
    );
  }
}
