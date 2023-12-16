import '../config/config.dart';

class ApiService {
  // auth
  static const login = AppConfig.baseUrl;
  static const register = "${AppConfig.baseUrl}?action=register";
  static const updateToken = "${AppConfig.baseUrl}?action=updateToken";

  //profile
  static const getProfile = "${AppConfig.baseUrl}?getprofile=";
  static const updateProfile = "${AppConfig.baseUrl}?action=updateprofile";
  static const deleteAccount = "${AppConfig.baseUrl}?action=deleteAccount";

  //forgot password
  static const validateEmail = "${AppConfig.baseUrl}?action=validateEmail";

  //update password
  static const updatePassword = "${AppConfig.baseUrl}?action=updatePassword";

  //home screen
  static const getCategory = "${AppConfig.baseUrl}?action=getcategory";
  static const getCurriculum = "${AppConfig.baseUrl}?action=getcurriculum";
  static const getLanguage = "${AppConfig.baseUrl}?action=getlanguage";
  static const getTopic = "${AppConfig.baseUrl}?action=getTopic";
  static const getCourses = "${AppConfig.baseUrl}?action=getcourses";

  //wishlist
  static const addWishList = "${AppConfig.baseUrl}?action=whishlistAdd";
  static const getWishList = "${AppConfig.baseUrl}?action=whishlisted";

  //get subscription details
  static const subscriptionDetail = "${AppConfig.baseUrl}?action=myPayments";

  //get myCourse
  static const getMyCourse = "${AppConfig.baseUrl}?action=viewedCourses";
  static const sendDuration = "${AppConfig.baseUrl}?action=courseView";
}
