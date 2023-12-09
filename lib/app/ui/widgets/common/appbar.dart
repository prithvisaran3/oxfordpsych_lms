import 'package:deviraj_lms/app/ui/pages/favourite/favourite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/profile.dart';
import '../../theme/colors.dart';
import '../../theme/font_size.dart';
import '../profile/subscribed_bar.dart';

PreferredSizeWidget commonAppBar({
  centerTitle = true,
  title,
  isBackIcon = false,
  isCartIcon = false,
  isSubscribeIcon = false,
  isLogo = true,
}) {
  return AppBar(
    backgroundColor: AppColors.white,
    elevation: 0,
    centerTitle: centerTitle,
    automaticallyImplyLeading: false,
    iconTheme: const IconThemeData(color: AppColors.black),
    title: GestureDetector(
      onTap: isBackIcon == true
          ? () {
              Get.back();
            }
          : null,
      child: Align(
        alignment: Alignment.topLeft,
        child: Wrap(
          children: [
            isBackIcon == true
                ? const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 18,
                  )
                : const SizedBox(),
            isBackIcon == true
                ? const SizedBox(
                    width: 5,
                  )
                : const SizedBox(),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
              softWrap: false,
              style: headText(
                fontSize: title.length <= 30 ? 20 : 15,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    ),
    actions: [
      isSubscribeIcon == true
          ? SubscriptionStatusBar(
              name: ProfileController.to.subscriptionDetail.packageName == null
                  ? ""
                  : "${ProfileController.to.subscriptionDetail.packageName}",
              status: ProfileController.to.isSubscribed,
            )
          : const SizedBox(),
      isCartIcon == true
          ? Row(
              children: [
                Stack(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.to(() => const Favourite());
                        },
                        icon: const Icon(Icons.favorite_border)),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        alignment: Alignment.center,
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                            color: AppColors.red, shape: BoxShape.circle),
                        child: const Text(
                          "1",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_cart_outlined)),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        alignment: Alignment.center,
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                            color: AppColors.red, shape: BoxShape.circle),
                        child: const Text(
                          "2",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          : const SizedBox()
    ],
  );
}
