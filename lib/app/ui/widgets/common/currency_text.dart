import 'package:deviraj_lms/app/ui/theme/colors.dart';
import 'package:deviraj_lms/app/ui/utility.dart';
import 'package:flutter/material.dart';

class CurrencyText extends StatelessWidget {
  const CurrencyText({super.key,
    required this.amount,
    required this.fontSize,
    required this.fontWEIGHT, required this.color, this.isStrikeThrough = false});

  final String amount;
  final double fontSize;
  final FontWeight fontWEIGHT;
  final Color color;
  final bool? isStrikeThrough;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Utility.currency_pound,
          color: color,
          size: fontSize,
        ),
        Text(
          amount,
          style: TextStyle(
              decoration: isStrikeThrough == true ? TextDecoration.lineThrough:null,
              color: color, fontSize: fontSize, fontWeight: fontWEIGHT),
        )
      ],
    );
  }
}
