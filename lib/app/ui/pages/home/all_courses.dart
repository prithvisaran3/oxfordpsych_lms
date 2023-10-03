import 'package:deviraj_lms/app/controller/wishlist.dart';
import 'package:deviraj_lms/app/ui/theme/font_size.dart';
import 'package:deviraj_lms/app/ui/widgets/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../controller/course.dart';
import '../../theme/colors.dart';
import '../../widgets/all_courses_card.dart';
import '../../widgets/common/appbar.dart';
import '../../widgets/common/cart_empty.dart';
import '../../widgets/common/common_search.dart';
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
        initState: (_) async {
          if (isCategory == true) {
            CourseController.to.pageNumber = 0;
            CourseController.to.pagingController
                .addPageRequestListener((pageKey) {
              CourseController.to.getCourse(
                  isInitial: false,
                  curriculumId: "${data["index_id"]}",
                  pageKey: pageKey);
            });
          } else {
            CourseController.to.pageNumber = 0;
            CourseController.to.pagingController
                .addPageRequestListener((pageKey) {
              CourseController.to.getCourse(isInitial: false, pageKey: pageKey);
            });
          }
        },
        builder: (_) {
          return Scaffold(
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
                            itemCount:
                                CourseController.to.searchCourseDetails.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              AllCoursesCard(
                                cardData: CourseController
                                    .to.searchCourseDetails[index],
                                onTap: () {
                                  Get.to(
                                    () => CourseDetail(
                                      data: CourseController
                                          .to.searchCourseDetails[index],
                                    ),
                                  );
                                },
                              );
                            },
                          )
                        : CourseController.to.searchNotFound == true
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 50),
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
                                  newPageProgressIndicatorBuilder: (context) {
                                    return const SizedBox();
                                  },
                                  firstPageProgressIndicatorBuilder: (context) {
                                    return const SizedBox();
                                  },
                                  newPageErrorIndicatorBuilder: (context) {
                                    return Center(
                                        child: Text(
                                      "No more data!",
                                      style:
                                          mediumText(color: AppColors.primary),
                                    ));
                                  },
                                  itemBuilder: (context, item, index) {
                                    print("items ${item}");
                                    return AllCoursesCard(
                                      cardData: item,
                                      onTap: () {
                                        Get.to(
                                          () => CourseDetail(
                                            data: item[index],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(),
                              )),
                  ),
                  Obx(() => WishListController.to.addLoading == true
                      ? Container(
                          color: Colors.black26,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SimpleLoading(),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Please wait...",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox()),
                  Obx(() => CourseController.to.getSearchLoading == true
                      ? const SimpleLoading()
                      : const SizedBox())
                ],
              ));
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
