import 'package:flutter/material.dart';
import '../../theme/colors.dart';

exitAlert(context) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: const Center(
          child: Text(
        'Are you sure?',
        style: TextStyle(fontFamily: 'medium'),
      )),
      content: const Text('Do you want to exit an App'),
      contentTextStyle:
          const TextStyle(fontFamily: 'medium', color: AppColors.grey),
      titleTextStyle: const TextStyle(
          fontFamily: 'medium', color: AppColors.primary, fontSize: 16),
      actions: [
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: AppColors.grey,
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text(
            'No',
            style: TextStyle(color: AppColors.white, fontFamily: 'medium'),
          ),
        ),
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: AppColors.primary,
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text(
            'Yes',
            style: TextStyle(
                color: AppColors.white,
                fontFamily: 'medium',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
