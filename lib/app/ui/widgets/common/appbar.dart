import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/colors.dart';
import '../../theme/font.dart';

PreferredSizeWidget commonAppBar(
    {centerTitle = true, title, isBackIcon = false}) {
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
      IconButton(
          onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
    ],
  );
}
