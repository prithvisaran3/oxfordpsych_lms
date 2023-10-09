// import 'package:deviraj_lms/app/ui/theme/colors.dart';
// import 'package:deviraj_lms/app/ui/widgets/subscription/ProceedToPay_button.dart';
// import 'package:deviraj_lms/app/ui/widgets/subscription/course_list_box.dart';
// import 'package:deviraj_lms/app/ui/widgets/subscription/duration_box.dart';
// import 'package:deviraj_lms/app/ui/widgets/subscription/selectedcourses_list.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:shimmer/shimmer.dart';
//
// import '../../controller/course.dart';
// import '../../controller/subscription.dart';
// import '../widgets/common/text.dart';
//
// class SubscribeNow extends StatelessWidget {
//   const SubscribeNow({super.key});
// // final List? packages;
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(
//         init: CourseController(),
//         initState: (_) {},
//         builder: (_) {
//           return SafeArea(
//             child: Scaffold(
//               backgroundColor: AppColors.primary,
//               body: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Stack(
//                   children: [
//                     const Positioned(
//                       bottom: 20,
//                       left: 0,
//                       right: 0,
//                       child: ProceedToPayButton(),
//                     ),
//                     Container(
//                       height: Get.height,
//                       width: Get.width,
//                       decoration: const BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             AppColors.primary,
//                             AppColors.secondary,
//                           ],
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20.0, vertical: 10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             IntroSection(),
//                             DurationSection(),
//                             CourseListSection(),
//                             SelectedCoursesSection(),
//                             const ProceedToPayButton(),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
//
//   Row IntroSection() {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Subscribe \nNow!",
//           style: TextStyle(
//             color: AppColors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 45,
//           ),
//         ),
//         const Spacer(),
//         GestureDetector(
//           onTap: () {
//             Get.back();
//           },
//           child: const Icon(
//             Ionicons.close,
//             color: AppColors.white,
//             size: 30,
//           ),
//         )
//       ],
//     );
//   }
//
//   Container SelectedCoursesSection() {
//     return Container(
//       // height: Get.height * 0.20,
//       width: Get.width,
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       margin: const EdgeInsets.symmetric(vertical: 20),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.white,
//           boxShadow: [
//             const BoxShadow(
//               color: AppColors.grey,
//               spreadRadius: 1,
//               blurRadius: 1,
//             )
//           ]
//           // border: Border.all(
//           //   width: 3,
//           //   color: AppColors.white,
//           // ),
//           ),
//       child: Column(
//         children: [
//           const Center(
//             child: Text(
//               'Selected Courses',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color: AppColors.black,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(height: 10),
//           ListView.builder(
//             itemCount: 6,
//             shrinkWrap: true,
//             scrollDirection: Axis.vertical,
//             physics: const BouncingScrollPhysics(),
//             itemBuilder: (context, int index) {
//               return const SelectedCoursesList();
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   CourseListSection() {
//     return Column(
//       children: [
//         Container(
//           height: Get.height * 0.20,
//           width: Get.width,
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           margin: const EdgeInsets.symmetric(vertical: 20),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.transparent,
//             border: Border.all(
//               width: 3,
//               color: AppColors.white,
//             ),
//           ),
//           child: ListView.builder(
//             itemCount:  2,
//             shrinkWrap: true,
//             scrollDirection: Axis.vertical,
//             physics: const BouncingScrollPhysics(),
//             itemBuilder: (context, int index) {
//               return CourseListBox(index: index, text: "hi",);
//             },
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           margin: const EdgeInsets.symmetric(horizontal: 50),
//           width: double.infinity,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               boxShadow: [
//                 const BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 10,
//                 ),
//               ],
//               color: Colors.black),
//           child: const CommonText(
//             text: "Add",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   Row DurationSection() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         SubscriptionDurationBox(
//           duration: '1 month',
//           price: '20',
//           index: 0,
//         ),
//         SubscriptionDurationBox(
//           duration: '6 months',
//           price: '50',
//           index: 1,
//         ),
//         SubscriptionDurationBox(
//           duration: '12 months',
//           price: '100',
//           index: 2,
//         ),
//       ],
//     );
//   }
// }
