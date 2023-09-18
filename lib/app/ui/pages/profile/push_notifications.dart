import 'package:deviraj_lms/app/controller/profile.dart';
import 'package:deviraj_lms/app/ui/pages/profile/profile.dart';
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
            SizedBox(height: 40),
            allNotificationsSection(),
            SizedBox(height: 10),
            subscriptionNotificationSection(),
            SizedBox(height: 10),
            emailNotificationSection(),
            SizedBox(height: 10),
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
        SizedBox(width: 20),
        Text(
          "Email Notifications",
          style: TextStyle(color: AppColors.black, fontSize: 16),
        ),
        Spacer(),
        PushNotificationToggle(
          controller: ProfileController.to.isEmailNotification,
          onTap: () {
            if (ProfileController.to.isPushNotification != false) {
              ProfileController.to.isEmailNotification =
                  !ProfileController.to.isEmailNotification;
            }
          },
        ),
        SizedBox(width: 10),
      ],
    );
  }

  Row specialOffersSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20),
        Text(
          "Special Offers",
          style: TextStyle(color: AppColors.black, fontSize: 16),
        ),
        Spacer(),
        PushNotificationToggle(
          controller: ProfileController.to.isSpecialOffersNotification,
          onTap: () {
            if (ProfileController.to.isPushNotification != false) {
              ProfileController.to.isSpecialOffersNotification =
                  !ProfileController.to.isSpecialOffersNotification;
            }
          },
        ),
        SizedBox(width: 10),
      ],
    );
  }

  Row subscriptionNotificationSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20),
        Text(
          "Subscription Notifications",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
          ),
        ),
        Spacer(),
        PushNotificationToggle(
          controller: ProfileController.to.isSubscriptionNotification,
          onTap: () {
            if (ProfileController.to.isPushNotification != false) {
              ProfileController.to.isSubscriptionNotification =
                  !ProfileController.to.isSubscriptionNotification;
            }
          },
        ),
        SizedBox(width: 10),
      ],
    );
  }

  Row allNotificationsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20),
        Text(
          "All Notifications",
          style: TextStyle(color: AppColors.black, fontSize: 16),
        ),
        Spacer(),
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
        SizedBox(width: 10),
      ],
    );
  }
}
