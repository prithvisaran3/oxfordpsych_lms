import 'dart:async';
import 'package:deviraj_lms/app/ui/pages/onboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth.dart';
import '../widgets/common/exit_alert.dart';
import 'home/main.dart';
import 'logIn.dart';

class Initial extends StatefulWidget {
  const Initial({Key? key}) : super(key: key);

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  String? isLogin;

  Future<bool> onWillPop() async {
    return (exitAlert(context)) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
            body: GetBuilder<AuthController>(
                init: AuthController(),
                initState: (state) async {
                  // AuthController.to.checkIsUpdateAvailable();
                  bool login = await AuthController.to.loginCheck();
                  debugPrint("is Login: $login");
                  bool onBoarding = await AuthController.to.onboardCheck();
                  debugPrint("onBoarding value $onBoarding");
                  if (onBoarding == true) {
                    setState(() {
                      isLogin = 'onBoarding';
                    });
                  } else if (login == true) {
                    setState(() {
                      isLogin = "isLogin";
                    });
                  } else {
                    debugPrint("logged in $isLogin");
                  }
                },
                builder: (controller) => isLogin == "onBoarding"
                    ? const Onboard()
                    : isLogin == "isLogin"
                        ? HomeMain()
                        : Login())));
  }
}
