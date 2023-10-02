import 'package:deviraj_lms/app/controller/wishlist.dart';
import 'package:deviraj_lms/app/ui/theme/font_size.dart';
import 'package:deviraj_lms/app/ui/widgets/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/course.dart';
import '../../theme/colors.dart';
import '../../widgets/all_courses_card.dart';
import '../../widgets/common/appbar.dart';
import '../courseDetail.dart';

class AllCourses extends StatelessWidget {
  const AllCourses({Key? key, required this.data, required this.curriculum})
      : super(key: key);
  final dynamic data;
  final String curriculum;

  @override
  Widget build(BuildContext context) {
    var ar = [];
    data.forEach((e) {
      if (e['curriculum'] == curriculum) {
        ar.add(e['curriculum']);
      }
      debugPrint("Category Course data length: ${ar.length}");
    });
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:
            commonAppBar(title: curriculum, isBackIcon: true, isLogo: false),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 56.0, right: 16, left: 16),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  data.length == 0
                      ? const Text("Emopty")
                      : ListView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return data[index]['curriculum'] == curriculum
                                ? AllCoursesCard(
                                    cardData: data[index],
                                    onTap: () {
                                      Get.to(
                                        () => CourseDetail(
                                          data: CourseController
                                              .to.courseDetails[index],
                                        ),
                                      );
                                    },
                                  )
                                : const SizedBox();
                          },
                        )
                ],
              ),
            ),
            searchbar(),
            Obx(() => WishListController.to.addLoading == true
                ? Container(
                    color: Colors.black26,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SimpleLoading(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please wait...",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  )
                : const SizedBox())
          ],
        ));
  }

  searchbar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          style: const TextStyle(color: AppColors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search here',
            prefixIcon: const Icon(Icons.search, color: AppColors.black),
            hintStyle: const TextStyle(color: AppColors.grey),
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: AppColors.grey,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: AppColors.grey,
                )),
            fillColor: AppColors.white,
          ),
        ),
      ),
    );
  }
}
