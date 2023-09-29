import 'package:deviraj_lms/app/data/repository/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/profileRes.dart';
import '../ui/widgets/common/alert.dart';
import '../ui/widgets/common/common_print.dart';
import '../ui/widgets/common/common_snackbar.dart';
import 'auth.dart';
import 'main.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.put(ProfileController());
  final repository = ProfileRepository();

  final TextEditingController profileName = TextEditingController();

  var _isPushNotification = true.obs;

  get isPushNotification => _isPushNotification.value;

  set isPushNotification(value) {
    _isPushNotification.value = value;
  }

  var _isSubscriptionNotification = true.obs;

  get isSubscriptionNotification => _isSubscriptionNotification.value;

  set isSubscriptionNotification(value) {
    _isSubscriptionNotification.value = value;
  }

  var _isSpecialOffersNotification = true.obs;

  get isSpecialOffersNotification => _isSpecialOffersNotification.value;

  set isSpecialOffersNotification(value) {
    _isSpecialOffersNotification.value = value;
  }

  var _isEmailNotification = true.obs;

  get isEmailNotification => _isEmailNotification.value;

  set isEmailNotification(value) {
    _isEmailNotification.value = value;
  }

  final _getProfileLoading = false.obs;

  get getProfileLoading => _getProfileLoading.value;

  set getProfileLoading(value) {
    _getProfileLoading.value = value;
  }

  final _updateProfileLoading = false.obs;

  get updateProfileLoading => _updateProfileLoading.value;

  set updateProfileLoading(value) {
    _updateProfileLoading.value = value;
  }
  final _profileDetails=Data().obs;

  get profileDetails => _profileDetails.value;

  set profileDetails(value) {
    _profileDetails.value = value;
  }

  getProfile() async {
    getProfileLoading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getString('token');
    print("user id is: $id");
    try {
      var res = await repository.getProfile(id: id);
      if (statusCode == 200) {
        if (res.status == "200") {
          getProfileLoading = false;
          if (res.data == null || res.data == "") {
            commonPrint(status: res.status, msg: "No data or id wrong");
          } else {
            profileDetails = res.data;
            // print("PROFILE DATA: ${res.data}");
            commonPrint(
                status: res.status,
                msg: "Profile get successfully with data : ${res.data}");
            Map storedData = {
              "name": "${res.data!.name}",
              "email": "${res.data!.email}",
              "mobile": "${res.data!.mobile}",
            };
            AuthController.to.storeLocalDevice(body: storedData);
          }
        } else {
          getProfileLoading = false;
          commonPrint(status: "${res.status}", msg: "UnProcessable Data");
        }
      } else {
        commonPrint(
            status: "${res.status}",
            msg: "Error from server on get profile");
        getProfileLoading = false;
      }
    } catch (e) {
      commonPrint(
          status: "500", msg: "Profile get error due to wrong credentials");
      getProfileLoading = false;
    }
  }

  updateProfile() async {
    updateProfileLoading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getString('token');
    var body = {
      "name": AuthController.to.name.text,
      "mobile": AuthController.to.mobile.text,
    };
    try {
      var res = await repository.updateProfile(id: id, body: body);
      if (statusCode == 200) {
        if (res['status'] == "200") {
          updateProfileLoading = false;
          commonPrint(status: res['status'], msg: res['message']);
          commonSnackBar(title: "Success", msg: "Update Successful");
          getProfile();
        } else if (res['status'] == "422") {
          updateProfileLoading = false;
          commonPrint(status: res['status'], msg: "All fields are required");
          errorAlert(Get.context!, content: "All fields are required",
              confirmButtonPressed: () {
            Get.back();
          });
        }
      } else {
        updateProfileLoading = false;
        commonPrint(status: "500", msg: "Error from server or No Internet");
      }
    } catch (e) {
      updateProfileLoading = false;
      commonPrint(
          status: "$statusCode",
          msg: "Error from register due to data mismatch or format $e");
    }
  }
}
