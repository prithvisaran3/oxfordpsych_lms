import 'package:deviraj_lms/app/controller/auth.dart';
import 'package:deviraj_lms/app/controller/profile.dart';
import 'package:deviraj_lms/app/ui/widgets/home/curriculum_box.dart';
import 'package:deviraj_lms/app/ui/widgets/home/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/course.dart';
import '../../../controller/home.dart';
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
    return GetBuilder(
      init: HomeController(),
      initState: (_) {
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
                    ? SizedBox()
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
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Cart()));
                  },
                  icon: const Icon(Icons.shopping_cart_outlined))
            ],
          ),
          body: Padding(
              padding: const EdgeInsets.all(16),
              child: Obx(
                () => HomeController.to.getCurriculumLoading == true
                    ? Center(
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
                              // GestureDetector(
                              //   onTap: () {
                              //     Get.to(() => Categories());
                              //   },
                              //   child: Row(
                              //     children: const [
                              //       Text(
                              //         'SEE ALL',
                              //         style: TextStyle(color: AppColors.secondary),
                              //       ),
                              //       Icon(
                              //         Icons.arrow_right_alt,
                              //         color: AppColors.secondary,
                              //         size: 20,
                              //       )
                              //     ],
                              //   ),
                              // )
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
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, int index) {
                                  return CurriculumBox(
                                      text:
                                          "${HomeController.to.curriculumDetails[index]['name']}");
                                }),
                          ),
                          // SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          //   physics: const BouncingScrollPhysics(),
                          //   child: Row(
                          //     children: [
                          //       categoryContainer('Mind Healing'),
                          //       categoryContainer('PTSD'),
                          //       categoryContainer('Panic Attacks'),
                          // categoryContainer('Personal Issues'),
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CurriculumBox(text: 'Beginner'),
                                CurriculumBox(text: 'Intermediate'),
                                CurriculumBox(text: 'Expert'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          curriculumColumn(context,
                              name:
                                  '${HomeController.to.curriculumDetails[0]['name']}',
                              curriculum: "CASC Courses"),
                          curriculumColumn(context,
                              name:
                                  '${HomeController.to.curriculumDetails[1]['name']}',
                              curriculum: "Mock CASEC Exams"),
                          curriculumColumn(context,
                              name:
                                  '${HomeController.to.curriculumDetails[2]['name']}',
                              curriculum: "Online CASC Courses"),
                          curriculumColumn(context,
                              name:
                                  '${HomeController.to.curriculumDetails[3]['name']}',
                              curriculum: "Oxfordpsych Overseas"),
                        ],
                      ),
              )),
        );
      },
    );
  }

  curriculumColumn(BuildContext context,
      {required String name, required String curriculum}) {
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: headText(),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllCourses(
                                data: CourseController.to.courseDetails,
                                curriculum: curriculum,
                              )));
                },
                child: Row(
                  children: const [
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
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: Get.height * 0.28,
            width: Get.width,
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
            ),
          ),
        ],
      ),
    );
  }
}
