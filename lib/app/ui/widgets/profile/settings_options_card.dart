import 'package:deviraj_lms/app/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsOptionsCard extends StatelessWidget {
  const SettingsOptionsCard(
      {super.key, required this.text, required this.onTap});

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        // margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //   color: AppColors.black,
          //   width: .4,
          // ),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: AppColors.black.withOpacity(0.7),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grey,
            )
          ],
        ),
      ),
    );
  }
}
