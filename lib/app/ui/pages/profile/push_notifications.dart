import 'package:deviraj_lms/app/controller/profile.dart';
import 'package:deviraj_lms/app/ui/theme/colors.dart';
import 'package:deviraj_lms/app/ui/widgets/common/appbar.dart';
import 'package:deviraj_lms/app/ui/widgets/profile/push_notification_toggle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        isBackIcon: true,
        centerTitle: false,
        title: "Push Notifications",
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            allNotificationsSection(),
            const SizedBox(height: 10),
            subscriptionNotificationSection(),
            const SizedBox(height: 10),
            emailNotificationSection(),
            const SizedBox(height: 10),
            specialOffersSection(),
          ],
        ),
      ),
    );
  }

  Row emailNotificationSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 20),
        const Text(
          "Email Notifications",
          style: TextStyle(color: AppColors.black, fontSize: 16),
        ),
        const Spacer(),
        PushNotificationToggle(
          controller: ProfileController.to.isEmailNotification,
          onTap: () {
            if (ProfileController.to.isPushNotification != false) {
              ProfileController.to.isEmailNotification =
                  !ProfileController.to.isEmailNotification;
            }
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Row specialOffersSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 20),
        const Text(
          "Special Offers",
          style: TextStyle(color: AppColors.black, fontSize: 16),
        ),
        const Spacer(),
        PushNotificationToggle(
          controller: ProfileController.to.isSpecialOffersNotification,
          onTap: () {
            if (ProfileController.to.isPushNotification != false) {
              ProfileController.to.isSpecialOffersNotification =
                  !ProfileController.to.isSpecialOffersNotification;
            }
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Row subscriptionNotificationSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 20),
        const Text(
          "Subscription Notifications",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        PushNotificationToggle(
          controller: ProfileController.to.isSubscriptionNotification,
          onTap: () {
            if (ProfileController.to.isPushNotification != false) {
              ProfileController.to.isSubscriptionNotification =
                  !ProfileController.to.isSubscriptionNotification;
            }
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Row allNotificationsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 20),
        const Text(
          "All Notifications",
          style: TextStyle(color: AppColors.black, fontSize: 16),
        ),
        const Spacer(),
        PushNotificationToggle(
          controller: ProfileController.to.isPushNotification,
          onTap: () {
            ProfileController.to.isPushNotification =
                !ProfileController.to.isPushNotification;

            if (ProfileController.to.isPushNotification == false) {
              ProfileController.to.isSubscriptionNotification = false;
              ProfileController.to.isEmailNotification = false;
              ProfileController.to.isSpecialOffersNotification = false;
            }
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
