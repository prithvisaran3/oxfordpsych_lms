import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:deviraj_lms/app/ui/widgets/common/currency_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/colors.dart';
import '../theme/font.dart';
import '../utility.dart';
import '../widgets/common/appbar.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController customVideoPlayerController;
  late Future<void> videoPlayerFuture;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.asset('assets/images/demo.mp4');

    customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: videoPlayerController,
        customVideoPlayerSettings: CustomVideoPlayerSettings(
            settingsButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.settings,
              color: AppColors.white,
            ),
          ],
        )));
    videoPlayerFuture = videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(100.0);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(title: "Course Detail", isBackIcon: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // course title with description
              courseTitle(),

              //video
              video(),

              // course includes
              courseIncludes(),

              //what will learn
              whatWillLearn(),

              // course description
              description(),

              // curriculum data
              // curriculum(),

              // highlights
              highLights(),

              //course info
              courseInfo(context),

              // about instructer
              aboutInstructer(),

              //price card
              priceCard(),

              // buy & cart
              buyAndCart()
            ],
          ),
        ),
      ),
    );
  }

  Column description() {
    return Column(
      children: [
        Text(
          'Description',
          style: headText(),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been text of the printing and'),
        Row(
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
        )
      ],
    );
  }

  courseIncludes() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This course includes:',
            style: headText(),
          ),
          const SizedBox(
            height: 10,
          ),
          courseInclude('10.5 hours on demand video'),
          courseInclude('15 Question Patterns'),
          courseInclude('Support Files'),
          courseInclude('Access on all devices'),
          courseInclude('Certificate of completions'),
        ],
      ),
    );
  }

  Padding video() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FutureBuilder(
                future: videoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: videoPlayerController.value.aspectRatio,
                      // child: VideoPlayer(videoPlayerController),
                      child: CustomVideoPlayer(
                        customVideoPlayerController:
                            customVideoPlayerController,
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
          // Positioned(
          //     bottom: 5,
          //     right: 10,
          //     left: 10,
          //     child: Column(
          //       children: [
          //         ClosedCaption(
          //             text: videoPlayerController.value.caption.text),
          //         VideoProgressIndicator(videoPlayerController,
          //             allowScrubbing: true),
          //       ],
          //     )),
          // Positioned(
          //   top: 0,
          //   bottom: 0,
          //   right: 0,
          //   left: 0,
          //   child: Center(
          //     child: FloatingActionButton(
          //       onPressed: () {
          //         setState(() {
          //           videoPlayerController.value.isPlaying
          //               ? videoPlayerController.pause()
          //               : videoPlayerController.play();
          //         });
          //       },
          //       child: Icon(
          //         videoPlayerController.value.isPlaying
          //             ? Icons.pause
          //             : Icons.play_arrow,
          //       ),
          //     ),
          //   ),
          // ),

          Positioned(
            top: 0,
            bottom: 0,
            right: 15,
            // left: 0,
            child: Center(
              child: Text(
                "Demo video",
                style: TextStyle(
                    color: AppColors.white.withOpacity(.4), fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  courseTitle() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Panic Attacks \nHistory',
              style: headText(),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                'BEST SELLER',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: const [
            Text('4.5'),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            Icon(
              Icons.star,
              size: 20,
              color: Colors.amber,
            ),
            Icon(
              Icons.star,
              size: 20,
              color: Colors.amber,
            ),
            Icon(
              Icons.star_outline,
              size: 20,
              color: Colors.amber,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '(122 ratings) 25,190 Students',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: const TextSpan(
            text:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry... ',
            style: TextStyle(
                fontFamily: 'regular', color: Colors.black, height: 1.5),
            children: <TextSpan>[
              // TextSpan(
              //   text: ' Read more',
              //   style: TextStyle(
              //     fontFamily: 'regular',
              //     color: AppColors.primary,
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  whatWillLearn() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What will you learn',
            style: headText(),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.circle,
                        color: AppColors.green,
                        size: 10,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been"))
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }

  curriculum() {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Curriculum',
            style: headText(),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '179 Lectures / 20h 4min Length',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                  child:
                      Text('Episode 1 - Introduction to 3D Animations & tools'),
                );
              })
        ],
      ),
    );
  }

  courseInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Course Info :',
          style: headText(),
        ),
        ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Icon(
                      index == 0
                          ? Icons.phone_android
                          : index == 1
                              ? Icons.person
                              : Icons.language,
                      color: Colors.teal,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    index == 0 || index == 1
                        ? Text(index == 0
                            ? 'Last uploaded on Jan 21, 2022'
                            : "English, French")
                        : RichText(
                            text: const TextSpan(
                              text: 'Author : ',
                              style: TextStyle(
                                  fontFamily: 'regular',
                                  color: Colors.black,
                                  height: 1.5),
                              children: [
                                TextSpan(
                                  text: ' STEPHEN MORIS',
                                  style: TextStyle(
                                    fontFamily: 'regular',
                                    color: Colors.teal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  highLights() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Icon(
                    index == 0
                        ? Icons.insert_drive_file_outlined
                        : index == 1
                            ? Icons.celebration_outlined
                            : Icons.thumb_up_outlined,
                    color: AppColors.secondary,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(index == 0
                      ? "250 Courses Uploaded"
                      : index == 1
                          ? "Best Seller Award"
                          : "5+ Million Students Followed")
                ],
              ),
            );
          }),
    );
  }

  aboutInstructer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Instructer:',
          style: headText(),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/course.jpg'),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Stephen Moris',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'BEST SELLER',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Top Rated Instructor',
                      style: TextStyle(color: Colors.teal),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('4.5'),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star_outline,
                          size: 20,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  buyAndCart() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => cart()));
              },
              style: simpleButton(),
              child: const Text(
                'Buy Now',
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                elevation: 0,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: AppColors.secondary)),
              ),
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }

  simpleButton() {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: AppColors.secondary,
      elevation: 0,
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  priceCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: AppColors.black, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Offer Price'.toUpperCase(),
            style:
                TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          CurrencyText(
            amount: "30.50",
            fontSize: 30,
            fontWEIGHT: FontWeight.bold,
            color: AppColors.secondary,
          ),
          SizedBox(width: 5),
          CurrencyText(
            amount: "40.50",
            fontSize: 20,
            fontWEIGHT: FontWeight.bold,
            color: AppColors.secondary,
            isStrikeThrough: true,
          ),
        ],
      ),
    );
  }

  Widget courseInclude(text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.circle,
            color: AppColors.green,
            size: 10,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: Text(text))
        ],
      ),
    );
  }
}
