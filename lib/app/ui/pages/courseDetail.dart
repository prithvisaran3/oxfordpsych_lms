import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:deviraj_lms/app/config/config.dart';
import 'package:deviraj_lms/app/controller/course.dart';
import 'package:deviraj_lms/app/ui/utility.dart';
import 'package:deviraj_lms/app/ui/widgets/common/common_print.dart';
import 'package:deviraj_lms/app/ui/widgets/common/logo_loading.dart';
import 'package:deviraj_lms/app/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main.dart';
import '../theme/colors.dart';
import '../theme/font_size.dart';
import '../widgets/common/currency_text.dart';
import '../widgets/common/text.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key, required this.data, required this.duration})
      : super(key: key);
  final dynamic data;
  final int duration;

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController customVideoPlayerController;
  late Future<void> videoPlayerFuture;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        "${AppConfig.videoUrl}${widget.data['gdrive_id']}/${widget.data['video']}"));

    customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
      customVideoPlayerSettings: const CustomVideoPlayerSettings(
        // showDurationPlayed: true,
        settingsButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.settings,
              color: AppColors.white,
            ),
          ],
        ),

        showDurationPlayed: true,
        showDurationRemaining: true,
      ),
    );
    videoPlayerFuture = videoPlayerController.initialize();

    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(100.0);
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    commonPrint(status: "courses data ", msg: '${widget.data}');
    commonPrint(
        status: "video  data ",
        msg:
            "${AppConfig.videoUrl}${widget.data['gdrive_id']}/${widget.data['video']}");
    commonPrint(
        status: "image ",
        msg:
            "${AppConfig.imageUrl}${widget.data['curriculum_id']}/${widget.data['photos']}");
    Future<bool> onWillPop() async {
      // This dialog will exit your app on saying yes
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              title: const Center(
                  child: Text(
                'Are you sure?',
                style: TextStyle(fontFamily: 'medium'),
              )),
              content: const Text('Do you want to back'),
              contentTextStyle:
                  const TextStyle(fontFamily: 'medium', color: AppColors.grey),
              titleTextStyle: const TextStyle(
                  fontFamily: 'medium', color: AppColors.primary, fontSize: 16),
              actions: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  color: AppColors.grey,
                  onPressed: () async {
                    // Navigator.of(context).pop(false);
                    await videoPlayerController.pause();
                    convertToSeconds(videoPlayerController.value.position
                        .toString()
                        .split(":"));
                    CourseController.to.sendDuration(
                        duration: "${CourseController.to.courseDuration}",
                        id: "${widget.data['id']}");
                    Get.back();
                  },
                  child: const Text(
                    'No',
                    style:
                        TextStyle(color: AppColors.white, fontFamily: 'medium'),
                  ),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  color: AppColors.primary,
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                        color: AppColors.white,
                        fontFamily: 'medium',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: AppColors.black),
          title: GestureDetector(
            onTap: () async {
              await videoPlayerController.pause();
              print("${videoPlayerController.value.position}");
              convertToSeconds(
                  videoPlayerController.value.position.toString().split(":"));
              CourseController.to.sendDuration(
                  duration: "${CourseController.to.courseDuration}",
                  id: "${widget.data['id']}");
              Get.back();
            },
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 18,
                  color: AppColors.primary,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Course Detail",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  softWrap: false,
                  style: headText(color: AppColors.primary),
                ),
              ],
            ),
          ),
          actions: [
            Obx(
              () => IconButton(
                onPressed: () {
                  MainController.to.isFavourite =
                      !MainController.to.isFavourite;
                },
                icon: MainController.to.isFavourite == false
                    ? const Icon(
                        Icons.bookmark_border_outlined,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.bookmark,
                        color: AppColors.primary,
                      ),
              ),
            ),
          ],
        ),
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

                // // course includes
                // courseIncludes(),

                // //what will learn
                // whatWillLearn(),

                // course description
                description(),

                // curriculum data
                // curriculum(),

                // highlights
                highLights(),

                //course info
                courseInfo(context),

                // about instructer
                aboutInstructor(),

                //price card
                // priceCard(),

                // buy & cart
                // buyAndCart()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Text(
          'Description',
          style: headText(),
        ),
        const SizedBox(
          height: 10,
        ),
        Text('${widget.data['description']}'),
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
      child: Column(
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
                    if (snapshot.error != null) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.info_outline,
                            color: AppColors.red,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CommonText(
                            text: "Video Error, Try again later",
                            style: mediumText(
                              fontSize: 14,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      );
                    } else {
                      CourseController.to.isMyCourse == true
                          ? videoPlayerController
                              .seekTo(Duration(seconds: widget.duration))
                          : null;

                      return AspectRatio(
                        aspectRatio: videoPlayerController.value.aspectRatio,
                        // child: VideoPlayer(videoPlayerController),
                        child: CustomVideoPlayer(
                          customVideoPlayerController:
                              customVideoPlayerController,
                        ),
                      );
                    }
                  } else {
                    return const LogoLoading(height: 60, width: 60, size: 20);
                  }
                },
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     // videoPlayerController.seekTo(Duration(seconds: 20));
          //     print(
          //         "SECONDS: ${videoPlayerController.value.position.toString().split(":")}");
          //   },
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       color: Colors.red,
          //     ),
          //     child: Text('${videoPlayerController.value.position}'),
          //   ),
          // )
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

          // Positioned(
          //   top: 0,
          //   bottom: 0,
          //   right: 15,
          //   // left: 0,
          //   child: Center(
          //     child: Text(
          //       "Demo video",
          //       style: TextStyle(
          //           color: AppColors.white.withOpacity(.4), fontSize: 16),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  courseTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          textAlign: TextAlign.left,
          text: '${widget.data["title"]}',
          style: headText(color: AppColors.black),
        ),
        // const SizedBox(
        //   width: 20,
        // ),
        const SizedBox(
          height: 5,
        ),
        CommonText(
          textAlign: TextAlign.left,
          text: '${widget.data["curriculum"]}',
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black),
        ),

        // CommonText(
        //   textAlign: TextAlign.left,
        //   text: '${widget.data["languages"]}',
        //   style: const TextStyle(fontSize: 12, color: AppColors.primary),
        // ),
        // Row(
        //   children: const [
        //     Text('4.5'),
        //     SizedBox(
        //       width: 10,
        //     ),
        //     Icon(
        //       Icons.star,
        //       color: Colors.amber,
        //       size: 20,
        //     ),
        //     Icon(
        //       Icons.star,
        //       color: Colors.amber,
        //       size: 20,
        //     ),
        //     Icon(
        //       Icons.star,
        //       size: 20,
        //       color: Colors.amber,
        //     ),
        //     Icon(
        //       Icons.star,
        //       size: 20,
        //       color: Colors.amber,
        //     ),
        //     Icon(
        //       Icons.star_outline,
        //       size: 20,
        //       color: Colors.amber,
        //     ),
        //     SizedBox(
        //       width: 10,
        //     ),
        //     Text(
        //       '(122 ratings) 25,190 Students',
        //       style: TextStyle(fontSize: 12),
        //     )
        //   ],
        // ),
        const SizedBox(
          height: 10,
        ),
        // RichText(
        //   text:  TextSpan(
        //     text:
        //         '${widget.data['description']} ',
        //     style: TextStyle(
        //         fontFamily: 'regular', color: Colors.black, height: 1.5),
        //     children: <TextSpan>[
        //       // TextSpan(
        //       //   text: ' Read more',
        //       //   style: TextStyle(
        //       //     fontFamily: 'regular',
        //       //     color: AppColors.primary,
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ),
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
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.circle,
                        color: AppColors.primary,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Course Info :',
            style: headText(),
          ),
          ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(
                        // index == 0
                        //     ? Icons.phone_android
                        //     : index == 1
                        //         ? Icons.person
                        //         : Icons.language,

                        index == 0 ? Icons.phone_android : Icons.topic,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // index == 0 || index == 1
                      //     ? Text(index == 0
                      //         ? 'Last uploaded on Jan 21, 2022'
                      //         : "${widget.data['languages']}")
                      //     : RichText(
                      //         text: TextSpan(
                      //           text: 'Author : ',
                      //           style: const TextStyle(
                      //               fontFamily: 'regular',
                      //               color: Colors.black,
                      //               height: 1.5),
                      //           children: [
                      //             TextSpan(
                      //               text: widget.data['topic']
                      //                   .toString()
                      //                   .split(" ")[0],
                      //               style: const TextStyle(
                      //                 fontFamily: 'regular',
                      //                 color: AppColors.primary,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),

                      Text(index == 0
                          ? 'Last uploaded on ${getIsoToLocalDate(date: widget.data['log_date'])}'
                          : "${widget.data['topic']}")
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  highLights() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 1,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Icon(
                    Icons.celebration_outlined,

                    // index == 0
                    //     ? Icons.insert_drive_file_outlined
                    //     : index == 1
                    //     ? Icons.celebration_outlined
                    //     : Icons.thumb_up_outlined,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Text(index == 0
                  //     ? "250 Courses Uploaded"
                  //     : index == 1
                  //         ? "Best Seller Award"
                  //         : "5+ Million Students Followed")

                  Text("Best Seller Award")
                ],
              ),
            );
          }),
    );
  }

  aboutInstructor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Instructor:',
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
                // image: DecorationImage(
                //     image: NetworkImage(
                //         '${AppConfig.imageUrl}${widget.data['curriculum_id']}/${widget.data['photos']}'),
                //     fit: BoxFit.cover)
              ),
              child:
                  "${AppConfig.imageUrl}${widget.data['curriculum_id']}/${widget.data['photos']}" ==
                          ""
                      ? Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              color: AppColors.primary,
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
                                "${AppConfig.imageUrl}${widget.data['curriculum_id']}/${widget.data['photos']}",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    const Center(
                              child: CircularProgressIndicator(
                                color: Colors.grey,
                                strokeWidth: 2,
                              ),
                            ),
                            errorWidget: (context, url, error) {
                              return Center(
                                child: Container(
                                  color: AppColors.primary,
                                  width: double.infinity,
                                  height: double.infinity,
                                  padding: const EdgeInsets.all(4),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      "assets/images/logo.png",
                                      fit: BoxFit.contain,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.data['topic'].toString().split(" ")[0],
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        // Container(
                        //   padding: const EdgeInsets.all(3),
                        //   decoration: BoxDecoration(
                        //       color: AppColors.primary,
                        //       borderRadius: BorderRadius.circular(10)),
                        //   child: const Text(
                        //     'BEST SELLER',
                        //     style: TextStyle(fontSize: 12),
                        //   ),
                        // ),
                      ],
                    ),
                    const Text(
                      'Top Rated Instructor',
                      style: TextStyle(color: AppColors.primary),
                    ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: const [
                    //     Text('4.5'),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Icon(
                    //       Icons.star,
                    //       color: Colors.amber,
                    //       size: 20,
                    //     ),
                    //     Icon(
                    //       Icons.star,
                    //       color: Colors.amber,
                    //       size: 20,
                    //     ),
                    //     Icon(
                    //       Icons.star,
                    //       size: 20,
                    //       color: Colors.amber,
                    //     ),
                    //     Icon(
                    //       Icons.star,
                    //       size: 20,
                    //       color: Colors.amber,
                    //     ),
                    //     Icon(
                    //       Icons.star_outline,
                    //       size: 20,
                    //       color: Colors.amber,
                    //     ),
                    //   ],
                    // ),
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
                    side: const BorderSide(color: AppColors.primary)),
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
      backgroundColor: AppColors.primary,
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
            style: const TextStyle(
                color: AppColors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          CurrencyText(
            amount: widget.data['price'] == "" ? "0" : widget.data['price'],
            fontSize: 30,
            fontWEIGHT: FontWeight.bold,
            color: AppColors.primary,
          ),
          const SizedBox(width: 5),
          CurrencyText(
            amount: widget.data['price'] == ""
                ? "100"
                : (double.parse(widget.data['price']) + 100).toString(),
            fontSize: 20,
            fontWEIGHT: FontWeight.bold,
            color: AppColors.primary,
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
