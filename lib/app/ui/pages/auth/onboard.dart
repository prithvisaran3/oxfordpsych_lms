import 'package:deviraj_lms/app/ui/theme/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../controller/auth.dart';

import '../../theme/colors.dart';
import '../../widgets/common/text.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoard> {
  final int numPages = 3;
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(i == currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  void onIntroEnd() {
    AuthController.to.setOnboardData();
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.grey.withOpacity(0.8),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: [
              //     AppColors.primary,
              //     AppColors.primary,
              //   ],
              // ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => onIntroEnd(),
                  child: Container(
                    height: media.width * 0.15,
                    width: media.width * 0.20,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      // color: Color(0xFF7B51D3)
                    ),
                    alignment: Alignment.centerRight,
                    child: const Center(
                      child: CommonText(
                        text: 'Skip',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.72,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        currentPage = page;
                      });
                    },
                    children: [
                      buildSlider(
                          title: "Discover a World of Knowledge",
                          content:
                              "Oxford Psych Courses offers a rich variety of psychology courses to explore, all at your fingertips.",
                          image: "logo",
                          fit: BoxFit.fitWidth),
                      buildSlider(
                          title: "Tailored for You",
                          content:
                              " Customize your learning experience by adding courses to favorites and tracking progress, ensuring a personalized journey through psychology.",
                          image: "digital",
                          fit: BoxFit.fill),
                      buildSlider(
                          title: "Your Knowledge, Your Shield",
                          content:
                              " Oxford Psych Courses safeguards your knowledge",
                          image: "privacy",
                          fit: BoxFit.cover),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildPageIndicator(),
                ),
                currentPage == numPages - 1
                    ? Column(
                        children: [
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () => onIntroEnd(),
                            child: Container(
                              // height: media.width * 0.10,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: AppColors.primary,
                              ),
                              child: const Center(
                                child: Text(
                                  'Get started',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildSlider(
      {required title, required content, required image, required fit}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: buildOnboardPicture(imgSrc: image, fit: fit)),
        SizedBox(height: Get.height * 0.1),
        CommonText(
          text: title,
          textAlign: TextAlign.center,
          style: boldText(
            fontSize: 25,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: CommonText(
            text: content,
            textAlign: TextAlign.center,
            style: regularText(
              fontSize: 18,
              color: Colors.white.withOpacity(
                0.7,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildOnboardPicture({required imgSrc, required fit}) {
    return Container(
      height: Get.height * 0.40,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(
            'assets/images/$imgSrc.png',
          ),
          fit: fit,
        ),
      ),
      // child: Image.asset(
      //   "assets/images/$imgSrc.jpg",
      //   fit: BoxFit.cover,
      //   // height: Get.height * 0.50,
      // ),
    );
  }
}
