import 'package:flutter/material.dart';

import '../../../controller/profile.dart';
import '../../theme/colors.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.center,
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
          )
        ],
      ),
      child: Text(
        textAlign: TextAlign.center,

        // "${ProfileController.to.profileDetails.name.toString().split(" ").first[0]}${ProfileController.to.profileDetails.name.toString().split(" ").last[0]} ",
        ProfileController.to.profileDetails.name.toString().split(" ").first[0],
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
