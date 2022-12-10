import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app_master/screens/restaurant%20_details/ButtomSheet/claimed.dart';
import 'package:travel_app_master/screens/restaurant%20_details/offer/grab_offer.dart';

// import '../../Http/restorent.dart';
// import '../../Model/restorentmodel.dart';
// import '../../Model/resturant_menu.dart';
// import '../../Model/resturant_offer.dart';
import '../utilitis/constant/color.dart';
import '../utilitis/submit_button.dart';

class RestaurantScreen extends StatefulWidget {
  // final RestorentDatum data;
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  int selectbtn = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            // Stack(
            //   children: [
            //     Container(
            //         width: 414.w,
            //         height: 260.h,
            //         child: Image.asset(
            //           "assets/restaurent.png",
            //           fit: BoxFit.fitWidth,
            //         )),
            //     Positioned(
            //       top: 40.h,
            //       left: 24.w,
            //       child: Container(
            //         height: 40.h,
            //         width: 40.w,
            //         child: CircleAvatar(
            //           backgroundColor: Colors.grey,
            //           child: Padding(
            //             padding: EdgeInsets.only(left: 8.w),
            //             child: Icon(
            //               Icons.arrow_back_ios,
            //               color: Colors.white,
            //               size: 20,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Positioned(
            //       top: 40.h,
            //       right: 24.w,
            //       child: Container(
            //         height: 40.h,
            //         width: 40.w,
            //         child: CircleAvatar(
            //             backgroundColor: Colors.grey,
            //             child: Icon(
            //               Icons.more_horiz,
            //               color: Colors.white,
            //             )),
            //       ),
            //     ),
            //     Positioned(
            //       top: 89.h,
            //       right: 24.w,
            //       child: Container(
            //         height: 40.h,
            //         width: 40.w,
            //         child: CircleAvatar(
            //           backgroundColor: Colors.grey,
            //           child: Icon(
            //             Icons.photo_library_outlined,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ),
            //     Positioned(
            //       right: 24.w,
            //       top: 183.h,
            //       child: Container(
            //         width: 101.w,
            //         height: 36.h,
            //         alignment: Alignment.center,
            //         decoration: BoxDecoration(
            //             color: Colors.grey,
            //             borderRadius: BorderRadius.circular(48.r)),
            //         child: Text(
            //           "Restuarant",
            //           style: TextStyle(
            //               fontSize: 14.sp,
            //               fontWeight: FontWeight.w500,
            //               color: Colors.white),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              width: double.infinity,

              color: Color(0xffE5E5E5),
              // color: Colors.red,
              child: Transform.translate(
                offset: Offset(0, -20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xffE5E5E5),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              itemSize: 25,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                size: 5,
                                color: Colors.orangeAccent,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(
                                      "assets/youtube.png",
                                    )),
                                SizedBox(width: 10),
                                CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(
                                      "assets/youtube_with.png",
                                    )),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "widget.data.restaurantName!",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.grey),
                                Text(
                                  "widget.data.restaurantLocation!",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "widget.data.restaur.restaurantDescription! .restaurantDescription! antDescription!",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 10.h),
                        Divider(),
                        SizedBox(height: 10.h),
                        manubtn(),
                        SizedBox(height: 20.h),
                        Container(
                            width: double.infinity,
                            height: 56,
                            child: CustomButton(
                              title: "Claim 50% Discount",
                              size: 18,
                              color: PColor.submitButtonColor,
                              onTap: () {
                                showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: ((context) => ClaimedSheet()));
                              },
                              icon: Icons.arrow_forward,
                            )),
                        SizedBox(height: 40.h),
                        // memu(),
                        imageSlideView(),
                        latestreview(),
                        SizedBox(height: 10.h),
                        map(),
                        SizedBox(height: 10.h),
                        page(),

                        // offer()
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      width: 414.w,
      height: 260.h,
      padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 30.h),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/restaurent.png",
              ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (() {
                  Navigator.pop(context);
                }),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  )),
            ],
          ),
          SizedBox(height: 10.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.photo_library_outlined,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30.h),
              Container(
                width: 101.w,
                height: 36.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(48.r)),
                child: Text(
                  "Restuarant",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget manubtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            InkWell(
              onTap: (() {
                setState(() {
                  selectbtn = 0;
                });
              }),
              child: Container(
                  width: 80.w,
                  height: 65.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Icon(
                    Icons.menu_book,
                    color: Colors.grey,
                    size: 30,
                  )),
            ),
            SizedBox(height: 5.h),
            Text(
              "Menu",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: 80,
              height: 65,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.phone,
                  color: Colors.grey,
                  size: 30,
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    primary: Colors.white),
              ),
            ),
            Text(
              "Contact",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: 80,
              height: 65,
              child: ElevatedButton(
                onPressed: () {},
                child: Image.asset("assets/online_order.png"),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    primary: Colors.white),
              ),
            ),
            Text(
              "Order Online",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ],
    );
  }

  Widget imageSlideView(){
    return Padding(
      padding: const EdgeInsets.only(top: 4,left: 8,right: 8,bottom: 4),
      child: ImageSlideshow(

        width: double.infinity,
        initialPage: 0,
        indicatorColor: Colors.teal,
        indicatorBackgroundColor: Colors.teal.shade50,

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
            Image.asset(
              'assets/f1.jpg',
              fit: BoxFit.cover,
            ),
          ),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
            Image.asset(
              'assets/f2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
            Image.asset(
              'assets/f3.jpg',
              fit: BoxFit.cover,
            ),
          ),

        ],
        autoPlayInterval: 3000,
        isLoop: true,
      ),
    );
  }


  Widget latestreview() {
    return Container(
      margin: EdgeInsets.only(left: 24.w, top: 32.h, right: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Latest Reviews",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.r)),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.r,
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      children: [
                        Text("jhon Smith"),
                        SizedBox(height: 5.h),
                        Row(
                          children: List.generate(
                              5,
                                  (index) => Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15.r,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget map() {
    return Container(
      margin: EdgeInsets.only(left: 24.w, top: 32.h, right: 24.w),
      height: 150.h,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.asset(
          "assets/Screenshot 2022-09-14 at 12.31.21 PM.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget page() {
    return Container(
      margin: EdgeInsets.only(left: 24.w, top: 32.h, right: 24.w),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(
                child: Icon(Icons.facebook),
              ),
              trailing: Icon(Icons.arrow_forward_ios,),
              title: Text("Facebook Page"),
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(
                child: Icon(Icons.facebook),
              ),
              trailing: Icon(Icons.arrow_forward_ios,),
              title: Text("Visit website"),
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(
                child: Icon(Icons.facebook),
              ),
              trailing: Icon(Icons.arrow_forward_ios,),
              title: Text("Privacy Policy"),
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(
                child: Icon(Icons.facebook),
              ),
              trailing: Icon(Icons.arrow_forward_ios,),
              title: Text("How to claim?"),
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(
                child: Icon(Icons.facebook),
              ),
              trailing: Icon(Icons.arrow_forward_ios,),
              title: Text("Help & Support"),
            ),
          ),
        ],
      ),
    );
  }

  // Widget offer() {
  //   return FutureBuilder<Resturantoffer?>(
  //       future: Httprestorent().resturentoffer(),
  //       builder: ((context, snapshot) {
  //         if (snapshot.hasData) {
  //           return Container(
  //             height: 150.h,
  //             child: PageView.builder(
  //                 itemCount: snapshot.data!.data!.length,
  //                 itemBuilder: ((context, index) {
  //                   var data = snapshot.data!.data![index];
  //                   return ClipRRect(
  //                     borderRadius: BorderRadius.circular(10.r),
  //                     child: Image.network(
  //                       data.bannerImages!,
  //                       fit: BoxFit.cover,
  //                     ),
  //                   );
  //                 })),
  //           );
  //         } else {
  //           return Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //       }));
  // }

  // Widget memu() {
  //   return FutureBuilder<ResturantMenu?>(
  //       future: Httprestorent().resturentmenu(resturentid: widget.data.id),
  //       builder: ((context, snapshot) {
  //         if (snapshot.hasData) {
  //           return Container(
  //             height: 150.h,
  //             child: PageView.builder(
  //                 itemCount: snapshot.data!.data!.length,
  //                 itemBuilder: ((context, index) {
  //                   var data = snapshot.data!.data![index];
  //                   return ClipRRect(
  //                     borderRadius: BorderRadius.circular(10.r),
  //                     child: Image.network(
  //                       data.menuImages!.split(",").first,
  //                       fit: BoxFit.cover,
  //                     ),
  //                   );
  //                 })),
  //           );
  //         } else {
  //           return Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //       }));
  // }
}
