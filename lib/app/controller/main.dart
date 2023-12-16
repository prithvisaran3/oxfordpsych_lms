import 'package:get/get.dart';

int statusCode = 0;

class MainController extends GetxController {
  static MainController get to => Get.put(MainController());

  final _currentIndex = 0.obs;

  get currentIndex => _currentIndex.value;

  set currentIndex(value) {
    _currentIndex.value = value;
  }

  final _isFavourite = false.obs;

  get isFavourite => _isFavourite.value;

  set isFavourite(value) {
    _isFavourite.value = value;
  }

  final _isTripFinish = false.obs;

  get isTripFinish => _isTripFinish.value;

  set isTripFinish(value) {
    _isTripFinish.value = value;
  }

  final _tabLength = 3.obs;

  get tabLength => _tabLength.value;

  set tabLength(value) {
    _tabLength.value = value;
  }

  final _waitingTime = "".obs;

  get waitingTime => _waitingTime.value;

  set waitingTime(value) {
    _waitingTime.value = value;
  }
}
