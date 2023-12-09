import 'package:deviraj_lms/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/profile.dart';
import '../../theme/colors.dart';

class SubscriptionStatusBar extends StatelessWidget {
  const SubscriptionStatusBar({super.key, this.status = false, this.name});

  final bool status;
  final dynamic name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: status == true ? AppColors.primary : AppColors.white,
        border: Border.all(color: AppColors.black),
        borderRadius: BorderRadius.circular(30),
      ),
      child: status == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  FontAwesomeIcons.crown,
                  color: AppColors.amber,
                  size: 16,
                ),
                const SizedBox(
                  width: 10,
                ),
                CommonText(
                  text: name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.white,
                  ),
                ),
              ],
            )
          : const CommonText(
              text: "No Subscription",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.black,
              ),
            ),
    );
  }
}
