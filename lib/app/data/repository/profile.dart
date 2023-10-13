import 'dart:convert';
import '../../service/api.dart';
import '../../service/http_service.dart';
import '../model/profileRes.dart';
import '../model/subscription_detail.dart';

class ProfileRepository {
  final HttpHelper helper = HttpHelper();

  Future<ProfileRes> getProfile({required id}) async {
    var response = await helper.get(url: "${ApiService.getProfile}$id");
    var res = ProfileRes.fromMap(jsonDecode(response));
    return res;
  }

  Future<dynamic> updateProfile({required id, required body}) async {
    var response = await helper.post(
        url: "${ApiService.updateProfile}&user_id=$id", body: body);
    var res = jsonDecode(response);
    return res;
  }

  Future<dynamic> deleteAccount({ required body}) async {
    var response = await helper.post(
        url: ApiService.deleteAccount,body: body);
    var res = jsonDecode(response);
    return res;
  }

  Future<SubscriptionDetail> getSubscriptionDetails({params}) async {
    var response =
        await helper.get(url: "${ApiService.subscriptionDetail}$params");

    var res = SubscriptionDetail.fromJson(jsonDecode(response));
    return res;
  }
}
