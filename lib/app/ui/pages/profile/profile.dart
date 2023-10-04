import 'package:deviraj_lms/app/controller/auth.dart';
import 'package:deviraj_lms/app/controller/profile.dart';
import 'package:deviraj_lms/app/controller/subscription.dart';
import 'package:deviraj_lms/app/payment/paywall_widget.dart';
import 'package:deviraj_lms/app/payment/purchase_api.dart';
import 'package:deviraj_lms/app/ui/pages/profile/change_password.dart';
import 'package:deviraj_lms/app/ui/pages/profile/edit_profile.dart';
import 'package:deviraj_lms/app/ui/pages/profile/push_notifications.dart';
import 'package:deviraj_lms/app/ui/pages/subscribe_now.dart';
import 'package:deviraj_lms/app/ui/widgets/profile/logout_button.dart';
import 'package:deviraj_lms/app/ui/widgets/profile/picture_container_widget.dart';
import 'package:deviraj_lms/app/ui/widgets/profile/settings_options_card.dart';
import 'package:deviraj_lms/app/ui/widgets/profile/subscription_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors.dart';

import '../../widgets/common/appbar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProfileController(),
        initState: (_) {
          SubscriptionController.to.init();
        },
        builder: (_) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: commonAppBar(title: "Profile", isSubscribeIcon: true),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                      child: ProfilePicture(),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${ProfileController.to.profileDetails.name}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    // const Text(
                    //   "(3 days left)",
                    //   style: TextStyle(color: AppColors.primary),
                    // ),
                    // const SubscriptionStatusCard(),
                    const SizedBox(height: 20),
                    profileSection(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Container profileSection() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      // height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            spreadRadius: 1,
            blurRadius: 1,
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          // bottomRight: Radius.circular(40),
          // bottomLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Account Settings",
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          SettingsOptionsCard(
            text: 'Check Subscription Status',
            onTap: () {
              SubscriptionController.to.fetchoffers();

              Get.to(() => PaywallWidget(
                  title: "Upgrade your plan",
                  description: 'Upgrade to enjoy benefits',
                  packages: SubscriptionController.to.packageDetails,
                  onClickedPackage: (package) async {
                    await PurchaseApi.purchasePackage(package);
                  }));
              // Get.to(() => const SubscribeNow());
            },
          ),
          SettingsOptionsCard(
            text: 'Edit Profile',
            onTap: () {
              Get.to(() => const EditProfile());
            },
          ),
          SettingsOptionsCard(
            text: 'Notification Settings',
            onTap: () {
              Get.to(() => const NotificationSettings());
            },
          ),
          SettingsOptionsCard(
            text: 'Change Password',
            onTap: () {
              Get.to(() => const ChangePassword());
            },
          ),
          SettingsOptionsCard(
            text: 'Close Account',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Support",
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          SettingsOptionsCard(
            text: 'About OxfordPsych',
            onTap: () {},
          ),
          SettingsOptionsCard(
            text: 'Help & Support',
            onTap: () {},
          ),
          SettingsOptionsCard(
            text: 'Privacy Policy',
            onTap: () {},
          ),
          SettingsOptionsCard(
            text: 'Terms and Conditions',
            onTap: () {},
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoutButton(
                onTap: () {
                  AuthController.to.logout();
                },
              ),
            ],
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
