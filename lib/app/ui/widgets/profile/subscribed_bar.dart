import 'package:deviraj_lms/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/main.dart';
import '../../../controller/profile.dart';
import '../../theme/colors.dart';

class SubscriptionStatusBar extends StatelessWidget {
  SubscriptionStatusBar({super.key, this.status = false});

  final bool status;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
          height: 30,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: MainController.to.isSubscribed == true
                ? AppColors.black
                : AppColors.white,
            border: Border.all(color: AppColors.black),
            borderRadius: BorderRadius.circular(30),
          ),
          child: ProfileController.to.isSubscriptionExpiry == false
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
                      text: ProfileController
                                  .to.subscriptionDetail.packageName ==
                              null
                          ? "..."
                          : "${ProfileController.to.subscriptionDetail.packageName}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                )
              : const SizedBox()),
    );
  }
}
