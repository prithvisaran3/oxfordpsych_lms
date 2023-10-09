// import 'package:deviraj_lms/app/controller/subscription.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../theme/colors.dart';
// import '../common/currency_text.dart';
//
// class SubscriptionDurationBox extends StatelessWidget {
//   const SubscriptionDurationBox(
//       {super.key,
//       required this.duration,
//       required this.price,
//       required this.index});
//
//   final String duration;
//   final String price;
//   final int index;
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => GestureDetector(
//         onTap: () {
//           SubscriptionController.to.isClickDuration = index;
//         },
//         child: Container(
//           // width: Get.width * 0.25,
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: SubscriptionController.to.isClickDuration == index
//                 ? Colors.white
//                 : Colors.transparent,
//             border: Border.all(
//               width: 2,
//               color: AppColors.white,
//             ),
//           ),
//           child: Column(
//             children: [
//               Text(
//                 duration,
//                 style: TextStyle(
//                   color: SubscriptionController.to.isClickDuration == index
//                       ? AppColors.black
//                       : AppColors.white,
//                   fontWeight: SubscriptionController.to.isClickDuration == index
//                       ? FontWeight.bold
//                       : FontWeight.normal,
//                 ),
//               ),
//               CurrencyText(
//                 alignment: 'center',
//                 amount: price,
//                 fontSize: 14,
//                 fontWEIGHT: FontWeight.bold,
//                 color: SubscriptionController.to.isClickDuration == index
//                     ? AppColors.secondary
//                     : AppColors.white,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
