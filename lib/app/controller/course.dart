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

  final _getCourseParams = "".obs;

  get getCourseParams => _getCourseParams.value;

  set getCourseParams(value) {
    _getCourseParams.value = value;
  }

  getCourse() async {
    getCourseLoading = true;
    getCourseParams = "&pageID=1&limit=10";
    try {
      var res = await repository.getCourses(params: getCourseParams);
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

  var _temp = [].obs;

  get temp => _temp.value;

  set temp(value) {
    _temp.value = value;
  }

  addParticularCategoryCourse() {
    temp = [];
    courseDetails.forEach((h){
      print("jkjhlkjk ${h['curriculum'] == "Discussion"}");
    });
    for (int i = 0; i < courseDetails.length; i++) {
      print("${courseDetails[i]['curriculum'] == "Discussion"}");

      // temp.add({
      //   "id": "86",
      //   "title": "",
      //   "description": "",
      //   "curriculum_id": "2",
      //   "price": "299",
      //   "photos": "",
      //   "video": "",
      //   "log_date": "2023-09-28 16:55:45",
      //   "category": "Gold",
      //   "languages": "English",
      //   "curriculum": "CASC Courses",
      //   "topic": "CASC - OCM 2"
      // });
    }
  }
}
