import 'package:deviraj_lms/app/ui/pages/subscribe_now.dart';
import 'package:deviraj_lms/app/ui/theme/colors.dart';
import 'package:deviraj_lms/app/ui/widgets/common/common_snackbar.dart';
import 'package:deviraj_lms/app/ui/widgets/common/text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../payment/purchase_api.dart';

class SubscriptionController extends GetxController {
  static SubscriptionController get to => Get.put(SubscriptionController());

  var _isClickDuration = 2.obs;

  get isClickDuration => _isClickDuration.value;

  set isClickDuration(value) {
    _isClickDuration.value = value;
  }

  var _isClickCourse = 0.obs;

  get isClickCourse => _isClickCourse.value;

  set isClickCourse(value) {
    _isClickCourse.value = value;
  }

  Future fetchoffers() async {
    final offerings = await PurchaseApi.fetchOffers();
    if (offerings.isEmpty) {
      commonSnackBar(title: "No Plans Found", msg: "No Plans Found");
    } else {
      final packages = offerings
          .map((offer) => offer.availablePackages)
          .expand((pair) => pair)
          .toList();

      return SubscribeNow(packages: packages,

      );
    }
  }
}
