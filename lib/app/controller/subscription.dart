// import 'package:deviraj_lms/app/ui/pages/subscribe_now.dart';
// import 'package:deviraj_lms/app/ui/theme/colors.dart';
// import 'package:deviraj_lms/app/ui/widgets/common/common_snackbar.dart';
// import 'package:deviraj_lms/app/ui/widgets/common/text.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';
//
// import '../payment/paywall_widget.dart';
// import '../payment/purchase_api.dart';
//
// class SubscriptionController extends GetxController {
//   static SubscriptionController get to => Get.put(SubscriptionController());
//
//   var _isClickDuration = 2.obs;
//
//   get isClickDuration => _isClickDuration.value;
//
//   set isClickDuration(value) {
//     _isClickDuration.value = value;
//   }
//
//   var _isClickCourse = 0.obs;
//
//   get isClickCourse => _isClickCourse.value;
//
//   set isClickCourse(value) {
//     _isClickCourse.value = value;
//   }
//
//   var _packageDetails = <dynamic>[].obs;
//
//   get packageDetails => _packageDetails.value;
//
//   set packageDetails(value) {
//     _packageDetails.value = value;
//   }
//
//   var _purchaseStatus = false.obs;
//
//   get purchaseStatus => _purchaseStatus.value;
//
//   set purchaseStatus(value) {
//     _purchaseStatus.value = value;
//   }
//
//   Future fetchoffers() async {
//     final offerings = await PurchaseApi.fetchOffers();
//     print("OFFERINGS : $offerings");
//     if (offerings.isEmpty) {
//       commonSnackBar(title: "No Plans Found", msg: "No Plans Found");
//     } else {
//       packageDetails = offerings
//           .map((offer) => offer.availablePackages)
//           .expand((pair) => pair)
//           .toList();
//       print("PACKAGES: $packageDetails");
//     }
//   }
//
//   Future init() async {
//     try {
//       Purchases.addCustomerInfoUpdateListener((customerInfo) {
//         updatePurchaseStatus();
//       });
//     } catch (e) {
//       print("Exception at initRevenueCat \n $e");
//     }
//   }
//
//   Future updatePurchaseStatus() async {
//     final customerInfo = await Purchases.getCustomerInfo();
//     final entitlements = customerInfo.entitlements.active.values.toList();
//     entitlements.isEmpty ? purchaseStatus = false : purchaseStatus = true;
//   }
// }
