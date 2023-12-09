import 'package:flutter/material.dart';
import '../../utility/utility.dart';
import '../theme/colors.dart';

class ImageBanner extends StatelessWidget {
  const ImageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openBrowser(url: "https://www.oxfordpsychcourse.co.uk/");
      },
      child: Container(
          height: 160,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: AppColors.grey,
                blurRadius: 10,
              )
            ],
          ),
          child: Image.asset(
            'assets/images/logo.png',
            color: AppColors.primary,
            height: 40,
            width: 40,
            fit: BoxFit.fill,
          )),
    );
  }
}
