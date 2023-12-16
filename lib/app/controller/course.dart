import 'package:deviraj_lms/app/data/repository/course.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/widgets/common/alert.dart';
import '../ui/widgets/common/common_print.dart';
import '../ui/widgets/common/common_snackbar.dart';
import 'main.dart';

class CourseController extends GetxController {
  static CourseController get to => Get.put(CourseController());

  final repository = CourseRepository();
  final TextEditingController searchController = TextEditingController();

  final _courseLoading = false.obs;

  get courseLoading => _courseLoading.value;

  set courseLoading(value) {
    _courseLoading.value = value;
  }

  final _getMyCourseLoading = false.obs;

  get getMyCourseLoading => _getMyCourseLoading.value;

  set getMyCourseLoading(value) {
    _getMyCourseLoading.value = value;
  }

  final _isMyCourse = false.obs;

  get isMyCourse => _isMyCourse.value;

  set isMyCourse(value) {
    _isMyCourse.value = value;
  }

  final _courseDetails = <dynamic>[].obs;

  get courseDetails => _courseDetails.value;

  set courseDetails(value) {
    _courseDetails.value = value;
  }

  final _categoryCourseDetails = <dynamic>[].obs;

  get categoryCourseDetails => _categoryCourseDetails.value;

  set categoryCourseDetails(value) {
    _categoryCourseDetails.value = value;
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

  final _courseDuration = "".obs;

  get courseDuration => _courseDuration.value;

  set courseDuration(value) {
    _courseDuration.value = value;
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

  final _categoryCoursePageNumber = 1.obs;

  get categoryCoursePageNumber => _categoryCoursePageNumber.value;

  set categoryCoursePageNumber(value) {
    _categoryCoursePageNumber.value = value;
  }

  final _isLastPageForCategoryCourse = false.obs;

  get isLastPageForCategoryCourse => _isLastPageForCategoryCourse.value;

  set isLastPageForCategoryCourse(value) {
    _isLastPageForCategoryCourse.value = value;
  }

  final _getCourseDuration = "".obs;

  get getCourseDuration => _getCourseDuration.value;

  set getCourseDuration(value) {
    _getCourseDuration.value = value;
  }

  final PagingController<int, dynamic> pagingController =
      PagingController(firstPageKey: 0);

  getCourse(
      {curriculumId,
      isInitial,
      search,
      pageKey,
      limit,
      isCategory = false,
      isSeeAll = false}) async {
    // courseLoading = true;
    if (isSeeAll == true) {
    } else {
      // courseLoading = true;
    }

    pageNumber++;
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
        courseLoading = false;
        if (res["status"] == "200") {
          if (res["data"] == null || res["data"].isEmpty) {
            commonPrint(status: res["status"], msg: "No data for getCourse");
            courseLoading = false;
            searchNotFound = true;
          } else {
            searchNotFound = false;
            if (search != null) {
              searchCourseDetails = res['data'];
            } else {
              searchCourseDetails = [];
            }

            if (isInitial == true) {
              courseLoading = false;
              isCourseEmpty = false;
              if (res["data"] == null || res["data"].isEmpty) {
                isCourseEmpty = true;
              } else {
                isMyCourseEmpty = false;
                initialCourseDetails = res['data'];
              }
            }
            if (isInitial == false) {
              courseLoading = false;
              isCourseEmpty = false;
              courseDetails = res["data"];
              if (isCategory == true) {
                categoryCourseDetails = res["data"];
              }
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
          courseLoading = false;
          commonPrint(status: "${res["status"]}", msg: "UnProcessable Data");
        }
      } else {
        commonPrint(
            status: "${res["status"]}",
            msg: "Error from server on get curriculum");
        courseLoading = false;
      }
    } catch (e) {
      commonPrint(status: "500", msg: "Course get error due to $e");
      courseLoading = false;
      courseLoading = false;
    }
  }

  getCategoryCourse({
    curriculumId,
  }) async {
    // categoryCoursePageNumber++;
    courseLoading = true;
    var params =
        "&pageID=$categoryCoursePageNumber&limit=$perPage&cid=$curriculumId";
    try {
      var res = await repository.getCourses(params: params);
      if (statusCode == 200) {
        courseLoading = false;
        if (res["status"] == "200") {
          if (res["data"] == null || res["data"].isEmpty) {
            commonPrint(
                status: res["status"], msg: "No data for getCategoryCourse");
            courseLoading = false;
          } else {
            isLastPageForCategoryCourse = res['data'].length < perPage;
            categoryCourseDetails = res["data"];
            commonPrint(
                status: res["status"],
                msg:
                    "CategoryCourse get successfully with data : ${res["data"]}");
          }
        } else {
          courseLoading = false;
          commonPrint(status: "${res["status"]}", msg: "UnProcessable Data");
        }
      } else {
        commonPrint(
            status: "${res["status"]}",
            msg: "Error from server on  getCategoryCourse");
        courseLoading = false;
      }
    } catch (e) {
      commonPrint(status: "500", msg: "CategoryCourse get error due to $e");
      courseLoading = false;
    }
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

  sendDuration({duration, id}) async {
    courseLoading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    var body = {
      "course": id,
      "user": token,
      "progress": duration,
    };
    try {
      var res = await repository.sendDuration(body: body);
      if (statusCode == 200) {
        if (res['status'] == "200") {
          courseLoading = false;
          commonPrint(status: res['status'], msg: res['message']);
        } else if (res['status'] == "422") {
          courseLoading = false;
          commonPrint(status: res['status'], msg: "${res['message']}");
        }
      } else {
        courseLoading = false;
        commonPrint(status: "500", msg: "Error from server or No Internet");
      }
    } catch (e) {
      courseLoading = false;
      commonPrint(
          status: "$statusCode",
          msg: "Error from send duration due to data mismatch or format $e");
    }
  }
}
