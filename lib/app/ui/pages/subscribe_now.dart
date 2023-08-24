import 'package:deviraj_lms/app/ui/theme/colors.dart';
import 'package:deviraj_lms/app/ui/theme/font.dart';
import 'package:deviraj_lms/app/ui/widgets/common/common_button.dart';
import 'package:deviraj_lms/app/ui/widgets/common/currency_text.dart';
import 'package:deviraj_lms/app/ui/widgets/subscription/ProceedToPay_button.dart';
import 'package:deviraj_lms/app/ui/widgets/subscription/course_list_box.dart';
import 'package:deviraj_lms/app/ui/widgets/subscription/duration_box.dart';
import 'package:deviraj_lms/app/ui/widgets/subscription/selectedcourses_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/subscription.dart';

class SubscribeNow extends StatelessWidget {
  const SubscribeNow({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: ProceedToPayButton(),
              ),
              Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary,
                      AppColors.secondary,
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntroSection(),
                      DurationSection(),
                      CourseListSection(),
                      SelectedCoursesSection(),
                      ProceedToPayButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row IntroSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Subscribe \nNow!",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 45,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Ionicons.close,
            color: AppColors.white,
            size: 30,
          ),
        )
      ],
    );
  }

  Container SelectedCoursesSection() {
    return Container(
      // height: Get.height * 0.20,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey,
              spreadRadius: 1,
              blurRadius: 1,
            )
          ]
          // border: Border.all(
          //   width: 3,
          //   color: AppColors.white,
          // ),
          ),
      child: Column(
        children: [
          Center(
            child: Text(
              'Selected Courses',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
            itemCount: 6,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, int index) {
              return SelectedCoursesList();
            },
          ),
        ],
      ),
    );
  }

  Container CourseListSection() {
    return Container(
      height: Get.height * 0.20,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        border: Border.all(
          width: 3,
          color: AppColors.white,
        ),
      ),
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, int index) {
          return CourseListBox(index: index);
        },
      ),
    );
  }

  Row DurationSection() {
    return Row(
      children: [
        SubscriptionDurationBox(
          duration: '1 month',
          price: '20',
          index: 0,
        ),
        SubscriptionDurationBox(
          duration: '6 months',
          price: '50',
          index: 1,
        ),
        SubscriptionDurationBox(
          duration: '12 months',
          price: '100',
          index: 2,
        ),
      ],
    );
  }
}
