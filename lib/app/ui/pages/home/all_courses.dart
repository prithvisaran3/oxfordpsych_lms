import 'package:deviraj_lms/app/ui/theme/font_size.dart';
import 'package:deviraj_lms/app/ui/widgets/common/common_print.dart';
import 'package:deviraj_lms/app/ui/widgets/common/logo_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../controller/course.dart';
import '../../../controller/profile.dart';
import '../../theme/colors.dart';
import '../../widgets/all_courses_card.dart';
import '../../widgets/common/appbar.dart';
import '../../widgets/common/cart_empty.dart';
import '../../widgets/common/common_search.dart';
import '../../widgets/common/common_snackbar.dart';
import '../courseDetail.dart';

class AllCourses extends StatelessWidget {
  const AllCourses(
      {Key? key,
      required this.data,
      required this.curriculum,
      this.isSeeAll = false,
      this.isSearch = false,
      this.isCategory = false})
      : super(key: key);
  final dynamic data;
  final String curriculum;
  final bool isSeeAll;
  final bool isSearch;
  final bool isCategory;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CourseController(),
        initState: (_) {
          print("INDEX ID: ${data}");
          CourseController.to.pageNumber = 0;
          CourseController.to.pagingController.addPageRequestListener(
            (pageKey) {
              CourseController.to.getCourse(
                  isInitial: false,
                  curriculumId: isCategory == true ? "${data["id"]}" : "",
                  pageKey: pageKey,
                  isSeeAll: true);
            },
          );

          //
          // else {
          //   CourseController.to.pageNumber = 0;
          //   CourseController.to.pagingController
          //       .addPageRequestListener((pageKey)  {
          //      CourseController.to
          //         .getCourse(isInitial: false, pageKey: pageKey);
          //   });
          // }
        },
        builder: (_) {
          return Obx(
            () => CourseController.to.courseLoading == true
                ? const LogoLoading()
                : Scaffold(
                    backgroundColor: Colors.white,
                    appBar: commonAppBar(
                        title: isSeeAll == true
                            ? "Courses"
                            : isSearch == true
                                ? "All Courses"
                                : curriculum,
                        isBackIcon: true,
                        isLogo: false),
                    body: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CommonSearch(
                            enabled: true,
                            controller: CourseController.to.searchController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: Obx(() => CourseController
                                  .to.searchCourseDetails.isNotEmpty
                              ? ListView.builder(
                                  itemCount: CourseController
                                      .to.searchCourseDetails.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration: const Duration(
                                        milliseconds: 1000,
                                      ),
                                      child: SlideAnimation(
                                        verticalOffset: 50,
                                        child: FadeInAnimation(
                                          duration: const Duration(seconds: 2),
                                          child: AllCoursesCard(
                                            cardData: CourseController
                                                .to.searchCourseDetails[index],
                                            onTap: () {
                                              ProfileController
                                                          .to.isSubscribed ==
                                                      true
                                                  ? Get.to(
                                                      () => CourseDetail(
                                                        data: CourseController
                                                                .to
                                                                .searchCourseDetails[
                                                            index],
                                                        duration: 0,
                                                      ),
                                                    )
                                                  : commonSnackBar(
                                                      title:
                                                          "You don't have access",
                                                      msg:
                                                          "Visit our website for detailed info");
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : CourseController.to.searchNotFound == true
                                  ? const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 50),
                                      child: Empty(
                                        text: 'Not Found',
                                      ),
                                    )
                                  : PagedListView<int, dynamic>.separated(
                                      physics: const BouncingScrollPhysics(),
                                      pagingController:
                                          CourseController.to.pagingController,
                                      builderDelegate:
                                          PagedChildBuilderDelegate<dynamic>(
                                        animateTransitions: false,
                                        newPageProgressIndicatorBuilder:
                                            (context) {
                                          return const SizedBox();
                                        },
                                        firstPageProgressIndicatorBuilder:
                                            (context) {
                                          return const SizedBox();
                                        },
                                        newPageErrorIndicatorBuilder:
                                            (context) {
                                          return Center(
                                              child: Text(
                                            "No more data!",
                                            style: mediumText(
                                                color: AppColors.primary),
                                          ));
                                        },
                                        itemBuilder: (context, item, index) {
                                          commonPrint(
                                              status: "items ", msg: "$item");
                                          return AnimationConfiguration
                                              .staggeredList(
                                            position: index,
                                            duration:
                                                const Duration(seconds: 1),
                                            child: SlideAnimation(
                                              verticalOffset: 50,
                                              child: FadeInAnimation(
                                                child: AllCoursesCard(
                                                  cardData: item,
                                                  onTap: () {
                                                    commonPrint(
                                                        status: "print check ",
                                                        msg:
                                                            "${item['curriculum_id']}");
                                                    ProfileController.to
                                                                .isSubscribed ==
                                                            true
                                                        ? Get.to(
                                                            () => CourseDetail(
                                                              data: item,
                                                              duration: 0,
                                                            ),
                                                          )
                                                        : commonSnackBar(
                                                            title:
                                                                "You don't have access",
                                                            msg:
                                                                "Visit our website for detailed info");
                                                  },
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(),
                                    )),
                        ),
                      ],
                    )),
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
