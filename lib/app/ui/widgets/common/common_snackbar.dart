import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../theme/colors.dart';

commonSnackBar({required title, required msg}) {
  Get.snackbar(
    title,
    msg,
    snackPosition: SnackPosition.BOTTOM,
    colorText: AppColors.black,
    overlayBlur: .5,
    isDismissible: true,
    dismissDirection: DismissDirection.down,
  );
}

alertSnackBar({required msg}) {
  Get.snackbar("Alert", "$msg",
      backgroundColor: AppColors.red,
      snackStyle: SnackStyle.FLOATING,
      colorText: AppColors.white);
}

nothingSnackBar({required msg}) {
  Get.snackbar("Alert", "$msg", snackPosition: SnackPosition.BOTTOM);
}

successSnackBar({required msg}) {
  Get.snackbar("Alert", "$msg", snackPosition: SnackPosition.TOP);
}
