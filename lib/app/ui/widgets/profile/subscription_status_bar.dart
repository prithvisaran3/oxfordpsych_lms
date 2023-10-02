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
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary,
              AppColors.secondary,
            ],
          ),
          boxShadow: [
            BoxShadow(color: AppColors.grey, spreadRadius: 1, blurRadius: 1)
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
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
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Subscribed",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
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
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Text(
                      "${ProfileController.to.subscriptionDetail.packageName}",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Obx(
              () => ProfileController.to.isSubscribed == false
                  ? SizedBox(
                      height: 15.0,
                    )
                  : SizedBox(),
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
