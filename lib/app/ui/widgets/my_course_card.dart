import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../theme/colors.dart';
import '../theme/font.dart';

class MyCourseCard extends StatelessWidget {
  const MyCourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/course.jpg'),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   children: const [
                    //     Text('4.5'),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Icon(
                    //       Icons.star,
                    //       color: Colors.amber,
                    //       size: 20,
                    //     ),
                    //     Icon(
                    //       Icons.star,
                    //       color: Colors.amber,
                    //       size: 20,
                    //     ),
                    //     Icon(
                    //       Icons.star,
                    //       size: 20,
                    //       color: Colors.amber,
                    //     ),
                    //     Icon(
                    //       Icons.star,
                    //       size: 20,
                    //       color: Colors.amber,
                    //     ),
                    //     Icon(
                    //       Icons.star_outline,
                    //       size: 20,
                    //       color: Colors.amber,
                    //     ),
                    //   ],
                    // ),
                    Text(
                      'Coding With Python Interface',
                      style: headText(),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Stephen Moris')
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    LinearPercentIndicator(
                      width: 150.0,
                      barRadius: const Radius.circular(10),
                      lineHeight: 10.0,
                      percent: 0.20,
                      backgroundColor: AppColors.primary.withOpacity(0.3),
                      progressColor: AppColors.primary,
                      padding: const EdgeInsets.all(0),
                    ),
                    const Text("15% Complete"),


                    Text(
                      "Started at : 25.08.2023",
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
