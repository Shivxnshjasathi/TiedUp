import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiedup/const/text_styles.dart';
import 'package:tiedup/controllers/cart_controller.dart';
import 'package:tiedup/controllers/shopping_controller.dart';

import '../const/colors.dart';

class ShoppingPage extends StatefulWidget {
  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final shoppingController = Get.put(ShoppingController());

  final cartController = Get.put(CartController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40)),
                          margin: EdgeInsets.all(15),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 10),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          color: Color(0xfff2ecec),
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: ClipRRect(
                                           borderRadius: BorderRadius.circular(40),
                                          child: Image.network('${controller.products[index].productImage}',fit: BoxFit.cover)),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${controller.products[index].productName}',
                                          style: boldtext24),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 180,
                                        height: 80,
                                        child: AutoSizeText(
                                          '${controller.products[index].productDescription}',
                                          style: boldtextsmall,
                                          maxLines: 4,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 180,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                '₹ ${controller.products[index].price}',
                                                style: boldtext20),
                                            InkWell(
                                              onTap: () {
                                                cartController.addToCart(
                                                    controller.products[index]);
                                              },
                                              child: Container(
                                                  height: 40,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                      color: Acesnt_Color),
                                                  child: Center(
                                                    child: Text(
                                                      "Buy",
                                                      style: GoogleFonts.alata(
                                                        //overflow: TextOverflow.ellipsis,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  );
                },
              ),
            ),

            /* GetX<CartController>(builder: (controller) {
              return Text(
                'Total amount: \$ ${controller.totalPrice}',
                style: TextStyle(fontSize: 32, color: Colors.white),
              );
            }),*/
          ],
        ),
      ),
    );
  }
}
