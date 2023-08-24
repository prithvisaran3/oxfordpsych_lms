import 'package:deviraj_lms/app/ui/pages/logIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
