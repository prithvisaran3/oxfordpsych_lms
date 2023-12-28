import 'package:cached_network_image/cached_network_image.dart';
import 'package:deviraj_lms/app/controller/wishlist.dart';
import 'package:flutter/material.dart';
import '../../config/config.dart';

class AllCoursesCard extends StatelessWidget {
  const AllCoursesCard(
      {super.key, required this.cardData, required this.onTap});

  final dynamic cardData;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300, blurRadius: 1.0, spreadRadius: 1),
        ],
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: cardData['photos'] == ""
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
                                    "${AppConfig.imageUrl}${cardData['curriculum_id']}/${cardData['photos']}",
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
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${cardData['title']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Row(
                          //       children: [
                          //         const Icon(
                          //           Utility.currency_pound,
                          //           size: 18,
                          //           color: Colors.teal,
                          //         ),
                          //         Text(
                          //           '${cardData['price']}',
                          //           style: const TextStyle(
                          //               color: Colors.teal,
                          //               fontFamily: 'medium',
                          //               fontSize: 18),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //     right: 10,
          //     bottom: 0,
          //     child: GestureDetector(
          //       onTap: () {
          //         WishListController.to
          //             .addWishList(courseId: "${cardData['id']}");
          //       },
          //       child: const Icon(
          //         Icons.favorite_border,
          //         size: 25,
          //       ),
          //     )),
        ],
      ),
    );
  }
}
