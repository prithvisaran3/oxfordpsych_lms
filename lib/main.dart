import 'dart:io';

import 'package:deviraj_lms/app/ui/pages/initial.dart';
import 'package:deviraj_lms/helper/style.dart';
import 'package:deviraj_lms/pages/accCreateSuccess.dart';
import 'package:deviraj_lms/pages/forgotPassword.dart';
import 'package:deviraj_lms/pages/orderSuccess.dart';
import 'package:deviraj_lms/pages/payment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/ui/theme/colors.dart';

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
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
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
      title: 'E-Learning',
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
