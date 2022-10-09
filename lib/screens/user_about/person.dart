import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_master/utilites/colors.dart';

class PersonScreen extends StatefulWidget {
  PersonScreen({Key? key}) : super(key: key);

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  List<String> title = ["Couple Room x2", "Single Room x3"];

  List<String> image = [
    "assets/couple_room.png",
    "assets/single_room.png",
  ];

  bool loading = false;

  // Future loaddata() async {
  //   final provider = Provider.of<Hotelprovider>(context, listen: false);
  //   await provider.getprofile();
  //   setState(() {
  //     loading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   loaddata();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    //  final provider = Provider.of<Hotelprovider>(context);
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Stack(
                children: [
                  Image.asset("assets/1.png"),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 540.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r))),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.r),
                            child: Material(
                              borderRadius: BorderRadius.circular(5.r),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.notifications)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 27.w),
                        height: 205.h,
                        width: 360.w,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 154.h,
                                width: 360.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Column(
                                  children: [
                                    SizedBox(height: 50.h),
                                    Text(
                                      "Rakibul Islam",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp),
                                    ),
                                    Text(
                                      "user@gmail.com",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Dhaka",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(100.r),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/659651.png"),
                                  backgroundColor: Colors.white,
                                  radius: 45.r,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        height: 214.h,
                        width: 360.w,
                        margin: EdgeInsets.symmetric(horizontal: 17.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 100.0,
                                  width: 100.0,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      CircularProgressIndicator(
                                        color: Colors.green,
                                        value: 0.4,
                                        backgroundColor: Colors.grey[200],
                                        strokeWidth: 7.w,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: 68.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "120",
                                                style: TextStyle(
                                                    fontSize: 24.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.green),
                                              ),
                                              Text(
                                                "days remaining",
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 62.w,
                                  child: Column(
                                    children: [
                                      Text(
                                        "12",
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green),
                                      ),
                                      Text(
                                        "discounts claimed",
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 68.w,
                                  child: Column(
                                    children: [
                                      Text(
                                        "45k+",
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green),
                                      ),
                                      Text(
                                        "taka saved traveling",
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              width: 147.w,
                              height: 40.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Text(
                                "Buy Subscription",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
