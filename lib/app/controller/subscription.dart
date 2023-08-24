import 'package:get/get.dart';

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
}
