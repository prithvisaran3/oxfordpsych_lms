import 'dart:io';
import 'package:deviraj_lms/app/ui/widgets/common/common_print.dart';
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
  commonPrint(
      status: 'Handling a background message ', msg: "${message.messageId}");
  await Firebase.initializeApp();

  initMessaging();
  // final AudioPlayer audioPlayers = AudioPlayer(playerId: "id");
  // audioPlayers.play(
  //     Platform.isAndroid
  //         ? AssetSource("audio/android_message.mp3")
  //         : Platform.isIOS
  //             ? AssetSource("audio/ios_message.m4r")
  //             : AssetSource("audio/android_message.mp3"),
  //     volume: 100,
  //     mode: PlayerMode.mediaPlayer);
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
  // await PurchaseApi.initPlatformState();
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    if (Platform.isAndroid) {
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  initMessaging();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
// FirebaseAnalyticsObserver observer =
//     FirebaseAnalyticsObserver(analytics: analytics);
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
  var fcmToken = await FirebaseMessaging.instance.getToken();
  debugPrint("fcmToken $fcmToken");
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
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
        primaryColor: AppColors.appColor,
        fontFamily: 'regular',
      ),
      home: const Initial(),
    );
  }
}
