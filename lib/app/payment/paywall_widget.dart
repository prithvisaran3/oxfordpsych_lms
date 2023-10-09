// import 'package:deviraj_lms/app/controller/subscription.dart';
// import 'package:deviraj_lms/app/ui/theme/colors.dart';
// import 'package:deviraj_lms/app/ui/widgets/common/appbar.dart';
// import 'package:deviraj_lms/app/ui/widgets/common/currency_text.dart';
// import 'package:deviraj_lms/app/ui/widgets/common/text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';
//
// class PaywallWidget extends StatefulWidget {
//   final String title;
//   final String description;
//   final List<dynamic> packages;
//   final ValueChanged<Package> onClickedPackage;
//
//   const PaywallWidget({
//     Key? key,
//     required this.title,
//     required this.description,
//     required this.packages,
//     required this.onClickedPackage,
//   }) : super(key: key);
//
//   @override
//   State<PaywallWidget> createState() => _PaywallWidgetState();
// }
//
// class _PaywallWidgetState extends State<PaywallWidget> {
//   @override
//   Widget build(BuildContext context) {
//     print("PACKAGES TESTING PRINT : ${widget.packages[0]}");
//     return Scaffold(
//       // appBar: commonAppBar(isBackIcon: true),
//       appBar: AppBar(
//         leading: GestureDetector(
//             onTap: () {
//               Get.back();
//             },
//             child: Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//             )),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             CommonText(
//               text: widget.title,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//             SizedBox(height: 16),
//             CommonText(
//               text: widget.description,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 16),
//             ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               itemCount: widget.packages.length,
//               itemBuilder: (context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       widget.onClickedPackage(widget.packages[index]);
//                     });
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: AppColors.grey,
//                             blurRadius: 10,
//                           )
//                         ]),
//                     child: Column(
//                       children: [
//                         CommonText(
//                           text: " ${widget.packages[index].identifier}",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Colors.black,
//                           ),
//                         ),
//                         CommonText(
//                           text: " ${widget.packages[index].storeProduct.title}",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Colors.black,
//                           ),
//                         ),
//                         CommonText(
//                           text:
//                               " ${widget.packages[index].storeProduct.description}",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Colors.black,
//                           ),
//                         ),
//                         CurrencyText(
//                           amount: index == 0
//                               ? "145"
//                               : index == 1
//                                   ? "245"
//                                   : "345",
//                           fontSize: 20,
//                           fontWEIGHT: FontWeight.normal,
//                           color: Colors.black,
//                           alignment: 'center',
//                         )
//                         // CommonText(
//                         //   text:
//                         //       " ${widget.packages[index].storeProduct.priceString}",
//                         //   style: TextStyle(
//                         //     fontWeight: FontWeight.bold,
//                         //     fontSize: 20,
//                         //     color: Colors.black,
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             )
//             // buildPackages(),
//           ],
//         ),
//       ),
//     );
//   }
// }
