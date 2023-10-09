// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
//
// import '../../theme/colors.dart';
// import '../common/currency_text.dart';
//
// class ProceedToPayButton extends StatelessWidget {
//   const ProceedToPayButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(
//             Radius.circular(50.0),
//           ),
//           color: AppColors.black,
//         ),
//         child: Shimmer.fromColors(
//           baseColor: AppColors.secondary,
//           highlightColor: AppColors.white,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Spacer(),
//               Text(
//                 "Proceed to Pay",
//                 style: const TextStyle(
//                     fontFamily: 'bold', color: Colors.white, fontSize: 20),
//               ),
//               Spacer(),
//               CurrencyText(
//                 amount: "150",
//                 fontSize: 22,
//                 fontWEIGHT: FontWeight.bold,
//                 color: AppColors.secondary,
//               ),
//               SizedBox(width: 15),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
