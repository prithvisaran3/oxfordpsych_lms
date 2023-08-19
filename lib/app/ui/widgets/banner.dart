import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ImageBanner extends StatelessWidget {
  const ImageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
              image: AssetImage('assets/images/home.jpg'), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'A Real-World',
            style: TextStyle(
                fontFamily: 'semi-bold',
                fontSize: 22,
                color: AppColors.white,
                height: 1.2),
          ),
          const Text(
            'Experience!!!',
            style: TextStyle(
                fontFamily: 'semi-bold',
                fontSize: 22,
                color: AppColors.white,
                height: 1.2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: AppColors.secondary, width: 2))),
                child: const Text(
                  'Explore',
                  style: TextStyle(fontSize: 22, color: AppColors.secondary),
                ),
              ),
              const Icon(
                Icons.arrow_right_alt_outlined,
                color: AppColors.secondary,
              )
            ],
          )
        ],
      ),
    );
  }
}
