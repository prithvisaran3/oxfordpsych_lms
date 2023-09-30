import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/colors.dart';

Future<bool> backAlert() async {
  // This dialog will exit your app on saying yes
  return (await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: const Center(
              child: Text(
            'Are you sure?',
            style: TextStyle(
                color: AppColors.primary, fontFamily: 'medium', fontSize: 14),
          )),
          content: const Text('Do you want to exit an App'),
          actions: <Widget>[
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              color: AppColors.grey,
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text(
                'No',
                style: TextStyle(color: AppColors.white, fontFamily: 'medium'),
              ),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              color: AppColors.primary,
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                'Yes',
                style: TextStyle(color: AppColors.white, fontFamily: 'medium'),
              ),
            ),
          ],
        ),
      )) ??
      false;
}
