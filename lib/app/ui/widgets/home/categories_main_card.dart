import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class CategoriesMainCard extends StatelessWidget {
  const CategoriesMainCard(
      {super.key,
      required this.name,
      required this.image,
      required this.onTap});

  final String name;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  right: 10.0, left: 10.0, bottom: 10.0, top: 15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Colors.black,
                  width: 150,
                  height: 100,
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16, fontFamily: 'medium', color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
