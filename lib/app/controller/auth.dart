// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:deviraj_lms/app/controller/profile.dart';
import 'package:deviraj_lms/app/ui/pages/home/main.dart';
import 'package:deviraj_lms/app/ui/pages/profile/change_password.dart';

import 'package:deviraj_lms/app/ui/widgets/common/alert.dart';
import 'package:deviraj_lms/app/ui/widgets/common/password_generate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/repository/auth.dart';
import '../ui/pages/auth/initial.dart';
import '../ui/pages/auth/login.dart';
import '../ui/widgets/common/common_print.dart';
import '../ui/widgets/common/common_snackbar.dart';
import 'main.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());

  final repository = AuthRepository();

  ///login text controller
  final TextEditingController lEmail = TextEditingController();
  final TextEditingController lPassword = TextEditingController();

  ///register text controller
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController password = TextEditingController();

  /// validate email controller
  TextEditingController vEmail = TextEditingController();

  ///change password
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController newConfirmPassword = TextEditingController();

  ///login form key
  final registerKey = GlobalKey<FormState>();
  final updateKey = GlobalKey<FormState>();

  final _termsAndConditions = false.obs;

  get termsAndConditions => _termsAndConditions.value;

  set termsAndConditions(value) {
    _termsAndConditions.value = value;
  }

  final _validEmailLoginId = "".obs;

  get validEmailLoginId => _validEmailLoginId.value;

  set validEmailLoginId(value) {
    _validEmailLoginId.value = value;
  }

  final _loginLoading = false.obs;

  get loginLoading => _loginLoading.value;

  set loginLoading(value) {
    _loginLoading.value = value;
  }

  final _registerLoading = false.obs;

  get registerLoading => _registerLoading.value;

  set registerLoading(value) {
    _registerLoading.value = value;
  }

  final _updateTokenLoading = false.obs;

  get updateTokenLoading => _updateTokenLoading.value;

  set updateTokenLoading(value) {
    _updateTokenLoading.value = value;
  }

  final _updatePasswordLoading = false.obs;

  get updatePasswordLoading => _updatePasswordLoading.value;

  set updatePasswordLoading(value) {
    _updatePasswordLoading.value = value;
  }

  final _emailValidateLoading = false.obs;

  get emailValidateLoading => _emailValidateLoading.value;

  set emailValidateLoading(value) {
    _emailValidateLoading.value = value;
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

  storeLocalDevice({required Map body}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    body.forEach((key, value) {
      debugPrint('index=$key, value=$value');
      preferences.setString(key, value);
    });
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

  currentPasswordCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var currentpassword = pref.getString('current_password');
    if (kDebugMode) {
      print("Current password is $currentpassword");
    }
    if (currentpassword != null && currentpassword.isNotEmpty) {
      return currentpassword.toString();
    } else {
      return false;
    }
  }

  loginFieldsEmpty() {
    lEmail.text = "";
    lPassword.text = "";
  }

  registerFieldsEmpty() {
    name.text = "";
    email.text = "";
    mobile.text = "";
    password.text = "";
  }

  updateToken({required userId, required fcmToken}) async {
    updateTokenLoading = true;

    var body = {'token': fcmToken!, 'user_id': userId};
    try {
      var res = await repository.updateToken(body: body);
      if (statusCode == 200) {
        if (res['status'] == "200") {
          updateTokenLoading = false;
          commonPrint(status: res['status'], msg: res['message']);
        } else if (res['status'] == "422") {
          updateTokenLoading = false;
          commonPrint(status: res['status'], msg: "${res['message']}");
          errorAlert(
            Get.context!,
            content: "${res['message']}",
            confirmButtonPressed: () {
              Get.back();
            },
          );
        }
      } else {
        updateTokenLoading = false;
        commonPrint(status: "500", msg: "Error from server or No Internet");
      }
    } catch (e) {
      updateTokenLoading = false;
      commonPrint(
          status: "$statusCode",
          msg: "Error from update Token due to data mismatch or format $e");
    }
  }

  login() async {
    loginLoading = true;
    var fcmToken = await FirebaseMessaging.instance.getToken();

    var body = {
      "username": lEmail.text.trimRight(),
      "password": lPassword.text,
      "action": "login"
    };
    try {
      var res = await repository.login(body: body);
      if (statusCode == 200) {
        if (res['status'] == "200") {
          loginLoading = false;
          commonPrint(status: res['status'], msg: res['message']);
          Map storedData = {
            "token": "${res['user_id']}",
            "fcmToken": fcmToken,
            "current_password": lPassword.text
          };
          updateToken(userId: res['user_id'], fcmToken: fcmToken);
          storeLocalDevice(body: storedData);
          Get.off(() => const HomeMain());
          commonSnackBar(title: "Success", msg: "Logged In Successfully");
          loginFieldsEmpty();
        } else if (res['status'] == "422") {
          loginLoading = false;
          commonPrint(
              status: res['status'],
              msg: "${res['message']}\nEmail or Password Wrong");
          errorAlert(Get.context!,
              content: "${res['message']}\nEmail or Password Wrong",
              confirmButtonPressed: () {
            Get.back();
          });
        }
      } else {
        loginLoading = false;
        commonPrint(status: "500", msg: "Error from server or No Internet");
      }
    } catch (e) {
      loginLoading = false;
      commonPrint(
          status: "$statusCode",
          msg: "Error from login due to data mismatch or format $e");
    }
  }

  register(
      {isGoogleLogin = false,
      gName,
      gEmail,
      gMobile,
      gPassword,
      isAppleSignIn = false}) async {
    registerLoading = true;
    Map<String, String> body = {};
    var fcmToken = await FirebaseMessaging.instance.getToken();
    if (isGoogleLogin == true) {
      body = {
        "name": gName,
        "email": gEmail,
        "fcm_token": fcmToken!,
        "mobile": gMobile ?? "",
        "password": gPassword,
      };
    } else if (isAppleSignIn == true) {
      body = {
        "name": gName,
        "email": gEmail,
        "fcm_token": fcmToken!,
        "mobile": gMobile ?? "",
        "password": gPassword,
      };
    } else {
      body = {
        "name": name.text,
        "email": email.text.trimRight(),
        "fcm_token": fcmToken!,
        "mobile": mobile.text,
        "password": password.text,
      };
    }
    if (kDebugMode) {
      print("Passing body: $body");
    }

    try {
      var res = await repository.register(body: body);
      if (statusCode == 200) {
        if (res['status'] == "200") {
          if (res['message'] == "Duplicated") {
            registerLoading = false;
            commonPrint(status: res['status'], msg: res['message']);
            errorAlert(Get.context!,
                content: "${res['message']}\nEmail already exist",
                confirmButtonPressed: () {
              Get.back();
            });
          } else {
            registerLoading = false;
            commonPrint(status: res['status'], msg: res['message']);
            debugPrint("fcm token is $fcmToken");
            Map storedData = {
              "token": "${res['user_id']}",
              "fcm_token": fcmToken
            };
            storeLocalDevice(body: storedData);
            Get.off(() => const HomeMain());
            commonSnackBar(title: "Success", msg: "Register Successfully");
            registerFieldsEmpty();
          }

          if (res['message'] == "Duplicated") {
            registerLoading = false;
            commonPrint(status: res['status'], msg: res['message']);
            // errorAlert(Get.context!,
            //     content: "${res['message']}\nEmail already exist",
            //     confirmButtonPressed: () {
            //   Get.back();
            // });
            commonSnackBar(
                title: "Email already exists", msg: "${res['message']}");
          } else {
            registerLoading = false;
            commonPrint(status: res['status'], msg: res['message']);
            Map storedData = {"token": "${res['user_id']}"};
            storeLocalDevice(body: storedData);
            Get.off(() => const HomeMain());
            commonSnackBar(title: "Success", msg: "Registered Successfully");
            registerFieldsEmpty();
          }
        } else if (res['status'] == "422") {
          registerLoading = false;
          commonPrint(status: res['status'], msg: "All fields are required");
          commonSnackBar(title: res['status'], msg: "All fields are required");
          // errorAlert(Get.context!, content: "All fields are required",
          //     confirmButtonPressed: () {
          //   Get.back();
          // });
        }
      } else {
        registerLoading = false;
        commonSnackBar(
            title: "Error 500", msg: "Error from server or No Internet");
        commonPrint(status: "500", msg: "Error from server or No Internet");
      }
    } catch (e) {
      registerLoading = false;
      commonPrint(
          status: "$statusCode",
          msg: "Error from register due to data mismatch or format $e");
      commonSnackBar(
          title: "$statusCode",
          msg: "Error from register due to data mismatch or format $e");
    }
  }

  validateEmailForForgotPassword() async {
    emailValidateLoading = true;
    var body = {
      "email": vEmail.text.trimRight(),
    };
    try {
      var res = await repository.validateEmailForForgotPassword(body: body);
      if (statusCode == 200) {
        if (res['status'] == "200") {
          emailValidateLoading = false;
          validEmailLoginId = res['login_id'];
          commonPrint(status: res['status'], msg: res['message']);
          Get.to(() => const ChangePassword());
          commonSnackBar(
              title: 'Email verification success', msg: '${res['message']}');
        } else if (res['status'] == "422") {
          emailValidateLoading = false;
          commonPrint(status: res['status'], msg: "${res['message']}");
          nothingSnackBar(msg: "${res['message']} or Wrong email");
        }
      } else {
        emailValidateLoading = false;
        commonPrint(
            status: "500",
            msg: "Error from server or No Internet on validateEmail");
      }
    } catch (e) {
      emailValidateLoading = false;
      commonPrint(
          status: "$statusCode",
          msg: "Error from validateEmail due to data mismatch or format $e");
    }
  }

  updatePassword() async {
    updatePasswordLoading = true;
    var body = {
      "password": newPassword.text,
      "login_id": validEmailLoginId == "" ? "1090" : validEmailLoginId
    };
    try {
      var res = await repository.updatePassword(body: body);
      if (statusCode == 200) {
        if (res['status'] == "200") {
          if (res['token'] == null) {
            updatePasswordLoading = false;
            commonPrint(
                status: res['status'], msg: "${res['message']} but no data");
          } else {
            updatePasswordLoading = false;
            commonPrint(
                status: res['status'],
                msg:
                    "${res['message']} with data or patient id: ${res['token']}");
            Get.off(() => const Initial());
            nothingSnackBar(msg: "${res['message']}");
          }
        } else if (res['status'] == "422") {
          updatePasswordLoading = false;
          commonPrint(
              status: res['status'], msg: "${res['message']} on password");
          nothingSnackBar(msg: "Password update error please try again later");
        }
      } else {
        updatePasswordLoading = false;
        commonPrint(
            status: "500",
            msg: "Error from server or No Internet on updatePassword");
      }
    } catch (e) {
      updatePasswordLoading = false;
      commonPrint(
          status: "$statusCode",
          msg: "Error from updatePassword due to data mismatch or format $e");
    }
  }

  checkIsUpdateAvailable() async {
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetch();
    await remoteConfig.fetchAndActivate();
    final info = await PackageInfo.fromPlatform();

    // get local app version and change to int
    var lv = info.version;
    var split = lv.replaceAll(".", "");
    var localVersion = int.parse(split);
    debugPrint("local version $lv");
    debugPrint("convert local version $localVersion");

    // get remote app version and change to int
    var rv = remoteConfig.getString('app');
    if (kDebugMode) {
      print("rc is $rv");
    }
    var rSplit = rv.replaceAll(".", "");
    var remoteVersion = int.parse(rSplit);
    debugPrint("remote version $rv");
    debugPrint("convert remote version $remoteVersion");

    if (remoteVersion > localVersion) {
      debugPrint("update available");
      if (Platform.isAndroid || Platform.isIOS) {
        final appId = Platform.isAndroid
            ? 'com.limorg.OxfordMindCare'
            : 'YOUR_IOS_APP_ID';
        final url = Uri.parse(
          Platform.isAndroid
              ? "https://play.google.com/store/apps/details?id=$appId"
              : "https://apps.apple.com/app/id$appId",
        );

        commonAlertDialog(Get.context!,
            content: "Update required for \nOxfordPsych App",
            confirmButtonPressed: () {
          launchUrl(
            url,
            mode: LaunchMode.externalApplication,
          );
        });
      }
    } else {
      debugPrint("update not available");
    }
  }

  checkPasswordChange() async {
    if (currentPassword.text == lPassword.text) {
      if (newPassword.text == newConfirmPassword.text) {
        //Password change API
        if (kDebugMode) {
          print("Current password matched");
        }
      } else {
        if (kDebugMode) {
          print("New password doesn't match confirm password");
        }
      }
    } else {
      if (kDebugMode) {
        print("Current password is wrong");
      }
    }
  }

  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    var fcmToken = preferences.getString('fcm_token');
    debugPrint("token $token");
    if (token != null && token.isNotEmpty) {
      preferences.remove('token');
      // ProfileController.to.profileDetails = {};
      Get.off(() => const Initial());
      if (fcmToken != null && fcmToken.isNotEmpty) {
        preferences.remove('fcm_token');
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  final _isAlreadyGoogleLogin = false.obs;

  get isAlreadyGoogleLogin => _isAlreadyGoogleLogin.value;

  set isAlreadyGoogleLogin(value) {
    _isAlreadyGoogleLogin.value = value;
  }

  googleSignIn({context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (await googleSignIn.isSignedIn()) {
      isAlreadyGoogleLogin = true;
      commonSnackBar(title: "Already registered", msg: "Please Login");
    } else {
      isAlreadyGoogleLogin = false;
    }
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
        if (user != null) {
          register(
              isGoogleLogin: true,
              gName: user.displayName,
              gEmail: user.email,
              gMobile: user.phoneNumber,
              gPassword: user.uid);
        }

        commonPrint(
            status: "200",
            msg:
                "google sign in success:\n ${user!.email}\n${user.phoneNumber}\n${user.displayName}\n${user.photoURL}\n${user.uid}");
      } catch (e) {
        switch (e) {
          case "ERROR_INVALID_CREDENTIAL":
            commonPrint(status: "500", msg: "Invalid Credentials");
            break;
          case "ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL":
            commonPrint(status: "500", msg: "Exits with different credentials");
            break;
          case "ERROR_OPERATION_NOT_ALLOWED":
            commonPrint(
                status: "500",
                msg: "Signing in with Email and Password is not enabled");
            break;
          default:
            commonPrint(status: "500", msg: "An undefined Error happened");
        }
      }
    } else {
      commonPrint(status: "501", msg: "Google signing account null ");
    }

    return user;
  }

  appleLogin() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    commonPrint(status: "Apple ID", msg: "${credential.givenName}");

    if (credential.email != null) {
      register(
          isAppleSignIn: true,
          gName: credential.givenName,
          gEmail: credential.email,
          gMobile: "",
          gPassword: getRandomString(8));
    } else {
      commonAlertDialog(Get.context!,
          content:
              "Already Apple ID is logged in. Go to Settings > Apple ID,iCloud,iTunes & App Store > Password & Security > Apps Using Your Apple ID, tap on CASC Courses and tap Stop Using Apple ID. Contact support to get password",
          confirmButtonPressed: () {
        Get.back();
      });
      // commonSnackBar(title: "Apple Login Failed", msg: "Already Apple ID is logged in. Go to Settings > Apple ID,iCloud,iTunes & App Store > Password & Security > Apps Using Your Apple ID, tap on CASC Courses and tap Stop Using Apple ID");
    }
    // final oauthCredential = OAuthProvider("apple.com").credential(
    //     idToken: credential.identityToken,
    //     accessToken: credential.authorizationCode);
    //
    // // Sign in the user with Firebase. If the nonce we generated earlier does
    // // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    // final user = await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }
}
