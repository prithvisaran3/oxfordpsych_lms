

import 'package:get/get.dart';

import '../data/repository/home.dart';
import '../ui/widgets/common/common_print.dart';
import 'main.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.put(HomeController());

  final repository = HomeRepository();

  final _getCurriculumLoading = false.obs;

  get getCurriculumLoading => _getCurriculumLoading.value;

  set getCurriculumLoading(value) {
    _getCurriculumLoading.value = value;
  }

  final _getTopicLoading = false.obs;

  get getTopicLoading => _getTopicLoading.value;

  set getTopicLoading(value) {
    _getTopicLoading.value = value;
  }

  final _curriculumDetails = <dynamic>[].obs;

  get curriculumDetails => _curriculumDetails.value;

  set curriculumDetails(value) {
    _curriculumDetails.value = value;
  }

  final _topicDetails = <dynamic>[].obs;

  get topicDetails => _topicDetails.value;

  set topicDetails(value) {
    _topicDetails.value = value;
  }

  final _courseLength = 0.obs;

  get courseLength => _courseLength.value;

  set courseLength(value) {
    _courseLength.value = value;
  }

  final _isFirstLoading = true.obs;

  get isFirstLoading => _isFirstLoading.value;

  set isFirstLoading(value) {
    _isFirstLoading.value = value;
  }

  getCurriculum() async {
    getCurriculumLoading = true;

    try {
      var res = await repository.getCurriculum();
      if (statusCode == 200) {
        isFirstLoading = false;
        if (res['status'] == "200") {
          getCurriculumLoading = false;
          if (res['data'] == null || res['data'] == "") {
            commonPrint(status: res['status'], msg: "No data or id wrong");
            curriculumDetails = [];
          } else {
            curriculumDetails = res['data'];
            // print("PROFILE DATA: ${res["data]}");
            commonPrint(
                status: res['status'],
                msg: "Curriculum get successfully with data : ${res['data']}");
          }
        } else {
          getCurriculumLoading = false;
          commonPrint(status: "${res['status']}", msg: "UnProcessable Data");
        }
      } else {
        isFirstLoading = true;
        commonPrint(
            status: "${res['status']}",
            msg: "Error from server on get curriculum");
        getCurriculumLoading = false;
      }
    } catch (e) {
      isFirstLoading = true;
      commonPrint(status: "500", msg: "Curriculum get error due to $e");
      getCurriculumLoading = false;
    }
  }

  final _getTopicParams = "".obs;

  get getTopicParams => _getTopicParams.value;

  set getTopicParams(value) {
    _getTopicParams.value = value;
  }

  getTopic({cid}) async {
    getTopicLoading = true;
    if (cid != null) {
      getTopicParams = "&cid=$cid";
    } else {
      getTopicParams = "";
    }
    try {
      var res = await repository.getTopic(params: getTopicParams);
      if (statusCode == 200) {
        if (res["status"] == "200") {
          getTopicLoading = false;
          if (res["data"] == null || res["data"] == "") {
            commonPrint(status: res["status"], msg: "No data or id wrong");
          } else {
            topicDetails = res["data"];
            // print("PROFILE DATA: ${res["data]}");
            commonPrint(
                status: res["status"],
                msg: "Get Topic get successfully with data : ${res["data"]}");
          }
        } else {
          getTopicLoading = false;
          commonPrint(status: "${res["status"]}", msg: "UnProcessable Data");
        }
      } else {
        commonPrint(
            status: "${res["status"]}", msg: "Error from server on get topic");
        getTopicLoading = false;
      }
    } catch (e) {
      commonPrint(status: "500", msg: "Get Topic get error due to $e");
      getTopicLoading = false;
    }
  }

}
