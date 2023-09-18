import 'package:deviraj_lms/app/ui/pages/payment.dart';
import 'package:deviraj_lms/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helper/style.dart';
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
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: AppColors.black),
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 18,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Course Detail",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
                softWrap: false,
                style: headText(),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: CommonText(
                  text: "10",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 5),
              CommonText(
                  text: "items",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              SizedBox(width: 20),
            ],
          )
        ],
      ),
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
              children: const [Text('Tax'), Text('Free')],
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
