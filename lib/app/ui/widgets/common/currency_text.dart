import 'package:deviraj_lms/app/ui/utility.dart';
import 'package:flutter/material.dart';

class CurrencyText extends StatelessWidget {
  const CurrencyText(
      {super.key,
      required this.amount,
      required this.fontSize,
      required this.fontWEIGHT,
      required this.color,
      this.isStrikeThrough = false,
      this.alignment, this.currencyType});

  final String amount;
  final double fontSize;
  final FontWeight fontWEIGHT;
  final Color color;
  final bool? isStrikeThrough;
  final String? alignment;
  final String? currencyType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment == 'center'
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
      currencyType=='rupee'?Text('\u20B9'):  Icon(
          Utility.currency_pound,
          color: color,
          size: fontSize,
        ),
        Text(
          amount,

          style: TextStyle(
              decoration:
                  isStrikeThrough == true ? TextDecoration.lineThrough : null,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWEIGHT),
        )
      ],
    );
  }
}
