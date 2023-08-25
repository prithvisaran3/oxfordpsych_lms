import 'package:deviraj_lms/app/controller/profile.dart';
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
import 'package:ionicons/ionicons.dart';
import '../../controller/main.dart';
import '../theme/colors.dart';
import '../theme/font.dart';
import '../widgets/common/appbar.dart';
import '../widgets/profile/subscribed_bar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    ProfileController.to.profileName.text = "Prithvi Saran";
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: commonAppBar(title: "Profile", isSubscribeIcon: true),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ProfilePicture(),
              ),
              SizedBox(height: 10),
              Text(
                "${ProfileController.to.profileName.text}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                "(3 days left)",
                style: TextStyle(color: AppColors.primary),
              ),
              SubscriptionStatusCard(),
              SizedBox(height: 20),
              profileSection(),
            ],
          ),
        ),
      ),
    );
  }

  Container profileSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      // height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
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
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Account Settings",
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5),
          SettingsOptionsCard(
            text: 'Check Subscription Status',
            onTap: () {
              Get.to(() => SubscribeNow());
            },
          ),
          SettingsOptionsCard(
            text: 'Edit Profile',
            onTap: () {
              Get.to(() => EditProfile());
            },
          ),
          SettingsOptionsCard(
            text: 'Notification Settings',
            onTap: () {
              Get.to(() => NotificationSettings());
            },
          ),
          SettingsOptionsCard(
            text: 'Change Password',
            onTap: () {
              Get.to(() => ChangePassword());
            },
          ),
          SettingsOptionsCard(
            text: 'Close Account',
            onTap: () {},
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Support",
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5),
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
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoutButton(
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
