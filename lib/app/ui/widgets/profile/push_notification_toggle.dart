import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/profile.dart';
import '../../theme/colors.dart';

class PushNotificationToggle extends StatelessWidget {
  const PushNotificationToggle({super.key, required this.controller, required this.onTap});

  final bool controller;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.only(top: 80),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primary,
              ),
              color: controller == true ? AppColors.primary : AppColors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Text(
              "ON",
              style: TextStyle(
                color: controller == true ? AppColors.white : AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            // margin: EdgeInsets.only(top: 80),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primary,
              ),
              color: controller == true ? AppColors.white : AppColors.primary,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Text(
              "OFF",
              style: TextStyle(
                color: controller == true ? AppColors.primary : AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
