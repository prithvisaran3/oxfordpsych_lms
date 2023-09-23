import 'package:deviraj_lms/app/config/config.dart';
import 'package:deviraj_lms/app/ui/theme/font_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/course.dart';
import '../pages/courseDetail.dart';
import '../theme/colors.dart';
import '../theme/font.dart';
import '../utility.dart';
import 'common/currency_text.dart';

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
            // color: AppColors.black,
            ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 200,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: courseData['photos'] == ""
                      ? DecorationImage(
                          image: AssetImage('assets/images/home.jpg'),
                          fit: BoxFit.cover)
                      : DecorationImage(
                          image: NetworkImage(
                              '${AppConfig.imageUrl}${courseData['curriculum_id']}/${courseData['photos']}'),
                          fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text('BEST SELLER'),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   children: [
            //     const Text('4.5'),
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     const Icon(
            //       Icons.star,
            //       color: AppColors.amber,
            //       size: 20,
            //     ),
            //     const Icon(
            //       Icons.star,
            //       color: AppColors.amber,
            //       size: 20,
            //     ),
            //     const Icon(
            //       Icons.star,
            //       size: 20,
            //       color: AppColors.amber,
            //     ),
            //     const Icon(
            //       Icons.star,
            //       size: 20,
            //       color: AppColors.amber,
            //     ),
            //     const Icon(
            //       Icons.star_outline,
            //       size: 20,
            //       color: AppColors.amber,
            //     ),
            //   ],
            // ),
            Text(
              courseData['title'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
            ),
            // Row(
            //   children: [
            //     const Icon(
            //       Icons.person_outline,
            //       color: AppColors.grey,
            //       size: 20,
            //     ),
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     const Text('Stephen Moris')
            //   ],
            // ),
            // const SizedBox(
            //   height: 5,
            // ),
            // CurrencyText(
            //   amount: '14.50',
            //   fontSize: 18,
            //   fontWEIGHT: FontWeight.bold,
            //   color: AppColors.secondary,
            // ),
          ],
        ),
      ),
    );
  }
}
