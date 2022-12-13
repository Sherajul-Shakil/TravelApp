import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app_master/core/network_helper/app_url.dart';
import 'package:travel_app_master/core/network_helper/network_helper.dart';
import 'package:travel_app_master/screens/home/models/hotel_model.dart';

class HomeController extends GetxController {
  NetworkHelper networkHelper = Get.put(NetworkHelper());
  var isLoading = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController nameControllerUp = TextEditingController();
  TextEditingController phoneControllerUp = TextEditingController();
  TextEditingController emailControllerUp = TextEditingController();

  TextEditingController countryController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

  // final _phoneWithCode = ''.obs;
  // set phoneWithCode(String value) => _phoneWithCode.value = value;
  // String get phoneCode => _phoneWithCode.value;

  TextEditingController searchController = TextEditingController();
  TextEditingController date1 = TextEditingController();
  TextEditingController date2 = TextEditingController();

  var selectedcategory = 0.obs;
  var selectcategory = 0.obs;

  HoltelModel hotelData = HoltelModel();

  RxList<PopularDeal> popularHotelList = <PopularDeal>[].obs;
  RxList<PopularDeal> popularRestaurentList = <PopularDeal>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getHotel();
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

  void changeHotelRes(value) {
    selectcategory.value = value;
    update();
  }

  // void loadController() {
  //   nameControllerUp.text = userDetails.data!.name!;
  //   phoneControllerUp.text = userDetails.data!.phone!;
  //   emailControllerUp.text = userDetails.data!.email!;
  //   phoneWithCode = phoneControllerUp.text;
  //   update();
  // }

  // void countryLoadController() {
  //   countryController.text = userDetails.data!.country!;
  //   languageController.text = userDetails.data!.language!;
  //   currencyController.text = userDetails.data!.currency!;
  //   update();
  // }

  // .................... My Offer ...................

  Future<HoltelModel> getHotel() async {
    changeLoading(true);
    var uri = Uri.parse(AppUrl.hotel);
    final response =
        await http.get(uri, headers: networkHelper.getPostHeaders());
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      hotelData = HoltelModel.fromJson(data);
      for (var hData in hotelData.data!.popularDeals!) {
        if (hData.type == "hotel") {
          popularHotelList.add(hData);
        } else if (hData.type == "restaurant") {
          popularRestaurentList.add(hData);
        }
      }

      changeLoading(false);
      return hotelData;
    } else {
      changeLoading(false);
      return hotelData;
    }
  }

  // .................... User Details ...................

  // Future<UserDetails> getUserDetails() async {
  //   changeLoading(true);
  //   var uri = Uri.parse(AppUrl.userDetails);
  //   final response =
  //       await http.get(uri, headers: networkHelper.getPostHeaders());
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     userDetails = UserDetails.fromJson(data);
  //     print("My userfffffffffff: ${userDetails}");
  //     changeLoading(false);
  //     return userDetails;
  //   } else {
  //     changeLoading(false);
  //     return userDetails;
  //   }
  // }

  //Update Profile
  Future<void> updateProfile() async {
    try {
      changeLoading(true);
      var uri = Uri.parse(AppUrl.updateProfile);

      Map<String, String> data = {
        // "question": questionController.text,
        "name": nameControllerUp.text,

        "email": emailControllerUp.text,
      };

      //, headers: NetworkHelper().getPostHeaders()
      final response = await http.post(uri,
          body: data, headers: networkHelper.getPostHeaders());
      var value = json.decode(response.body.toString());
      if (response.statusCode == 200) {
        changeLoading(false);
        // getUserDetails();
        Get.snackbar("Success", "Account updated successfully");

        nameControllerUp.clear();
        phoneControllerUp.clear();
        emailControllerUp.clear();
        Get.back();
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

  // //Update Country, Language, Currency
  // Future<void> updateCountry() async {
  //   try {
  //     changeLoading(true);
  //     var uri = Uri.parse(AppUrl.updateCountry);

  //     Map<String, String> data = {
  //       "country": countryController.text,
  //     };

  //     //, headers: NetworkHelper().getPostHeaders()
  //     final response = await http.post(uri,
  //         body: data, headers: networkHelper.getPostHeaders());
  //     var value = json.decode(response.body.toString());
  //     if (response.statusCode == 200) {
  //       changeLoading(false);
  //       getUserDetails();
  //     } else {
  //       changeLoading(false);
  //       print("Error in counter");
  //     }
  //   } catch (e) {
  //     changeLoading(false);
  //     Get.snackbar("Error", e.toString());
  //     // print("Print Error $e");
  //   }
  // }

}
