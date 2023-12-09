import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../controller/home.dart';
import '../../pages/category_courses.dart';
import '../../pages/home/all_courses.dart';
import '../../theme/colors.dart';
import 'curriculum_box.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.black,

        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [
        //     AppColors.primary,
        //     AppColors.primary,
        //   ],
        // ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Category',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: Get.height * 0.05,
            child: ListView.builder(
                itemCount: HomeController.to.curriculumDetails.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 1000),
                    child: SlideAnimation(
                      horizontalOffset: 50,
                      child: FadeInAnimation(
                        child: CurriculumBox(
                          text:
                              "${HomeController.to.curriculumDetails[index]['name']}",
                          onTap: () {
                            Get.to(() => CategoryCourses(
                                  data: HomeController
                                      .to.curriculumDetails[index],
                                  curriculum: HomeController
                                      .to.curriculumDetails[index]["name"],
                                ));
                          },
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
