import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../controller/course.dart';
import '../../controller/profile.dart';
import '../theme/colors.dart';
import '../theme/font_size.dart';
import '../widgets/all_courses_card.dart';
import '../widgets/common/appbar.dart';
import '../widgets/common/common_search.dart';
import '../widgets/common/common_snackbar.dart';
import '../widgets/common/logo_loading.dart';
import 'courseDetail.dart';

class CategoryCourses extends StatelessWidget {
  const CategoryCourses(
      {Key? key,
      required this.data,
      required this.curriculum,
      this.isSeeAll = false,
      this.isSearch = false})
      : super(key: key);
  final dynamic data;
  final String curriculum;
  final bool isSeeAll;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CourseController(),
        initState: (_) {
          // CourseController.to.categoryCoursePageNumber = 0;
          CourseController.to
              .getCategoryCourse(curriculumId: "${data['index_id']}");
        },
        builder: (_) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: commonAppBar(
                  title: curriculum, isBackIcon: true, isLogo: false),
              body: Stack(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: CommonSearch(
                  //     enabled: false,
                  //     controller: CourseController.to.searchController,
                  //   ),
                  // ),
                  Obx(() => CourseController.to.courseLoading == true
                      ? const LogoLoading()
                      : Padding(
                          padding:
                              const EdgeInsets.only(top: 0.0, bottom: 40.0),
                          child: ListView.builder(
                            itemCount: CourseController
                                .to.categoryCourseDetails.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(
                                  seconds: 2,
                                ),
                                child: SlideAnimation(
                                  verticalOffset: 50,
                                  child: FadeInAnimation(
                                    duration: const Duration(seconds: 2),
                                    child: AllCoursesCard(
                                      cardData: CourseController
                                          .to.categoryCourseDetails[index],
                                      onTap: () {
                                        ProfileController.to.isSubscribed ==
                                                true
                                            ? Get.to(
                                                () => CourseDetail(
                                                  data: CourseController.to
                                                          .categoryCourseDetails[
                                                      index],
                                                  duration: 0,
                                                ),
                                              )
                                            : commonSnackBar(
                                                title: "You don't have access",
                                                msg:
                                                    "Visit our website for detailed info");
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (CourseController.to.categoryCoursePageNumber >
                                  1) {
                                CourseController.to.categoryCoursePageNumber =
                                    --CourseController
                                        .to.categoryCoursePageNumber;
                                CourseController.to.getCategoryCourse(
                                    curriculumId: "${data['index_id']}");
                              } else {
                                print("no back");
                                commonSnackBar(
                                    title: "Can't", msg: "No previous page");
                              }
                            },
                            child: const Icon(
                              Icons.arrow_left_outlined,
                              size: 40,
                              color: AppColors.primary,
                            ),
                          ),
                          Obx(
                            () => Text(
                              "${CourseController.to.categoryCoursePageNumber}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              softWrap: false,
                              style: boldText(fontSize: 20),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (CourseController
                                      .to.isLastPageForCategoryCourse ==
                                  false) {
                                CourseController.to.categoryCoursePageNumber =
                                    ++CourseController
                                        .to.categoryCoursePageNumber;
                                CourseController.to.getCategoryCourse(
                                    curriculumId: "${data['index_id']}");
                              } else {
                                print("no more");
                                commonSnackBar(
                                    title: "Not found", msg: "No more courses");
                              }
                            },
                            child: const Icon(
                              Icons.arrow_right_outlined,
                              size: 40,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ))
                ],
              ));
        });
  }
}
