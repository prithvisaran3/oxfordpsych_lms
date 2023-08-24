import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.put(ProfileController());

  final TextEditingController profileName = TextEditingController();

  var _isPushNotification = true.obs;

  get isPushNotification => _isPushNotification.value;

  set isPushNotification(value) {
    _isPushNotification.value = value;
  }
  var _isSubscriptionNotification = true.obs;

  get isSubscriptionNotification => _isSubscriptionNotification.value;

  set isSubscriptionNotification(value) {
    _isSubscriptionNotification.value = value;
  }
  var _isSpecialOffersNotification = true.obs;

  get isSpecialOffersNotification => _isSpecialOffersNotification.value;

  set isSpecialOffersNotification(value) {
    _isSpecialOffersNotification.value = value;
  }
  var _isEmailNotification = true.obs;

  get isEmailNotification => _isEmailNotification.value;

  set isEmailNotification(value) {
    _isEmailNotification.value = value;
  }

}
