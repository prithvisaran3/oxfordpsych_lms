import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class SimpleLoading extends StatelessWidget {
  const SimpleLoading({Key? key, this.color = AppColors.primary})
      : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 30,
      width: 30,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 4,
      ),
    ));
  }
}
