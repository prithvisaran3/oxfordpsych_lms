import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/main.dart';
import '../../theme/colors.dart';

class SubscriptionStatusCard extends StatelessWidget {
  const SubscriptionStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primary,
                AppColors.secondary,
              ],
            ),
            boxShadow: [
              BoxShadow(color: AppColors.grey, spreadRadius: 1, blurRadius: 1)
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  MainController.to.isSubscribed == false
                      ? Text(
                          "Subscription Status  ",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Subscription Status ",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Expiry Date ",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Plan ",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                  Spacer(),
                  MainController.to.isSubscribed == false
                      ? Text(
                          "Not Subscribed",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Subscribed",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              "26th August,2023",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              "Gold",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.amber,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
              MainController.to.isSubscribed == false
                  ? Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Click Here To Subscribe".toUpperCase(),
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ));
  }
}
