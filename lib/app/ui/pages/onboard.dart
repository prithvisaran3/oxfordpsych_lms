import 'package:deviraj_lms/app/controller/auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../theme/colors.dart';
import '../theme/font.dart';
import 'logIn.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final CarouselController _controller = CarouselController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                onPageChanged: ((index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
                height: double.infinity,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: false,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              carouselController: _controller,
              items: [1, 2, 3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Column(
                          children: [
                            if (i == 1)
                              buildSlide(
                                  image: "assets/images/course",
                                  title: "USER FRIENDLY",
                                  description: "App",
                                  onPressed: () {
                                    _controller.nextPage();
                                  })
                            else if (i == 2)
                              buildSlide(
                                  image: "assets/images/home",
                                  title: "ONLINE LIBRARY",
                                  description: "Videos & Notes",
                                  onPressed: () {
                                    _controller.nextPage();
                                  })
                            else if (i == 3)
                              buildSlide(
                                  image: "assets/images/slider",
                                  title: "READY TO FIND A COURSE",
                                  description: "Credibly",
                                  onPressed: () {
                                    AuthController.to.setOnboardData();
                                  })
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Positioned(
                bottom: 15,
                right: 0,
                left: 0,
                child: Center(
                    child: SizedBox(
                  height: 15,
                  child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 8,
                          width: 8,
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == _currentIndex
                                  ? AppColors.primary
                                  : AppColors.grey),
                        );
                      }),
                )))
          ],
        ));
  }

  buildSlide({image, title, description, required Function() onPressed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 400,
          width: double.infinity,
          child: ClipPath(
            clipper: CustomShape(),
            child: ClipRRect(
              child: Image.asset(
                '$image.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                "$title",
                textAlign: TextAlign.center,
                style: headText(),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "$description",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.secondary,
                child: IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
