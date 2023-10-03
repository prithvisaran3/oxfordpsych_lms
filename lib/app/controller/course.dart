import 'package:deviraj_lms/app/data/repository/course.dart';
import 'package:deviraj_lms/app/data/repository/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/widgets/common/common_print.dart';
import 'main.dart';

class CourseController extends GetxController {
  static CourseController get to => Get.put(CourseController());

  final repository = CourseRepository();
  final TextEditingController searchController = TextEditingController();

  final _getCourseLoading = false.obs;

  get getCourseLoading => _getCourseLoading.value;

  set getCourseLoading(value) {
    _getCourseLoading.value = value;
  }

  final _getSearchLoading = false.obs;

  get getSearchLoading => _getSearchLoading.value;

  set getSearchLoading(value) {
    _getSearchLoading.value = value;
  }

  final _courseDetails = <dynamic>[].obs;

  get courseDetails => _courseDetails.value;

  set courseDetails(value) {
    _courseDetails.value = value;
  }

  final _initialCourseDetails = <dynamic>[].obs;

  get initialCourseDetails => _initialCourseDetails.value;

  set initialCourseDetails(value) {
    _initialCourseDetails.value = value;
  }

  final _getCourseParams = "".obs;

  get getCourseParams => _getCourseParams.value;

  set getCourseParams(value) {
    _getCourseParams.value = value;
  }

  final _perPage = 10.obs;

  get perPage => _perPage.value;

  set perPage(value) {
    _perPage.value = value;
  }

  final _pageNumber = 0.obs;

  get pageNumber => _pageNumber.value;

  set pageNumber(value) {
    _pageNumber.value = value;
  }

  final _isCourseEmpty = false.obs;

  get isCourseEmpty => _isCourseEmpty.value;

  set isCourseEmpty(value) {
    _isCourseEmpty.value = value;
  }

  final _searchCourseDetails = <dynamic>[].obs;

  get searchCourseDetails => _searchCourseDetails.value;

  set searchCourseDetails(value) {
    _searchCourseDetails.value = value;
  }

  final _searchNotFound = false.obs;

  get searchNotFound => _searchNotFound.value;

  set searchNotFound(value) {
    _searchNotFound.value = value;
  }

  final _isLastPageForProduct = false.obs;

  get isLastPageForProduct => _isLastPageForProduct.value;

  set isLastPageForProduct(value) {
    _isLastPageForProduct.value = value;
  }

  final PagingController<int, dynamic> pagingController =
      PagingController(firstPageKey: 0);

  getCourse({curriculumId, isInitial, search, pageKey, limit}) async {
    // getCourseLoading = true;
    pageNumber++;
    getSearchLoading = true;
    if (curriculumId != null) {
      if (isInitial == true) {
        getCourseParams = "&pageID=$pageNumber&limit=5&cid=$curriculumId";
      } else {
        getCourseParams =
            "&pageID=$pageNumber&limit=$perPage&cid=$curriculumId";
      }
    } else {
      if (search != null) {
        getCourseParams = "&search=$search";
      } else {
        if (limit != null) {
          getCourseParams = "&pageID=$pageNumber&limit=50";
        } else {
          getCourseParams = "&pageID=$pageNumber&limit=$perPage";
        }
      }
    }
    try {
      var res = await repository.getCourses(params: getCourseParams);
      if (statusCode == 200) {
        searchNotFound = false;
        getSearchLoading = false;
        if (res["status"] == "200") {
          if (res["data"] == null || res["data"].isEmpty) {
            commonPrint(status: res["status"], msg: "No data or id wrong");
            getCourseLoading = false;
            searchNotFound = true;
          } else {
            searchNotFound = false;
            if (search != null) {
              searchCourseDetails = res['data'];
            } else {
              searchCourseDetails = [];
            }

            if (isInitial == true) {
              getCourseLoading = false;
              isCourseEmpty = false;
              if (res["data"] == null || res["data"].isEmpty) {
                isCourseEmpty = true;
              } else {
                isMyCourseEmpty = false;
                initialCourseDetails = res['data'];
              }
            }
            if (isInitial == false) {
              getCourseLoading = false;
              isCourseEmpty = false;
              courseDetails = res["data"];
              isLastPageForProduct = res['data'].length < perPage;
              if (isLastPageForProduct) {
                pagingController.appendLastPage(res['data']);
                pagingController.notifyListeners();
                update();
              } else {
                final nextPageKey = pageKey + res['data'].length;
                pagingController.appendPage(res['data'], nextPageKey);
                pagingController.notifyListeners();
                update();
              }
            }
            commonPrint(
                status: res["status"],
                msg: "Course get successfully with data : ${res["data"]}");
          }
        } else {
          getCourseLoading = false;
          commonPrint(status: "${res["status"]}", msg: "UnProcessable Data");
        }
      } else {
        commonPrint(
            status: "${res["status"]}",
            msg: "Error from server on get curriculum");
        getCourseLoading = false;
        getSearchLoading = false;
      }
    } catch (e) {
      commonPrint(status: "500", msg: "Course get error due to $e");
      getCourseLoading = false;
      getSearchLoading = false;
    }
  }

  final _getMyCourseLoading = false.obs;

  get getMyCourseLoading => _getMyCourseLoading.value;

  set getMyCourseLoading(value) {
    _getMyCourseLoading.value = value;
  }

  final _myCourseDetails = <dynamic>[].obs;

  get myCourseDetails => _myCourseDetails.value;

  set myCourseDetails(value) {
    _myCourseDetails.value = value;
  }

  final _isMyCourseEmpty = false.obs;

  get isMyCourseEmpty => _isMyCourseEmpty.value;

  set isMyCourseEmpty(value) {
    _isMyCourseEmpty.value = value;
  }

  getMyCourses() async {
    getMyCourseLoading = true;
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var userId = pref.getString('token');
    var params = "&user=$userId";
    try {
      var res = await repository.getMyCourse(params: params);
      if (statusCode == 200) {
        getMyCourseLoading = false;
        if (res['status'] == "200") {
          if (res['data'] == null || res['data'].isEmpty) {
            commonPrint(
                status: "Failed", msg: "Successfully get courses without data");
            isMyCourseEmpty = true;
          } else {
            isMyCourseEmpty = false;
            myCourseDetails = res['data'];
            commonPrint(
                status: "Failed", msg: "Successfully get courses with data");
          }
        } else {
          commonPrint(status: "failed", msg: "Get my course failed");
        }
      } else {
        getMyCourseLoading = false;
        commonPrint(status: "422", msg: "Get my course failed");
      }
    } catch (e) {
      getMyCourseLoading = false;
      commonPrint(status: "500", msg: "Error on get my courses$e");
    }
  }
}
