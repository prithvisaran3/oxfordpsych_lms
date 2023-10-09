import 'package:deviraj_lms/app/ui/pages/auth/onboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth.dart';
import '../../widgets/common/exit_alert.dart';
import '../home/main.dart';
import 'login.dart';

class Initial extends StatefulWidget {
  const Initial({Key? key}) : super(key: key);

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  String? isLogin;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: backAlert,
        child: Scaffold(
            body: GetBuilder<AuthController>(
                init: AuthController(),
                initState: (state) async {
                  AuthController.to.checkIsUpdateAvailable();
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
                    ? const OnBoard()
                    : isLogin == "isLogin"
                        ? const HomeMain()
                        : const Login())));
  }
}
