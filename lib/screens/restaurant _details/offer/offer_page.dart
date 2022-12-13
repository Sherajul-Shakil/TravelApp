import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app_master/core/network_helper/app_url.dart';
import 'package:travel_app_master/screens/restaurant%20_details/model/campaigns_model.dart';


import 'package:travel_app_master/screens/restaurant%20_details/model/campaings_controller.dart';


class OfferScreen extends StatefulWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {

  //final String apiCamUrl = "https://ddapp.xomartbd.com/api/campaigns";

  bool isLoading = false;

  CampaignsModel? campaignsModel;

 CampaingnsContraller camContraller =Get.put(CampaingnsContraller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 48.h,
                      width: 48.w,
                      child: CircleAvatar(
                        radius: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, John!",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Active",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff08BA64),
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: 38.w,
                      height: 38.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        "assets/youtube_with.png",
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                        width: 38.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(Icons.notifications_outlined)),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Container(
                      height: 95.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bar_chart_outlined,size: 40,color: Colors.green,),
                          SizedBox(height: 5.h),
                          Text(
                            "My Discounts",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      height: 95.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.pending,size: 40,color: Colors.green,),
                          SizedBox(height: 5.h),
                          Text(
                            "Pending Rewards",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 35.h),
                Container(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ongoing Campaigns",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 22.sp),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                        indent: 25,
                        endIndent: 180,
                      )
                    ],
                  ),
                ),

                Obx(() => camContraller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    :  ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext, index) {
                    return  Column(
                      children: [
                        Container(
                          height: 131.h,
                          width: 374.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFfCDFEE6),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 131.h,
                                width: 134.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14.r),
                                  child: Image.asset(
                                    "assets/valentines.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Flexible(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("hi",
                                        // "${campaings[index].data!.ongoingCampaigns![index].title}",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Dhaka to Cox’s Bazaar bus ticket only for 16 taka.Spin the wheel to get this lucky discount!",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "16 December",
                                        style: TextStyle(
                                            color: Color(0xff08BA64),
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext, index) {
                    return SizedBox(height: 20);
                  },
                )),



            // FutureBuilder<List>(
            //   future: getCampaignData(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       List<CampaignsModel> users = snapshot.data as List<CampaignsModel>;
            //       return
            //     }
            //     if (snapshot.hasError) {
            //       print(snapshot.error.toString());
            //       return Text('error');
            //     }
            //     return CircularProgressIndicator();
            //   },
            // ),



                SizedBox(height: 10.h),


                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 250,
                  child: Column(
                    children: [
                      Text(
                        "Upcoming Campaigns",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 22),
                      ),
                      Divider(
                        thickness: 1.5,
                        color: Colors.grey,
                        indent: 25,
                        endIndent: 180,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<List<CampaignsModel>> getCampaignData() async{
  //   final response =await http.get(Uri.parse(apiCamUrl));
  //
  //   var data= jsonDecode(response.body.toString());
  //   if(response.statusCode==200){
  //     for(Map<String, dynamic> index in data){
  //       campaings.add(CampaignsModel.fromJson(index));
  //     }
  //     return campaings;
  //   } else{
  //     return campaings;
  //   }
  //
  // }


}
