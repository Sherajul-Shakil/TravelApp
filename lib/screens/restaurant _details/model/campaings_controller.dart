import 'dart:convert';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:travel_app_master/core/network_helper/app_url.dart';
import 'package:travel_app_master/core/network_helper/network_helper.dart';
import 'package:travel_app_master/screens/restaurant%20_details/model/campaigns_model.dart';
import 'package:http/http.dart' as http;
class CampaingnsContraller extends GetxController{
  NetworkHelper networkHelper = Get.put(NetworkHelper());
  var isLoading=false.obs;
    CampaignsModel? _campaignsModel;
  @override
  void onInit() {
    fetchCampaignsData();
    super.onInit();
  }

  fetchCampaignsData() async {
    try{
       String apiCamUrl = "https://ddapp.xomartbd.com/api/campaigns";
      isLoading(true);
      http.Response response =await http.get(Uri.parse(apiCamUrl));
      if(response.statusCode==200){
        var result=jsonDecode(response.body);
        _campaignsModel=CampaignsModel.fromJson(result);
       var tkn=  networkHelper.userToken;

      }else{
        //error
        print("Error fetching data");
      }

    }catch(e){
      print("Error getting data: $e");

    }finally{
      isLoading(false);
    }
  }
}