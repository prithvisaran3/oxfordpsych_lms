import 'package:deviraj_lms/app/controller/course.dart';
import 'package:deviraj_lms/app/ui/widgets/common/cart_empty.dart';
import 'package:deviraj_lms/app/ui/widgets/common/logo_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../theme/colors.dart';
import '../../widgets/common/appbar.dart';
import '../../widgets/my_course_card.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CourseController(),
        initState: (_) {
          CourseController.to.getMyCourses();
        },
        builder: (_) {
          return Obx(
            () => CourseController.to.courseLoading == true
                ? const LogoLoading()
                : Scaffold(
                    backgroundColor: Colors.white,
                    appBar: commonAppBar(title: "My Courses"),
                    body: Stack(
                      children: [
                        // searchbar(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Obx(
                                () => CourseController.to.isMyCourseEmpty ==
                                        true
                                    ? const CartEmpty(
                                        emptyString: "No Courses",
                                        image: 'cart.png',
                                        isShowButton: false,
                                      )
                                    : ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: CourseController
                                            .to.myCourseDetails.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return AnimationConfiguration
                                              .staggeredList(
                                            position: index,
                                            duration: const Duration(
                                                milliseconds: 1000),
                                            child: SlideAnimation(
                                              verticalOffset: 100.0,
                                              child: FadeInAnimation(
                                                child: ProgressCard(
                                                  data: CourseController.to
                                                      .myCourseDetails[index],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }

  searchbar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
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
      ),
    );
  }
}
