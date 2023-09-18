import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        style: TextStyle(color: AppColors.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          border: InputBorder.none,
          hintText: 'Search here',
          prefixIcon: Icon(Icons.search, color: AppColors.black),
          hintStyle: TextStyle(color: AppColors.grey),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: AppColors.grey,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: AppColors.grey,
              )),
          fillColor: AppColors.white,
        ),
      ),
    );
  }
}
