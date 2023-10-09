import 'package:deviraj_lms/app/ui/widgets/common/currency_text.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage('assets/images/course.jpg'),
                    fit: BoxFit.cover)),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Risk Analysis'),
                  CurrencyText(
                    amount: "40.50",
                    fontSize: 16,
                    fontWEIGHT: FontWeight.bold,
                    color: AppColors.secondary,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
