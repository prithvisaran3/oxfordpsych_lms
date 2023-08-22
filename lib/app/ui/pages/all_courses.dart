import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/all_courses_card.dart';
import '../widgets/common/appbar.dart';

class AllCourses extends StatelessWidget {
  const AllCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: commonAppBar(title: "All Courses", isBackIcon: true),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const AllCoursesCard();
                        })
                  ],
                ),
              ),
              searchbar(),
            ],
          ),
        ));
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
