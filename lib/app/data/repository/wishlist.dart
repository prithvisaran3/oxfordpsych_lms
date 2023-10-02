import 'dart:convert';
import '../../service/api.dart';
import '../../service/http_service.dart';

class WishListRepository {
  final HttpHelper helper = HttpHelper();

  Future<dynamic> addWishList({body}) async {
    var response = await helper.post(url: ApiService.addWishList, body: body);
    var res = jsonDecode(response);
    return res;
  }

  Future<dynamic> getWishList({params}) async {
    var response = await helper.get(url: "${ApiService.getWishList}$params");
    var res = jsonDecode(response);
    return res;
  }
}
