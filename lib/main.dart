import 'package:deviraj_lms/app/ui/pages/initial.dart';
import 'package:deviraj_lms/helper/style.dart';
import 'package:deviraj_lms/pages/aboutInstructor.dart';
import 'package:deviraj_lms/pages/accCreateSuccess.dart';
import 'package:deviraj_lms/pages/account.dart';
import 'package:deviraj_lms/pages/forgotPassword.dart';
import 'package:deviraj_lms/pages/home.dart';
import 'package:deviraj_lms/pages/myCourse.dart';
import 'package:deviraj_lms/pages/orderSuccess.dart';
import 'package:deviraj_lms/pages/payment.dart';
import 'package:deviraj_lms/pages/topCourses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/ui/theme/colors.dart';

void main() {
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
        home.page_id: (context) => home(),
        myCourse.page_id: (context) => myCourse(),
        account.page_id: (context) => account(),
        topCourses.page_id: (context) => topCourses(),
        aboutInstructer.page_id: (context) => aboutInstructer(),
        payment.page_id: (context) => payment(),
        orderSuccess.page_id: (context) => orderSuccess(),
      },
    );
  }
}
