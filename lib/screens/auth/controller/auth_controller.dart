import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app_master/core/network_helper/app_url.dart';
import 'package:travel_app_master/core/network_helper/network_helper.dart';
import 'package:travel_app_master/screens/auth/models/login_model.dart';
import 'package:travel_app_master/screens/auth/models/register_model.dart';
import 'package:travel_app_master/screens/navigation.dart';

class AuthController extends GetxController {
  NetworkHelper networkHelper = Get.put(NetworkHelper());

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController dobdayController = TextEditingController();
  TextEditingController dobmonthController = TextEditingController();
  TextEditingController dobyearController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  var items = ["Male", "Female", "Other"];

  List<String> preferlist = [];

  bool istap = false;
  final formKey = GlobalKey<FormState>();

  String imagepath = "";
  bool location = false;

  var isLoading = false.obs;

  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  RegisterModel userDetails = RegisterModel();
  LoginModel loginDetails = LoginModel();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void changeLoading(value) {
    isLoading.value = value;
    update();
  }

  // .................... Register (Post req) ...................
  Future<void> register() async {
    changeLoading(true);
    Uri url = Uri.parse(AppUrl.registration);

    Map<String, String> data = {
      "name": nameController.text,
      "email": emailController.text,
      "mobile_number": phoneController.text,
      "password": passwordController.text,
      "gender": genderController.text,
      "city": cityController.text,
      "prefer": preferlist.toString(),
      "location": latitude.toString() + "," + longitude.toString(),
    };

    var request = json.encode(data);

    try {
      var request = http.MultipartRequest('POST', url)
        ..headers.addAll(NetworkHelper().registerHeader())
        ..fields.addAll(data);

      // request.files
      //     .add(await http.MultipartFile.fromPath('profile_pic', imagepath));

      var response = await request.send();

      var res = await http.Response.fromStream(response);
      var valuee = json.decode(res.body);

      if (response.statusCode == 200) {
        userDetails = RegisterModel.fromJson(valuee);
        networkHelper.setUserToken(
            userDetails.token, userDetails.userInfo!.name);

        changeLoading(false);
        Get.snackbar("Success", "Registration Successful");
        Get.offAll(() => const NavigationScreen());
      } else {
        Get.defaultDialog(
          title: "Error Message",
          content: const Text("Error has occured"), //${body["msg"]}
        );
        changeLoading(false);
      }
    } catch (e) {
      print(e);
      changeLoading(false);
    }
  }

  // //Registration
  // Future<void> register() async {
  //   try {
  //     changeLoading(true);
  //     var uri = Uri.parse(AppUrl.registration);

  //     Map<String, String> data = {
  //       // "question": questionController.text,
  //       // "name": nameController.text,
  //       // "country_code": onlyCode,
  //       // "phone": onlyNumber,
  //       // "email": emailController.text,
  //       // "password": passController.text,
  //       // "confirm_password": conPassController.text,
  //     };

  //     //, headers: NetworkHelper().getPostHeaders()
  //     final response = await http.post(uri, body: data, headers: {
  //       "Accept": "application/json",
  //       "Content-Type": "application/x-www-form-urlencoded"
  //     });
  //     var value = json.decode(response.body.toString());
  //     if (response.statusCode == 200) {
  // userDetails = Register.fromJson(value);
  // networkHelper.setUserToken(userDetails.token, userDetails.data!.name);

  // changeLoading(false);
  // Get.snackbar("Success", "Registration Successful");
  // Get.offAll(() => NavigationPage());
  //     } else {
  //       changeLoading(false);
  //       Get.defaultDialog(
  //         title: "Error Message",
  //         content: const Text("Error has occured"),
  //       );
  //     }
  //   } catch (e) {
  //     changeLoading(false);
  //     Get.snackbar("Error", e.toString());
  //     // print("Print Error $e");
  //   }
  // }

  //login
  Future<void> login() async {
    try {
      changeLoading(true);
      var uri = Uri.parse(AppUrl.login);

      Map<String, String> data = {
        "email": emailController.text,
        "password": passwordController.text,
      };

      final response = await http.post(uri, body: data, headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      });
      var value = json.decode(response.body.toString());
      if (response.statusCode == 200) {
        loginDetails = LoginModel.fromJson(value);
        networkHelper.setUserToken(
            loginDetails.token, loginDetails.userImfo!.name);
        networkHelper.getUserToken();

        changeLoading(false);
        Get.snackbar("Success", "Login Successful");
        Get.offAll(() => const NavigationScreen());
      } else {
        changeLoading(false);
        Get.defaultDialog(
          title: "Error Message",
          content: const Text("Error has occured"),
        );
      }
    } catch (e) {
      changeLoading(false);
      Get.snackbar("Error", e.toString());
      // print("Print Error $e");
    }
  }

  //Send OTP
  Future<void> sendOtp() async {
    try {
      changeLoading(true);
      var uri = Uri.parse(AppUrl.forgatePassword);

      Map<String, String> data = {
        "email": emailController.text,
      };

      final response = await http.post(uri,
          body: data, headers: networkHelper.getPostHeaders());

      if (response.statusCode == 200) {
        changeLoading(false);
        Get.snackbar("Success", "Sent OTP Successful");
        // Get.to(() => VarifyOtp());
      } else {
        changeLoading(false);
        Get.defaultDialog(
          title: "Error Message",
          content: const Text("Error has occured"),
        );
      }
    } catch (e) {
      changeLoading(false);
      Get.snackbar("Error", e.toString());
      // print("Print Error $e");
    }
  }

  //Varify OTP
  Future<void> varifyOtp() async {
    try {
      changeLoading(true);
      var uri = Uri.parse(AppUrl.varifyOtp);

      Map<String, String> data = {
        "email": emailController.text,
        // "otp": otpValue.toString(),
      };

      final response = await http.post(uri,
          body: data, headers: networkHelper.getPostHeaders());

      if (response.statusCode == 200) {
        changeLoading(false);
        Get.snackbar("Success", "OTP Varification Successful");
        // Get.to(() => ResetPassword());
      } else {
        changeLoading(false);
        Get.defaultDialog(
          title: "Error Message",
          content: const Text("OTP does not match"),
        );
      }
    } catch (e) {
      changeLoading(false);
      Get.snackbar("Error", e.toString());
      // print("Print Error $e");
    }
  }

  //Reset Password
  Future<void> resetPassword() async {
    try {
      changeLoading(true);
      var uri = Uri.parse(AppUrl.resetPassword);

      Map<String, String> data = {
        // "email": emailController.text,
        // "new_password": passController.text,
        // "confirm_password": conPassController.text,
      };

      final response = await http.post(uri,
          body: data, headers: networkHelper.getPostHeaders());

      if (response.statusCode == 200) {
        changeLoading(false);
        Get.snackbar("Success", "Password Reset Successful");
        // Get.offAll(() => NavigationPage());
      } else {
        changeLoading(false);
        Get.defaultDialog(
          title: "Error Message",
          content: const Text("Error has occured"),
        );
      }
    } catch (e) {
      changeLoading(false);
      Get.snackbar("Error", e.toString());
      // print("Print Error $e");
    }
  }

  // //Sign in with Google
  // Future<UserCredential> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   print("Credential : $credential");

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
}
