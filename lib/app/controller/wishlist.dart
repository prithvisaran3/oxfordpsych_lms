import 'package:deviraj_lms/app/controller/main.dart';
import 'package:deviraj_lms/app/ui/widgets/common/common_print.dart';
import 'package:deviraj_lms/app/ui/widgets/common/common_snackbar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/repository/wishlist.dart';

class WishListController extends GetxController {
  static WishListController get to => Get.put(WishListController());

  final repository = WishListRepository();

  final _addLoading = false.obs;

  get addLoading => _addLoading.value;

  set addLoading(value) {
    _addLoading.value = value;
  }

  final _isAlreadyAdded = false.obs;

  get isAlreadyAdded => _isAlreadyAdded.value;

  set isAlreadyAdded(value) {
    _isAlreadyAdded.value = value;
  }

  final _getLoading = false.obs;

  get getLoading => _getLoading.value;

  set getLoading(value) {
    _getLoading.value = value;
  }

  final _isWishlistEmpty = false.obs;

  get isWishlistEmpty => _isWishlistEmpty.value;

  set isWishlistEmpty(value) {
    _isWishlistEmpty.value = value;
  }

  final _wishListDetails = <dynamic>[].obs;

  get wishListDetails => _wishListDetails.value;

  set wishListDetails(value) {
    _wishListDetails.value = value;
  }

  addWishList({courseId}) async {
    addLoading = true;
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var userId = pref.getString('token');
    var body = {'course': "$courseId", 'user': "$userId"};

    try {
      var res = await repository.addWishList(body: body);
      if (statusCode == 200) {
        addLoading = false;
        if (res['status'] == "200") {
          isAlreadyAdded = false;
          commonSnackBar(title: "Success", msg: "Added Successfully");
          commonPrint(
              status: "${res['status']}", msg: "Wishlist Added Successfully");
        } else if (res['status'] == "422") {
          isAlreadyAdded = true;
          commonPrint(status: "${res['status']}", msg: "Already added");
          commonSnackBar(title: "Failed", msg: "Already Added");
        } else {
          isAlreadyAdded = false;
          commonPrint(status: "500", msg: "Unexpected error on add wishlist");
        }
      } else {
        addLoading = false;
        commonPrint(status: "Failed", msg: "Add wishlist failed");
        commonSnackBar(title: "Failed", msg: "Failed to wishlist");
      }
    } catch (e) {
      addLoading = false;
      commonSnackBar(title: "500", msg: "Server error please try again");
      commonPrint(status: "500", msg: "Error form server on add wishlist $e");
    }
  }

  getWishList() async {
    getLoading = true;
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var userId = pref.getString('token');
    var params = "&user=$userId";
    try {
      var res = await repository.getWishList(params: params);
      if (statusCode == 200) {
        getLoading = false;
        if (res['status'] == "200") {
          if (res['data'] == null || res['data'].isEmpty) {
            isWishlistEmpty = true;
            commonPrint(
                status: "200", msg: "Successfully get wishlist without data");
          } else {
            isWishlistEmpty = false;
            wishListDetails = res['data'];
            commonPrint(
                status: "200", msg: "Successfully get wishlist with data");
          }
        } else {
          commonPrint(status: "422", msg: "Failed to get get wish list");
        }
      } else {
        getLoading = false;
      }
    } catch (e) {
      getLoading = false;
      commonPrint(status: "500", msg: "Error from server on get wish list $e");
    }
  }
}
