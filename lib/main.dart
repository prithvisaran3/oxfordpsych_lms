import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:deviraj_lms/app/payment/purchase_api.dart';
import 'package:deviraj_lms/helper/style.dart';
import 'package:deviraj_lms/pages/accCreateSuccess.dart';
import 'package:deviraj_lms/pages/forgotPassword.dart';
import 'package:deviraj_lms/pages/orderSuccess.dart';
import 'package:deviraj_lms/app/ui/pages/payment.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';

import 'app/service/notification.dart';
import 'app/ui/pages/auth/initial.dart';
import 'app/ui/theme/colors.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
  await Firebase.initializeApp();

  initMessaging();
  final AudioPlayer audioPlayers = AudioPlayer(playerId: "id");
  audioPlayers.play(
      Platform.isAndroid
          ? AssetSource("audio/android_message.mp3")
          : Platform.isIOS
              ? AssetSource("audio/ios_message.m4r")
              : AssetSource("audio/android_message.mp3"),
      volume: 100,
      mode: PlayerMode.mediaPlayer);
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PurchaseApi.initPlatformState();
  await FlutterWindowManager.addFlags(
      FlutterWindowManager.FLAG_SECURE);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  initMessaging();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
  var fcmToken = await FirebaseMessaging.instance.getToken();
  debugPrint("fcmToken $fcmToken");
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: appColor,
        fontFamily: 'regular',
      ),
      home: Initial(),
      routes: {
        accCreateSuccess.page_id: (context) => accCreateSuccess(),
        forgotPassword.page_id: (context) => forgotPassword(),
        payment.page_id: (context) => payment(),
        orderSuccess.page_id: (context) => orderSuccess(),
      },
    );
  }
}
