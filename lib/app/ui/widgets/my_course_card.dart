import 'package:cached_network_image/cached_network_image.dart';
import 'package:deviraj_lms/app/controller/course.dart';
import 'package:deviraj_lms/app/ui/pages/courseDetail.dart';
import 'package:deviraj_lms/app/ui/widgets/common/common_snackbar.dart';
import 'package:deviraj_lms/app/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../config/config.dart';
import '../../controller/profile.dart';
import '../theme/colors.dart';
import '../theme/font_size.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key, this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    print("PROGRESS: ${data['progress']}");

    return GestureDetector(
      onTap: () {
        CourseController.to.isMyCourse = true;
        ProfileController.to.isSubscribed == true
            ? Get.to(
                () => CourseDetail(
                  data: data,
                  duration: CourseController.to.isMyCourse == true
                      ? int.parse(data['progress'])
                      : 0,
                ),
              )
            : commonSnackBar(
                title: "You don't have access to this content",
                msg: "Visit our website for detailed info");
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 20.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: data['photos'] == ""
                  ? Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          color: Colors.black,
                          width: double.infinity,
                          height: double.infinity,
                          padding: const EdgeInsets.all(12),
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
                              "${AppConfig.imageUrl}${data['curriculum_id']}/${data['photos']}",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => const Center(
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
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      "assets/images/logo.png",
                                      fit: BoxFit.contain,
                                      width: double.infinity,
                                    )),
                              ),
                            );
                          }),
                    ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${data['title']}",
                      style: headText(),
                    ),
                    // const Row(
                    //   children: [
                    //     Icon(
                    //       Icons.person_outline,
                    //       color: Colors.grey,
                    //       size: 20,
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Text('Oxford Pysch')
                    //   ],
                    // ),
                    const SizedBox(
                      height: 5,
                    ),
                    // LinearPercentIndicator(
                    //   width: 150.0,
                    //   barRadius: const Radius.circular(10),
                    //   lineHeight: 10.0,
                    //   percent: int.parse(data['views_count']) / 100,
                    //   backgroundColor: AppColors.primary.withOpacity(0.3),
                    //   progressColor: AppColors.primary,
                    //   padding: const EdgeInsets.all(0),
                    // ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    // Text("${int.parse(data['views_count']) / 100}% Complete"),
                    Text(
                      "Last Viewed : ${getIsoToLocalDate(date: data['view_date'])}, ${getIsoToLocalTime(date: data['view_date'])}",
                      style: TextStyle(
                        color: AppColors.black.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
