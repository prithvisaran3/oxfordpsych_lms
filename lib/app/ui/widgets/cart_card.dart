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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Get Started With Python'),
                  Text(
                    '\$40.50',
                    style: TextStyle(
                        color: Colors.teal, fontSize: 18, fontFamily: 'medium'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: const [
                Icon(
                  Icons.remove,
                  size: 20,
                ),
                Text('1'),
                Icon(
                  Icons.add,
                  size: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
