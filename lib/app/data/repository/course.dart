import 'dart:convert';

import 'package:deviraj_lms/app/service/api.dart';
import 'package:deviraj_lms/app/service/http_service.dart';

class CourseRepository {
  final HttpHelper helper = HttpHelper();

  Future<dynamic> getCourses() async {
    var response = await helper.get(url: "${ApiService.getCourses}");
    var res = jsonDecode(response);
    return res;
  }
}
