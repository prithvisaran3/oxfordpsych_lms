// import 'dart:io';
//
// import 'package:flutter/services.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';
//
// class PurchaseApi {
//   static const _apiKey = 'goog_dgmBedseouDzhgKQFaSHmcAngPu';
//
//   static Future initPlatformState() async {
//     await Purchases.setLogLevel(LogLevel.error);
//
//     PurchasesConfiguration configuration;
//     if (Platform.isAndroid) {
//       configuration = PurchasesConfiguration(_apiKey);
//       //   if (buildingForAmazon) {
//       //     // use your preferred way to determine if this build is for Amazon store
//       //     // checkout our MagicWeather sample for a suggestion
//       //     configuration = AmazonConfiguration(<public_amazon_sdk_key>);
//       //   }
//       // } else if (Platform.isIOS) {
//       //   configuration = PurchasesConfiguration(<public_ios_sdk_key>);
//       // }
//       await Purchases.configure(configuration..appUserID="1");
//     }
//   }
//
//   static Future<List<Offering>> fetchOffers() async {
//     try {
//       final offerings = await Purchases.getOfferings();
//       print("GET OFFERINGS: $offerings");
//       final current = offerings.current;
//       return current == null ? [] : [current];
//     } on PlatformException catch (e) {
//       print("fetchOffers Exception");
//       return [];
//     }
//   }
//
//   static Future<bool> purchasePackage(Package package) async {
//     try {
//       await Purchases.purchasePackage(package);
//       return true;
//     } catch (e) {
//       print("Exception at purchasePackage $e");
//       return false;
//     }
//   }
// }
