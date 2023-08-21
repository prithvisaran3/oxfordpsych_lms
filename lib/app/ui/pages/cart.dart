import 'package:deviraj_lms/pages/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/colors.dart';
import '../widgets/cart_card.dart';
import '../widgets/common/appbar.dart';
import '../widgets/common/common_button.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: commonAppBar(title: "Cart", isCartIcon: true,isBackIcon: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const CartCard();
                }),
            Container(
              height: 50,
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.grey.withOpacity(.3),
                        spreadRadius: 1,
                        blurRadius: 1)
                  ]),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        style: const TextStyle(color: AppColors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(5),
                          hintText: 'Coupon Code',
                          hintStyle:
                              TextStyle(color: AppColors.black.withOpacity(.3)),
                          filled: true,
                          fillColor: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: AppColors.white,
                        backgroundColor: AppColors.secondary,
                        elevation: 0,
                        minimumSize: const Size.fromHeight(40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Apply Now'),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text('Subtotal'), Text('\$40.95')],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text('Shipping'), Text('Free')],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Total'),
                Text(
                  '\$40.95',
                  style: TextStyle(
                      color: AppColors.secondary,
                      fontFamily: 'medium',
                      fontSize: 16),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8),
          child: CommonButton(
            text: "Proceed to Checkout",
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => payment()));
            },
          )),
    );
  }
}
