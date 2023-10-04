import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/profile.dart';
import '../../../utility/utility.dart';
import '../../theme/colors.dart';

class SubscriptionStatusCard extends StatelessWidget {
  const SubscriptionStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(
        //   () => SubscribeNow(
        //     packages: [],
        //   ),
        // );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary,
              AppColors.secondary,
            ],
          ),
          boxShadow: const [
            BoxShadow(color: AppColors.grey, spreadRadius: 1, blurRadius: 1)
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Subscription Status ",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Expiry Date ",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Plan ",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        ProfileController.to.isSubscriptionExpiry == true
                            ? "Expired"
                            : "Subscribed",
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        ProfileController.to.subscriptionLoading == true
                            ? "..."
                            : getIsoToLocalDate(
                                date: ProfileController
                                    .to.subscriptionDetail.validTill
                                    .toString()),
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        ProfileController.to.subscriptionLoading == true
                            ? "..."
                            : "${ProfileController.to.subscriptionDetail.packageName}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Obx(
              () => ProfileController.to.isSubscribed == false
                  ? const SizedBox(
                      height: 15.0,
                    )
                  : const SizedBox(),
            ),
            Obx(() => ProfileController.to.isSubscriptionExpiry == true
                ? Column(
                    children: [
                      Text(
                        "Click Here To Subscribe".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                : const SizedBox())
          ],
        ),
      ),
    );
  }
}
