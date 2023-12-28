import 'package:deviraj_lms/app/controller/auth.dart';
import 'package:deviraj_lms/app/controller/profile.dart';
import 'package:deviraj_lms/app/ui/pages/profile/edit_profile.dart';
import 'package:deviraj_lms/app/ui/widgets/profile/logout_button.dart';
import 'package:deviraj_lms/app/ui/widgets/profile/picture_container_widget.dart';
import 'package:deviraj_lms/app/ui/widgets/profile/settings_options_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../utility/utility.dart';
import '../../theme/colors.dart';

import '../../widgets/common/appbar.dart';
import '../auth/validate_email.dart';
import 'change_password.dart';
import 'delete_account.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProfileController(),
        initState: (_) {
          // ProfileController.to.getSubscriptionDetail();
          // ProfileController.to.checkExpiry();
          // SubscriptionController.to.init();
        },
        builder: (_) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: commonAppBar(title: "Profile", isSubscribeIcon: true),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Obx(
                () => Stack(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Positioned(
                      bottom: Get.height * 0.55,
                      left: Get.width * 0.35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                          Text(
                            ProfileController.to.isSubscribed == true
                                ? "(${ProfileController.to.remainingDays.toString().split('-')[1]} days left)"
                                : "Inactive Member",
                            style: const TextStyle(color: AppColors.primary),
                          ),
                          // const SubscriptionStatusCard(),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                    Positioned(
                        top: Get.height * 0.35,
                        bottom: 0,
                        child: profileSection()),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget profileSection() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        // height: Get.height,
        width: Get.width * 0.95,
        // height: Get.height * 0.6,

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
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(seconds: 1),
              child: SlideAnimation(
                verticalOffset: 50,
                child: FadeInAnimation(
                  duration: const Duration(seconds: 1),
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
                      // SettingsOptionsCard(
                      //   text: 'Check Subscription Status',
                      //   onTap: () {
                      //     SubscriptionController.to.fetchoffers();
                      //
                      //     Get.to(() => PaywallWidget(
                      //         title: "Upgrade your plan",
                      //         description: 'Upgrade to enjoy benefits',
                      //         packages: SubscriptionController.to.packageDetails,
                      //         onClickedPackage: (package) async {
                      //           await PurchaseApi.purchasePackage(package);
                      //         }));
                      //     // Get.to(() => const SubscribeNow());
                      //   },
                      // ),
                      SettingsOptionsCard(
                        text: 'Edit Profile',
                        onTap: () {
                          Get.to(() => const EditProfile());
                        },
                      ),
                      SettingsOptionsCard(
                        text: 'Delete Account',
                        onTap: () {
                          Get.to(() => DeleteAccount(
                                email:
                                    "${ProfileController.to.profileDetails.email}",
                              ));
                        },
                      ),

                      SettingsOptionsCard(
                        text: 'Change Password',
                        onTap: () {
                          Get.to(() =>
                              const EmailValidateForForgotPasswordScreen());
                        },
                      ),

                      // SettingsOptionsCard(
                      //   text: 'Notification Settings',
                      //   onTap: () {
                      //     Get.to(() => const NotificationSettings());
                      //   },
                      // ),
                      // SettingsOptionsCard(
                      //   text: 'Change Password',
                      //   onTap: () {
                      //     Get.to(() => const ChangePassword());
                      //   },
                      // ),
                      // SettingsOptionsCard(
                      //   text: 'Close Account',
                      //   onTap: () {},
                      // ),
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
                        onTap: () {
                          openBrowser(
                              url:
                                  "https://www.oxfordpsychcourse.co.uk/aboutus.php");
                        },
                      ),
                      SettingsOptionsCard(
                        text: 'Help & Support',
                        onTap: () {
                          openBrowser(
                              url:
                                  "https://www.oxfordpsychcourse.co.uk/contact.php");
                        },
                      ),
                      SettingsOptionsCard(
                        text: 'Privacy Policy',
                        onTap: () {
                          openBrowser(
                              url:
                                  "https://www.oxfordpsychcourse.co.uk/privacy-policy.php");
                        },
                      ),
                      SettingsOptionsCard(
                        text: 'Terms and Conditions',
                        onTap: () {
                          openBrowser(
                              url:
                                  "https://www.oxfordpsychcourse.co.uk/terms-conditions.php");
                        },
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
