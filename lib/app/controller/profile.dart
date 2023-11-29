import 'package:deviraj_lms/app/data/repository/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/profileRes.dart' as profile;
import '../data/model/subscription_detail.dart';
import '../ui/widgets/common/alert.dart';
import '../ui/widgets/common/common_print.dart';
import '../ui/widgets/common/common_snackbar.dart';
import '../utility/utility.dart';
import 'auth.dart';
import 'main.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.put(ProfileController());
  final repository = ProfileRepository();

  final TextEditingController profileName = TextEditingController();
  final TextEditingController deleteEmail = TextEditingController();

  final _isPushNotification = true.obs;

  get isPushNotification => _isPushNotification.value;

  set isPushNotification(value) {
    _isPushNotification.value = value;
  }

  final _isSubscriptionNotification = true.obs;

  get isSubscriptionNotification => _isSubscriptionNotification.value;

  set isSubscriptionNotification(value) {
    _isSubscriptionNotification.value = value;
  }

  final _isSpecialOffersNotification = true.obs;

  get isSpecialOffersNotification => _isSpecialOffersNotification.value;

  set isSpecialOffersNotification(value) {
    _isSpecialOffersNotification.value = value;
  }

  final _isEmailNotification = true.obs;

  get isEmailNotification => _isEmailNotification.value;

  set isEmailNotification(value) {
    _isEmailNotification.value = value;
  }

  final _isDeleteAccount = false.obs;

  get isDeleteAccount => _isDeleteAccount.value;

  set isDeleteAccount(value) {
    _isDeleteAccount.value = value;
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

  final _deleteAccountLoading = false.obs;

  get deleteAccountLoading => _deleteAccountLoading.value;

  set deleteAccountLoading(value) {
    _deleteAccountLoading.value = value;
  }

  final _profileDetails = profile.Data().obs;

  get profileDetails => _profileDetails.value;

  set profileDetails(value) {
    _profileDetails.value = value;
  }

  getProfile() async {
    getProfileLoading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getString('token');
    try {
      var res = await repository.getProfile(id: id);
      if (statusCode == 200) {
        if (res.status == "200") {
          getProfileLoading = false;
          if (res.data == null) {
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
            status: "${res.status}", msg: "Error from server on get profile");
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
          msg: "Error from update profile due to data mismatch or format $e");
    }
  }

  updatePassword() async {
    updateProfileLoading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getString('token');
    var body = {
      "password": AuthController.to.newPassword.text,
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
          msg: "Error from updatePassword due to data mismatch or format $e");
    }
  }

  deleteAccount() async {
    deleteAccountLoading = true;
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // var id = preferences.getString('token');
    var body = {
      // "name": AuthController.to.name.text,
      // "mobile": AuthController.to.mobile.text,
    };
    try {
      var res = await repository.deleteAccount(body: body);
      if (statusCode == 200) {
        if (res['status'] == "200") {
          deleteAccountLoading = false;
          commonPrint(status: res['status'], msg: res['message']);
          Get.back();
          Get.back();
          Get.back();
          commonSnackBar(title: "Delete Account", msg: "${res['message']}");

          ProfileController.to.isDeleteAccount = false;
        } else if (res['status'] == "422") {
          deleteAccountLoading = false;
          commonPrint(status: res['status'], msg: "All fields are required");
          errorAlert(Get.context!, content: "All fields are required",
              confirmButtonPressed: () {
            Get.back();
          });
        }
      } else {
        deleteAccountLoading = false;
        commonPrint(status: "500", msg: "Error from server or No Internet");
      }
    } catch (e) {
      deleteAccountLoading = false;
      commonPrint(
          status: "$statusCode",
          msg: "Error from delete account due to data mismatch or format $e");
    }
  }

  final _subscriptionDetail = Data().obs;

  get subscriptionDetail => _subscriptionDetail.value;

  set subscriptionDetail(value) {
    _subscriptionDetail.value = value;
  }

  final _subscriptionLoading = false.obs;

  get subscriptionLoading => _subscriptionLoading.value;

  set subscriptionLoading(value) {
    _subscriptionLoading.value = value;
  }

  final _isSubscribed = false.obs;

  get isSubscribed => _isSubscribed.value;

  set isSubscribed(value) {
    _isSubscribed.value = value;
  }

  getSubscriptionDetail() async {
    subscriptionLoading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getString('token');
    var params = "&user=$id";
    try {
      var res = await repository.getSubscriptionDetails(params: params);
      if (statusCode == 200) {
        subscriptionLoading = false;
        if (res.status == "200") {
          commonPrint(
            status: "Subscription Details:",
            msg: " ${res.data}",
          );
          if (res.data == null) {
            isSubscribed = false;
            commonPrint(
                status: "200", msg: "get subscription detail without data");
          } else {
            commonPrint(
                status: "200", msg: "get subscription detail with data");
            subscriptionDetail = res.data;
            checkExpiry();

            if (isSubscriptionExpiry == true) {
              isSubscribed = false;
            } else {
              if (subscriptionDetail.packageId == "8" ||
                  int.parse(subscriptionDetail.packageId) > 15) {
                isSubscribed = false;
              } else {
                isSubscribed = true;
              }
            }
          }
        }
      } else {
        subscriptionLoading = false;
        commonPrint(
            status: "Failed", msg: "Failed to get subscription details");
      }
    } catch (e) {
      subscriptionLoading = false;
      commonPrint(
          status: "500", msg: "Error form server on get subscription detail");
    }
  }

  final _isSubscriptionExpiry = false.obs;

  get isSubscriptionExpiry => _isSubscriptionExpiry.value;

  set isSubscriptionExpiry(value) {
    _isSubscriptionExpiry.value = value;
  }

  final _remainingDays = 0.obs;

  get remainingDays => _remainingDays.value;

  set remainingDays(value) {
    _remainingDays.value = value;
  }

  checkExpiry() {
    var year = getIsoToLocalYearMonthDate(
            date: ProfileController.to.subscriptionDetail.validTill.toString())
        .split('-')[0];
    var month = getIsoToLocalYearMonthDate(
            date: ProfileController.to.subscriptionDetail.validTill.toString())
        .split('-')[1];
    var day = getIsoToLocalYearMonthDate(
            date: ProfileController.to.subscriptionDetail.validTill.toString())
        .split('-')[2];

    final expirationDate =
        DateTime(int.parse(year), int.parse(month), int.parse(day));
    final now = DateTime.now();
    remainingDays = now.difference(expirationDate).inDays;
    commonPrint(status: "isExpiry ", msg: "${expirationDate.isBefore(now)}");
    isSubscriptionExpiry = expirationDate.isBefore(now);
  }
}
