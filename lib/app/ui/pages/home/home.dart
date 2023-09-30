import 'package:deviraj_lms/app/controller/auth.dart';
import 'package:deviraj_lms/app/controller/profile.dart';
import 'package:deviraj_lms/app/ui/widgets/home/curriculum_box.dart';
import 'package:deviraj_lms/app/ui/widgets/home/search_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/course.dart';
import '../../../controller/home.dart';
import '../../widgets/home/categories_main_card.dart';
import 'all_courses.dart';
import '../../theme/colors.dart';
import '../../theme/font.dart';
import '../../widgets/banner.dart';
import '../../widgets/course_card.dart';
import '../cart.dart';

import '../courseDetail.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HomeController.to.getTopic(cid: "2");
    return GetBuilder(
      init: HomeController(),
      initState: (_) async {
        if (HomeController.to.isFirstLoading == true) {
          // ProfileController.to.getProfile();

          HomeController.to.getCurriculum();
          // HomeController.to.getTopic();
          CourseController.to.getCourse();
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
              child: Obx(
                () => HomeController.to.getCurriculumLoading == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          const HomeSearchBar(),

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
                          SizedBox(
                            height: Get.height * 0.05,
                            child: ListView.builder(
                                itemCount:
                                    HomeController.to.curriculumDetails.length,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => AllCourses(
                                                    data: CourseController
                                                        .to.courseDetails,
                                                    curriculum: HomeController
                                                            .to
                                                            .curriculumDetails[
                                                        index]["name"],
                                                  )));
                                    },
                                    child: CurriculumBox(
                                        text:
                                            "${HomeController.to.curriculumDetails[index]['name']}"),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          /// categories card
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  HomeController.to.curriculumDetails.length,
                              // itemCount: 1,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var curriculumIndex = index;
                                return Column(
                                  children: [
                                    // category title
                                    categoryTitle(index),

                                    //sub categories list
                                    subCategoryList(
                                        curriculum: index == 0
                                            ? "Assessment"
                                            : index == 1
                                                ? "CASC Courses"
                                                : index == 2
                                                    ? "Discussion"
                                                    : index == 3
                                                        ? "Explanation"
                                                        : "Mock CASC Exams"),
                                  ],
                                );
                              }),

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
              )),
        );
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
            CourseController.to.addParticularCategoryCourse();
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
