import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../widgets/common/appbar.dart';
import '../../widgets/my_course_card.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(title: "Progress"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              searchbar(),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const ProgressCard();
                  })
            ],
          ),
        ),
      ),
    );
  }

  searchbar() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        style: const TextStyle(color: AppColors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search here',
          prefixIcon: const Icon(Icons.search, color: AppColors.black),
          hintStyle: const TextStyle(color: AppColors.grey),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: AppColors.grey,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: AppColors.grey,
              )),
          fillColor: AppColors.white,
        ),
      ),
    );
  }
}
