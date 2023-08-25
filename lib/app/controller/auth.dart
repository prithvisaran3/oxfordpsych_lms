import 'dart:io';

import 'package:deviraj_lms/app/ui/pages/logIn.dart';
import 'package:deviraj_lms/app/ui/widgets/common/alert.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui/pages/initial.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());

  ///login text controller
  final TextEditingController lEmail = TextEditingController();
  final TextEditingController lPassword = TextEditingController();

  ///register text controller
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  ///change password
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController newConfirmPassword = TextEditingController();

  final _termsAndConditions = false.obs;

  get termsAndConditions => _termsAndConditions.value;

  set termsAndConditions(value) {
    _termsAndConditions.value = value;
  }

  onboardCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var onboard = pref.getBool('onboard');
    if (onboard != null) {
      return false;
    } else {
      return true;
    }
  }

  setOnboardData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('onboard', true);
    Get.off(() => const Initial());
  }

  loginCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var login = pref.getString('token');
    if (login != null && login.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
  // checkIsUpdateAvailable() async {
  //   final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  //   await remoteConfig.fetch();
  //   await remoteConfig.fetchAndActivate();
  //   final info = await PackageInfo.fromPlatform();
  //
  //   // get local app version and change to int
  //   var lv = info.version;
  //   var split = lv.replaceAll(".", "");
  //   var localVersion = int.parse(split);
  //   debugPrint("local version $lv");
  //   debugPrint("convert local version $localVersion");
  //
  //   // get remote app version and change to int
  //   var rv = remoteConfig.getString('app');
  //   print("rc is $rv");
  //   var rSplit = rv.replaceAll(".", "");
  //   var remoteVersion = int.parse(rSplit);
  //   debugPrint("remote version $rv");
  //   debugPrint("convert remote version $remoteVersion");
  //
  //   if (localVersion > remoteVersion) {
  //     debugPrint("update available");
  //     if (Platform.isAndroid || Platform.isIOS) {
  //       final appId =
  //       Platform.isAndroid ? 'deviraj.lms' : 'YOUR_IOS_APP_ID';
  //       final url = Uri.parse(
  //         Platform.isAndroid
  //             ? "https://play.google.com/store/apps/details?id=$appId"
  //             : "https://apps.apple.com/app/id$appId",
  //       );
  //
  //       commonAlertDialog(Get.context!,
  //           content:
  //           "Update required for \nOxfordPsych App",
  //           confirmButtonPressed: () {
  //             launchUrl(
  //               url,
  //               mode: LaunchMode.externalApplication,
  //             );
  //           });
  //     }
  //   } else {
  //     debugPrint("update not available");
  //   }
  // }

  checkPasswordChange() async {
    if (currentPassword.text == "" ||
        newPassword == "" ||
        newConfirmPassword == "") {
      if (currentPassword.text == lPassword.text) {
        if (newPassword.text == newConfirmPassword.text) {
          //Password change API
        } else {
          print("New password doesn't match confirm password");
        }
      } else {
        print("Current password is wrong");
      }
    } else {
      print("Empty fields");
    }
  }
}
