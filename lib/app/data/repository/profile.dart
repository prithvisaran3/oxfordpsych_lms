import 'dart:convert';

import '../../service/api.dart';
import '../../service/http_service.dart';
import '../model/profileRes.dart';

class ProfileRepository {
  final HttpHelper helper = HttpHelper();

  Future<ProfileRes> getProfile({required id}) async {
    var response = await helper.get(url: "${ApiService.getProfile}$id");
    var res = ProfileRes.fromMap(jsonDecode(response));
    return res;
  }
  Future<dynamic> updateProfile({required id,required body}) async {
    var response = await helper.post(url: "${ApiService.updateProfile}&user_id=$id",body: body);
    var res = jsonDecode(response);
    return res;
  }
}
