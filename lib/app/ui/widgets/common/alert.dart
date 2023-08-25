import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../theme/colors.dart';
import '../../theme/font_size.dart';

import 'text.dart';

commonAlertDialog(BuildContext context,
    {required String content, required Function() confirmButtonPressed}) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.red),
      child: Center(
        child: CommonText(
          text: "Cancel",
          style: regularText(color: AppColors.white),
        ),
      ),
    ),
    onPressed: () {
      if (kDebugMode) {
        print("print");
      }
      Get.back();
    },
  );
  Widget continueButton = TextButton(
    onPressed: confirmButtonPressed,
    child: Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.green),
      child: Center(
        child: CommonText(
          text: "Confirm",
          style: regularText(color: AppColors.white),
        ),
      ),
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
    ),
    // backgroundColor: Colors.white.withOpacity(0.4),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
          size: 30,
        ),
        SizedBox(
          width: 10,
        ),
        CommonText(
          text: "Alert",
          style: boldText(
            fontSize: 24,
            color: AppColors.black,
          ),
        )
      ],
    ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonText(
          text: content,
          style: regularText(
            fontSize: 16,
            color: AppColors.black,
          ),
        ),
      ],
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


