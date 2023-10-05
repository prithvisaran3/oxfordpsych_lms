import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../config/config.dart';
import '../../controller/profile.dart';
import '../pages/courseDetail.dart';
import '../theme/colors.dart';
import '../theme/font_size.dart';
import 'common/common_snackbar.dart';
import 'common/currency_text.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    super.key,
    required this.data,
  });

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ProfileController.to.isSubscribed == true
            ? Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CourseDetail(
                          data: data,
                        )))
            : commonSnackBar(
                title: "You don't have access",
                msg: "Visit our website for detailed info");
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "${AppConfig.imageUrl}${data['curriculum_id']}/${data['photos']}" ==
                  ""
              ? Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      color: Colors.black,
                      width: double.infinity,
                      height: 120,
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
                            height: 120,
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
            data['title'] ?? "1",
            style: headText(),
          ),
          const Row(
            children: [
              Icon(
                Icons.person_outline,
                color: AppColors.grey,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text('OxfordPsych')
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     CurrencyText(
          //       amount: data['price'] ?? "0",
          //       fontSize: 18,
          //       fontWEIGHT: FontWeight.w800,
          //       color: AppColors.secondary,
          //     ),
          //     GestureDetector(
          //       onTap: () {},
          //       child: Container(
          //         margin: const EdgeInsets.all(5),
          //         padding: const EdgeInsets.all(5),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(5),
          //             color: AppColors.secondary),
          //         child: Text(
          //           "Buy Now",
          //           style: mediumText(color: AppColors.white, fontSize: 14),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
