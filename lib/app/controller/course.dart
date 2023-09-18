import 'package:deviraj_lms/app/data/repository/course.dart';
import 'package:deviraj_lms/app/data/repository/home.dart';
import 'package:get/get.dart';

import '../ui/widgets/common/common_print.dart';
import 'main.dart';

class CourseController extends GetxController {
  static CourseController get to => Get.put(CourseController());

  final repository = CourseRepository();

  final _getCourseLoading = false.obs;

  get getCourseLoading => _getCourseLoading.value;

  set getCourseLoading(value) {
    _getCourseLoading.value = value;
  }

  final _courseDetails = <dynamic>[].obs;

  get courseDetails => _courseDetails.value;

  set courseDetails(value) {
    _courseDetails.value = value;
  }

  getCourse() async {
    getCourseLoading = true;

    try {
      var res = await repository.getCourses();
      if (statusCode == 200) {
        if (res["status"] == "200") {
          getCourseLoading = false;
          if (res["data"] == null || res["data"] == "") {
            commonPrint(status: res["status"], msg: "No data or id wrong");
          } else {
            courseDetails = res["data"];

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
      }
    } catch (e) {
      commonPrint(status: "500", msg: "Course get error due to $e");
      getCourseLoading = false;
    }
  }
}
