import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../common/currency_text.dart';

class SelectedCoursesList extends StatelessWidget {
  const SelectedCoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Risk Analysis and STD Risks',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
          ),
        ),
        Spacer(),
        CurrencyText(
          amount: "50",
          fontSize: 16,
          fontWEIGHT: FontWeight.bold,
          color: AppColors.secondary,
        ),
        SizedBox(width: 10),
      ],
    );
    ;
  }
}
