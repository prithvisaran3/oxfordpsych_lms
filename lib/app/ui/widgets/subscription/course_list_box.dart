// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../controller/subscription.dart';
// import '../../theme/colors.dart';
// import '../common/currency_text.dart';
//
// class CourseListBox extends StatelessWidget {
//   const CourseListBox({super.key, required this.index, required this.text});
//   final int index;
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         SubscriptionController.to.isClickCourse = index;
//       },
//       child: Obx(
//             () => Container(
//           padding: EdgeInsets.symmetric(
//               horizontal: 10, vertical: 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: SubscriptionController.to.isClickCourse ==
//                 index
//                 ? Colors.white
//                 : Colors.transparent,
//           ),
//           child: Row(
//             children: [
//               Text(
//                 "$text",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: SubscriptionController
//                       .to.isClickCourse ==
//                       index
//                       ? FontWeight.bold
//                       : FontWeight.normal,
//                   color: SubscriptionController
//                       .to.isClickCourse ==
//                       index
//                       ? AppColors.black
//                       : AppColors.white,
//                 ),
//               ),
//               Spacer(),
//               CurrencyText(
//                 amount: "50",
//                 fontSize: 16,
//                 fontWEIGHT:
//                 SubscriptionController.to.isClickCourse ==
//                     index
//                     ? FontWeight.bold
//                     : FontWeight.normal,
//                 color:
//                 SubscriptionController.to.isClickCourse ==
//                     index
//                     ? AppColors.secondary
//                     : AppColors.white,
//               ),
//               SizedBox(width: 10),
//             ],
//           ),
//         ),
//       ),
//     );;
//   }
// }
