import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../all_courses.dart';
import '../../theme/colors.dart';
import '../../theme/font.dart';
import '../../widgets/banner.dart';
import '../../widgets/course_card.dart';
import '../cart.dart';
import '../categories.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.black),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.window_rounded)),
        title: SizedBox(
          width: 250,
          child: Text(
            'Hi,Jaydeep Hirani',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 1,
            softWrap: false,
            style: headText(),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            searchbar(),
            const SizedBox(
              height: 20,
            ),
            const ImageBanner(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: headText(),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => Categories());
                  },
                  child: Row(
                    children: const [
                      Text(
                        'SEE ALL',
                        style: TextStyle(color: AppColors.secondary),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: AppColors.secondary,
                        size: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  categoryContainer('Design'),
                  categoryContainer('Development'),
                  categoryContainer('Business'),
                  categoryContainer('IT & Software'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    categoryContainer('Health & Fitness'),
                    categoryContainer('Business'),
                    categoryContainer('Design'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Courses',
                  style: headText(),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AllCourses()));
                  },
                  child: Row(
                    children: const [
                      Text(
                        'SEE ALL',
                        style: TextStyle(color: AppColors.primary),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: AppColors.primary,
                        size: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const CourseCard();
                  }),
            ),
          ],
        ),
      ),
    );
  }

  categoryContainer(text) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(15)),
      child: Text(text),
    );
  }

  searchbar() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        style: TextStyle(color: AppColors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search here...',
          prefixIcon: Icon(Icons.search, color: AppColors.black),
          hintStyle: TextStyle(color: AppColors.grey),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: AppColors.grey,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: AppColors.grey,
              )),
          fillColor: AppColors.white,
        ),
      ),
    );
  }
}
