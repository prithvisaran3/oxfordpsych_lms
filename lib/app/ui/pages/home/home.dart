// ignore_for_file: use_build_context_synchronously

import 'package:deviraj_lms/app/ui/widgets/common/common_search.dart';
import 'package:deviraj_lms/app/ui/widgets/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/course.dart';
import '../../../controller/home.dart';
import '../../../controller/profile.dart';
import '../../theme/font_size.dart';
import '../../widgets/home/curriculum_box.dart';
import '../../widgets/home/search_bar.dart';
import 'all_courses.dart';
import '../../theme/colors.dart';
import '../../widgets/banner.dart';
import '../../widgets/course_card.dart';
import '../cart.dart';
import '../courseDetail.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      initState: (_) async {
        if (HomeController.to.isFirstLoading == true) {
          // ProfileController.to.getProfile();
          CourseController.to.getCourse(isInitial: true, curriculumId: "2");
          HomeController.to.getCurriculum();
          CourseController.to.getMyCourses();

          // HomeController.to.getTopic();
          // CourseController.to.getCourse(isInitial: true);
          ProfileController.to.getProfile();
        }
      },
      builder: (_) {
        return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              centerTitle: true,
              iconTheme: const IconThemeData(color: AppColors.black),
              leading: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  color: AppColors.black,
                  height: 40,
                  width: 40,
                  // fit: BoxFit.cover,
                ),
              ),
              leadingWidth: 80,
              title: SizedBox(
                width: 250,
                child: Obx(
                  () => ProfileController.to.getProfileLoading == true
                      ? const SizedBox()
                      : Text(
                          'Hi, ${ProfileController.to.profileDetails.name}',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          softWrap: false,
                          style: headText(),
                        ),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                    },
                    icon: const Icon(Icons.shopping_cart_outlined))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  CommonSearch(
                    enabled: false,
                    controller: CourseController.to.searchController,
                    onTap: () async {
                      CourseController.to.pageNumber = 0;
                      Get.to(() => AllCourses(
                            data: CourseController.to.courseDetails,
                            curriculum: "CASC Courses",
                            isSearch: true,
                          ));
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const ImageBanner(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: headText(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => HomeController.to.getCurriculumLoading == true
                        ? SimpleLoading()
                        : SizedBox(
                            height: Get.height * 0.05,
                            child: ListView.builder(
                                itemCount:
                                    HomeController.to.curriculumDetails.length,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, int index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => AllCourses(
                                                    data: HomeController.to
                                                            .curriculumDetails[
                                                        index],
                                                    curriculum: HomeController
                                                            .to
                                                            .curriculumDetails[
                                                        index]["name"],
                                                    isCategory: true,
                                                  )));
                                    },
                                    child: CurriculumBox(
                                        text:
                                            "${HomeController.to.curriculumDetails[index]['name']}"),
                                  );
                                }),
                          ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'CASC Courses',
                        style: headText(color: AppColors.secondary),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await CourseController.to
                              .getCourse(isInitial: false, curriculumId: "2");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllCourses(
                                        data: CourseController.to.courseDetails,
                                        curriculum: "CASC Courses",
                                        isSeeAll: true,
                                      )));
                        },
                        child: Text(
                          'See All',
                          style: mediumText(
                              color: AppColors.primary, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  Obx(
                    () => CourseController.to.getCourseLoading == true
                        ? SimpleLoading()
                        : CourseController.to.isCourseEmpty == true
                            ? Text("emppty")
                            : SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                // color: Colors.red,
                                child: ListView.builder(
                                    itemCount: CourseController
                                        .to.initialCourseDetails.length,
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return CourseCard(
                                        onTap: () {
                                          Get.to(() => CourseDetail(
                                                data: CourseController.to
                                                        .initialCourseDetails[
                                                    index],
                                              ));
                                        },
                                        courseData: CourseController
                                            .to.initialCourseDetails[index],
                                      );
                                    }),
                              ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Text(
                    'Courses',
                    style: headText(color: AppColors.secondary),
                  ),

                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.30,
                  //   child: ListView.builder(
                  //       itemCount: 4,
                  //       scrollDirection: Axis.horizontal,
                  //       physics: const BouncingScrollPhysics(),
                  //       shrinkWrap: true,
                  //       itemBuilder: (context, index) {
                  //         return MainCourseCard(
                  //           onTap: () {},
                  //           // courseData:
                  //           //     CourseController.to.initialCourseDetails[index],
                  //         );
                  //       }),
                  // )

                  // /// categories card
                  // ListView.builder(
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     itemCount:
                  //         HomeController.to.curriculumDetails.length,
                  //     // itemCount: 1,
                  //     shrinkWrap: true,
                  //     itemBuilder: (context, index) {
                  //       var curriculumIndex = index;
                  //       return Column(
                  //         children: [
                  //           // category title
                  //           categoryTitle(index),
                  //
                  //           //sub categories list
                  //           subCategoryList(
                  //               curriculum: index == 0
                  //                   ? "Assessment"
                  //                   : index == 1
                  //                       ? "CASC Courses"
                  //                       : index == 2
                  //                           ? "Discussion"
                  //                           : index == 3
                  //                               ? "Explanation"
                  //                               : "Mock CASC Exams"),
                  //         ],
                  //       );
                  //     }),

                  // curriculumColumn(context,
                  //     name:
                  //         '${HomeController.to.curriculumDetails[0]['name']}',
                  //     curriculum: "CASC Courses"),
                  // curriculumColumn(context,
                  //     name:
                  //         '${HomeController.to.curriculumDetails[1]['name']}',
                  //     curriculum: "Mock CASEC Exams"),
                  // curriculumColumn(context,
                  //     name:
                  //         '${HomeController.to.curriculumDetails[2]['name']}',
                  //     curriculum: "Online CASC Courses"),
                  // curriculumColumn(context,
                  //     name:
                  //         '${HomeController.to.curriculumDetails[3]['name']}',
                  //     curriculum: "Oxfordpsych Overseas"),
                ],
              ),
            ));
      },
    );
  }

  subCategoryList({curriculumIndex, curriculum}) {
    // HomeController.to.getTopic(cid: "1");

    // String text = "";
    // return SizedBox(
    //   height: text.length > 25 ? Get.height * 0.25 : Get.height * 0.20,
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: HomeController.to.topicDetails.length,
    //     shrinkWrap: true,
    //     itemBuilder: (context, index) {
    //       if (HomeController.to.topicDetails.length != 0) {
    //         text = HomeController.to.topicDetails[index]['name'];
    //         return CategoriesMainCard(
    //           name: "${HomeController.to.topicDetails[index]['name']}",
    //           image: "",
    //           onTap: () {},
    //         );
    //       } else {
    //         return Text("nkjjk");
    //       }
    //     },
    //   ),
    // );

    return SizedBox(
        height: Get.height * 0.28,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: CourseController.to.courseDetails.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CourseController.to.courseDetails[index]["curriculum"] ==
                    curriculum
                ? CourseCard(
                    onTap: () {
                      Get.to(() => CourseDetail(
                            data: CourseController.to.courseDetails[index],
                          ));
                    },
                    courseData: CourseController.to.courseDetails[index],
                  )
                : const SizedBox();
          },
        ));
  }

  categoryTitle(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${HomeController.to.curriculumDetails[index]['name']}",
          // "${HomeController.to.curriculumDetails[1]['name']}",
          style: headText(),
        ),
        InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             AllCourses(
            //               data: CourseController
            //                   .to.courseDetails,
            //               curriculum: curriculum,
            //             )));
          },
          child: const Row(
            children: [
              Text(
                'SEE ALL',
                style: TextStyle(color: AppColors.secondary),
              ),
              Icon(
                Icons.arrow_right_alt,
                color: AppColors.secondary,
                size: 20,
              )
            ],
          ),
        )
      ],
    );
  }

// curriculumColumn(BuildContext context,
//     {required String name, required String curriculum}) {
//   return Obx(
//     () => Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               name,
//               style: headText(),
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => AllCourses(
//                               data: CourseController.to.courseDetails,
//                               curriculum: curriculum,
//                             )));
//               },
//               child: const Row(
//                 children: [
//                   Text(
//                     'SEE ALL',
//                     style: TextStyle(color: AppColors.secondary),
//                   ),
//                   Icon(
//                     Icons.arrow_right_alt,
//                     color: AppColors.secondary,
//                     size: 20,
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         SizedBox(
//           height: Get.height * 0.28,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: CourseController.to.courseDetails.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return CourseController.to.courseDetails[index]["curriculum"] ==
//                       curriculum
//                   ? CourseCard(
//                       onTap: () {
//                         Get.to(() => CourseDetail(
//                               data: CourseController.to.courseDetails[index],
//                             ));
//                       },
//                       courseData: CourseController.to.courseDetails[index],
//                     )
//                   : const SizedBox();
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }
}
