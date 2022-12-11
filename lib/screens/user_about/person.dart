import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
      // backgroundColor: Color(0xffE5E5E5),
      // appBar: AppBar(
      //   title: Text(
      //     "Profile",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   centerTitle: true,
      // ),
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
                      height: 600.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r))),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 12.r),
                                child: Material(
                                  borderRadius: BorderRadius.circular(15.r),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.notifications_outlined,color: Colors.black54,)),
                                ),
                              ),
                            ],
                          ),
                          Container(

                            height: 205.h,
                            width: double.infinity,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 154.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.r)),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 20,top: 10),
                                              child: Icon(Icons.edit,color: Colors.black38,),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15.h),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Rakibul Islam",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20.sp),
                                            ),
                                            SizedBox(width: 5,),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(0xFF08BA64),
                                                  ),
                                                  borderRadius: BorderRadius.circular(30.r)
                                              ),
                                              child:   Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Text(
                                                  "Active",
                                                  style: TextStyle(
                                                      color: Color(0xFF08BA64),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 12.sp),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10.h),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "#HFV42H9G",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF08BA64),
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            Icon(Icons.copy,color: Colors.black38,size: 15,)
                                          ],
                                        ),

                                        SizedBox(height: 5.h),
                                        Text(
                                          "Dhaka, Bangladesh",
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Material(
                                    elevation: 1,
                                    borderRadius: BorderRadius.circular(100.r),
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/profile.png"),
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
                            height: 240.h,
                            width: double.infinity,

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
                                            color: Color(0xFF08BA64),
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
                                                color: Color(0xFF08BA64)),
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
                                                color: Color(0xFF08BA64)),
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
                                SizedBox(height: 30.h),
                                Container(
                                  width: 147.w,
                                  height: 40.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF08BA64),
                                      borderRadius: BorderRadius.circular(30.r)),
                                  child: Text(
                                    "Buy Subscription",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "My Discounts",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Container(
                                    color: Colors.black26,
                                    width: 60,
                                    height: 2,
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                     color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16,right: 10,top: 8,bottom: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Show all",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14
                                          ),

                                        ),
                                        Icon(Icons.arrow_forward_ios,color: Colors.black26,size: 14,)
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      // showModalBottomSheet(
                                      //     backgroundColor: Colors.transparent,
                                      //     isScrollControlled: true,
                                      //     context: context,
                                      //     builder: ((context) => GrabOffer()));
                                    },
                                    child: resturentbox());
                              })),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "My Favorites",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Container(
                                    color: Colors.black26,
                                    width: 60,
                                    height: 2,
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16,right: 10,top: 8,bottom: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Show all",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14
                                          ),

                                        ),
                                        Icon(Icons.arrow_forward_ios,color: Colors.black26,size: 14,)
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                             //  shrinkWrap: true,
                             // scrollDirection: Axis.horizontal,
                               // physics: NeverScrollableScrollPhysics(),

                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: ((context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        // showModalBottomSheet(
                                        //     backgroundColor: Colors.transparent,
                                        //     isScrollControlled: true,
                                        //     context: context,
                                        //     builder: ((context) => GrabOffer()));
                                      },
                                      child:favoriteBox());
                                }),


                            ),
                          ),
                          SizedBox(height: 10.h),
                          cardItemBox(),
                          SizedBox(height: 10.h),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

Widget resturentbox() {
  return Container(
    margin: EdgeInsets.only( bottom: 10.h),
    height: 144.h,
    width: 365.w,
    padding: EdgeInsets.only(right: 10.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: InkWell(
      onTap: () {

      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 144.h,
              width: 105.w,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),bottomLeft: Radius.circular(10.r)),
                child: Image.network(
                  "https://www.woodleys.com/blog/wp-content/uploads/sites/105/2020/07/Bedroom-Ideas-for-Couples.jpg",
                  // data.hotelImages!,
                  fit: BoxFit.cover,
                ),
              )),
          SizedBox(width: 10.w),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Couple Room",maxLines: 1,
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "x2",maxLines: 1,
                        style: TextStyle(
                          color: Colors.black38,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),
                  Text("A luxurious 2 bed room. With amazing services and luxury... ",maxLines: 2,style: TextStyle(color: Colors.black38),),
                  SizedBox(height: 12.h),

                  Row(
                    children: [
                      Container(

                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,

                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text("31 Dec",style: TextStyle(color: Colors.black54),),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(

                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,

                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text("Pending..",style: TextStyle(color: Colors.black54),),
                        ),
                      )

                    ],
                  ),
                ],
              ),
            ),
          ),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 36.h,
                  width: 28.w,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        "assets/discount_badge.png",
                        scale: 1.1,
                      ),
                      Positioned(
                        top: 10.h,
                        right: 0.w,
                        child: Text(
                          "30%",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            // fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60.h),
                Text(
                  "9700"+" tk",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff08BA64)),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget favoriteBox(){
  return  InkWell(
    onTap: (){},
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        margin: EdgeInsets.only( bottom: 10.h),
        height: 250.h,
        width: 250.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      height: 160.h,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r)),
                        child: Image.network(
                          "https://www.woodleys.com/blog/wp-content/uploads/sites/105/2020/07/Bedroom-Ideas-for-Couples.jpg",
                          // data.hotelImages!,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Positioned(
                   right: 10,
                    child: Container(
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 36.h,
                            width: 28.w,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "assets/discount_badge.png",
                                  scale: 1.1,
                                ),
                                Positioned(
                                  top: 10.h,
                                  right: 0.w,
                                  child: Text(
                                    "30%",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w700,
                                      // fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 80,
                          ),

                          RatingBar.builder(
                            itemSize: 16.r,
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                            EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(Icons.star,
                                size: 5, color: Colors.orangeAccent),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,

                 children: [
                   Text("Fun Hotel, Motel & Business Name Ideas",maxLines: 2,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                   SizedBox(height: 5,),
                   Row(
                     children: [
                       Icon(Icons.location_on_outlined,size: 16,color: Colors.black54),
                       Text("Dhaka",style: TextStyle(color: Colors.black54),),
                     ],
                   )
                 ],
               ),
             )
            ],
          )
        ),
      ),
    ),
  );
}

Widget cardItemBox(){
  return Container(
    child: Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/clam.png",height: 40,color: Colors.green,),
                  SizedBox(height: 5,),
                  Text("About Us",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,maxLines: 2,),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset("assets/privacy.png",height: 40,color: Colors.green,),
                  SizedBox(height: 5,),
                  Text("Terms of Services",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,maxLines: 2,),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/security.png",height: 40,color: Colors.green,),
                  SizedBox(height: 5,),
                  Text("Privacy Policy",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,maxLines: 2,),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/wallet.png",height: 40,color: Colors.green,),
                  SizedBox(height: 5,),
                  Text("My Payments",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,maxLines: 2,),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset("assets/setting.png",height: 40,color: Colors.green,),
                  SizedBox(height: 5,),
                  Text("Settings",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,maxLines: 2,),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/help_p.png",height: 40,color: Colors.green,),
                  SizedBox(height: 5,),
                  Text("Help & Support",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,maxLines: 2,),
                ],
              ),
            )
          ],
        ),

      ],
    ),
  );
}