import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkHelper extends GetxController {
  var userToken = ''.obs;
  var userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getUserToken();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  //Header
  Map<String, String> getMultipartHeaders() {
    Map<String, String> headers = {
      "Accept": "application/json",
      "access-token": userToken.value,
      'Content-Type': 'multipart/form-data',
    };
    return headers;
  }

  Map<String, String> getPostHeaders() {
    Map<String, String> headers = {
      "Accept": "application/json",
      "access-token": userToken.value,
      // 'Content-Type': 'multipart/form-data',
    };
    return headers;
  }

  Map<String, String> registerHeader() {
    Map<String, String> headers = {
      "Accept": "application/json",
      'Content-Type': 'multipart/form-data',
    };
    return headers;
  }

  //Set User Token
  Future<bool> setUserToken(jsonString, userName) async {
    print("Getting token from  reg $jsonString and $userName");
    try {
      if (jsonString != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_token', jsonString.toString());
        await prefs.setString('user_name', userName.toString());

        return true;
      } else {
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", "Error in saving user token");
      return false;
    }
  }

  //Get User Token
  void getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userToken.value = prefs.getString('user_token')!;
    userName.value = prefs.getString('user_name')!;
    print(
        "User Token from shared preffffffffffffffffffffffffffff: ${userToken.value}");
  }
}
