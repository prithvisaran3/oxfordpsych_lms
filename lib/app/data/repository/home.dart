import 'dart:convert';

import 'package:deviraj_lms/app/service/api.dart';
import 'package:deviraj_lms/app/service/http_service.dart';

class HomeRepository {
  final HttpHelper helper = HttpHelper();

  Future<dynamic> getCategory() async {
    var response = await helper.get(url: ApiService.getCategory);
    var res = jsonDecode(response);
    return res;
  }

  Future<dynamic> getCurriculum() async {
    var response = await helper.get(url: ApiService.getCurriculum);
    var res = jsonDecode(response);
    return res;
  }

  Future<dynamic> getLanguage() async {
    var response = await helper.get(url: ApiService.getLanguage);
    var res = jsonDecode(response);
    return res;
  }

  Future<dynamic> getTopic({params}) async {
    var response = await helper.get(url: "${ApiService.getTopic}$params");
    var res = jsonDecode(response);
    return res;
  }
}
