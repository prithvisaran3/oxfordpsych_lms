import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

import '../../theme/colors.dart';

class LogoLoading extends StatelessWidget {
  const LogoLoading({super.key, this.size, this.height, this.width});
  final double? size;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingFlipping.circle(
            borderColor: AppColors.primary,
            borderSize: 1.0,
            size: size ?? 45.0,
            backgroundColor: AppColors.primary,
            // duration: Duration(milliseconds: 1000),
          ),
          Image.asset(
            "assets/images/logo.png",
            height: height ?? 100,
            width: width ?? 100,
            color: AppColors.primary,
          ),
          const SizedBox(width: 10),
          LoadingFlipping.circle(
            borderColor: AppColors.primary,
            borderSize: 1.0,
            size: size ?? 45.0,
            backgroundColor: AppColors.primary,
            // duration: Duration(milliseconds: 1000),
          ),
        ],
      ),
    );
  }
}
