import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/colors.dart';
import '../../theme/font.dart';

PreferredSizeWidget commonAppBar(
    {centerTitle = true, title, isBackIcon = false, isCartIcon = false}) {
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
      child: Row(
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
            maxLines: 1,
            softWrap: false,
            style: headText(),
          ),
        ],
      ),
    ),
    actions: [
      isCartIcon == true
          ? Stack(
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
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            )
          : const SizedBox()
    ],
  );
}
