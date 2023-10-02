import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/config.dart';
import '../theme/colors.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key, required this.onTap, required this.courseData})
      : super(key: key);

  final dynamic courseData;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0.7, 0.7))
                  ]),
              child: Stack(
                children: [
                  courseData['photos'] == ""
                      ? Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              color: Colors.black,
                              width: double.infinity,
                              height: double.infinity,
                              padding: const EdgeInsets.all(4),
                              child: Image.asset(
                                "assets/images/logo.png",
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: CachedNetworkImage(
                              imageUrl:
                                  "${AppConfig.imageUrl}${courseData['curriculum_id']}/${courseData['photos']}",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      const Center(
                                          child: CircularProgressIndicator(
                                        color: Colors.grey,
                                        strokeWidth: 2,
                                      )),
                              errorWidget: (context, url, error) {
                                return Center(
                                  child: Container(
                                    color: Colors.black,
                                    width: double.infinity,
                                    height: double.infinity,
                                    padding: const EdgeInsets.all(4),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          "assets/images/logo.png",
                                          fit: BoxFit.contain,
                                          width: double.infinity,
                                        )),
                                  ),
                                );
                              }),
                        ),
                  // Positioned(
                  //   bottom: 10,
                  //   left: 10,
                  //   child: Container(
                  //     padding: const EdgeInsets.all(4),
                  //     decoration: BoxDecoration(
                  //         color: AppColors.secondary,
                  //         borderRadius: BorderRadius.circular(10)),
                  //     child: const Text(
                  //       'BEST SELLER',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            Text(
              courseData['title'],
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainCourseCard extends StatelessWidget {
  const MainCourseCard(
      {Key? key, required this.onTap,  this.courseData})
      : super(key: key);

  final dynamic courseData;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: Get.width * 0.8,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CASC Courses",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0.7, 0.7))
                  ]),
              child: Stack(
                children: [
                  courseData['photos'] == ""
                      ? Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              color: Colors.black,
                              width: double.infinity,
                              height: double.infinity,
                              padding: const EdgeInsets.all(4),
                              child: Image.asset(
                                "assets/images/logo.png",
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: CachedNetworkImage(
                              imageUrl:
                                  "${AppConfig.imageUrl}${courseData['curriculum_id']}/${courseData['photos']}",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      const Center(
                                          child: CircularProgressIndicator(
                                        color: Colors.grey,
                                        strokeWidth: 2,
                                      )),
                              errorWidget: (context, url, error) {
                                return Center(
                                  child: Container(
                                    color: Colors.black,
                                    width: double.infinity,
                                    height: double.infinity,
                                    padding: const EdgeInsets.all(4),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          "assets/images/logo.png",
                                          fit: BoxFit.contain,
                                          width: double.infinity,
                                        )),
                                  ),
                                );
                              }),
                        ),
                  // Positioned(
                  //   bottom: 10,
                  //   left: 10,
                  //   child: Container(
                  //     padding: const EdgeInsets.all(4),
                  //     decoration: BoxDecoration(
                  //         color: AppColors.secondary,
                  //         borderRadius: BorderRadius.circular(10)),
                  //     child: const Text(
                  //       'BEST SELLER',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
