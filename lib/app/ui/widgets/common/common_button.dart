import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        margin: const EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
          color: AppColors.primary
          // gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          //   colors: [
          //     AppColors.primary,
          //     AppColors.secondary,
          //   ],
          // ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontFamily: 'bold', color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
