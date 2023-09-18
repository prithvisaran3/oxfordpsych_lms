import 'package:deviraj_lms/app/config/config.dart';
import 'package:deviraj_lms/app/ui/utility.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/font.dart';

class AllCoursesCard extends StatelessWidget {
  const AllCoursesCard(
      {super.key, required this.cardData, required this.onTap});

  final dynamic cardData;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Row(
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: cardData['photos'] != ""
                    ? DecorationImage(
                        image: NetworkImage("${cardData['photos']}"),
                        fit: BoxFit.cover)
                    : DecorationImage(
                        image: NetworkImage('${AppConfig.noImage}'),
                        fit: BoxFit.cover,
                      ),
              ),
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
                      '${cardData['title']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    // Row(
                    //   children: const [
                    //     Icon(
                    //       Icons.person_outline,
                    //       color: Colors.grey,
                    //       size: 20,
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Text('Stephen Moris')
                    //   ],
                    // ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Utility.currency_pound,
                              size: 18,
                              color: Colors.teal,
                            ),
                            Text(
                              '${cardData['price']}',
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontFamily: 'medium',
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        // Container(
                        //   padding: const EdgeInsets.all(3),
                        //   decoration: BoxDecoration(
                        //       color: AppColors.secondary,
                        //       borderRadius: BorderRadius.circular(10)),
                        //   child: const Text(
                        //     'BEST SELLER',
                        //     style: TextStyle(fontSize: 12),
                        //   ),
                        // )
                      ],
                    )
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
