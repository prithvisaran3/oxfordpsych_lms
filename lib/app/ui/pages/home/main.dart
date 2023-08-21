import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/main.dart';
import '../../theme/colors.dart';
import '../favourtie.dart';
import '../myCourse.dart';
import '../profile.dart';
import 'home.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: MainController.to.tabLength,
      animationDuration: const Duration(seconds: 1),
      child: Scaffold(
        backgroundColor: AppColors.white,
        bottomNavigationBar: (TabBar(
          labelColor: AppColors.primary,
          indicatorColor: Colors.transparent,
          unselectedLabelColor: AppColors.grey,
          labelPadding: const EdgeInsets.symmetric(horizontal: 0),
          labelStyle: const TextStyle(
            fontFamily: 'regular',
            fontSize: 16,
          ),
          onTap: (index) {
            MainController.to.currentIndex = index;
          },
          tabs: [
            buildTab(icon: Icons.home_outlined, index: 0),
            buildTab(icon: Icons.star_outline, index: 1),
            buildTab(icon: Icons.play_circle_outline, index: 2),
            buildTab(icon: Icons.person_outline, index: 3),
          ],
        )),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [Home(), Favourtie(), MyCourse(), Profile()],
        ),
      ),
    );
  }

  Tab buildTab({icon, index}) {
    return Tab(
      icon: Obx(() => Icon(
            icon,
            color: MainController.to.currentIndex == index
                ? Colors.teal
                : AppColors.grey,
          )),
    );
  }
}
