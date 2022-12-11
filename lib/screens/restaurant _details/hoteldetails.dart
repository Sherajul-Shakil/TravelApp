import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utilitis/constant/color.dart';
import '../utilitis/submit_button.dart';
import 'ButtomSheet/available_offer_buttom_sheet.dart';
import 'offer/grab_offer.dart';

class HoteldetailsPage2 extends StatefulWidget {
  // final int hotelid;
  // final HotesDatum data;
  const HoteldetailsPage2({Key? key}) : super(key: key);

  @override
  State<HoteldetailsPage2> createState() => _HoteldetailsPage2State();
}

class _HoteldetailsPage2State extends State<HoteldetailsPage2> {
  bool loading = false;

  // Future loaddata() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   final provider = Provider.of<Hotelprovider>(context, listen: false);
  //   await provider.gethotelroom(hotelid: widget.hotelid);
  //   await location_distance_for_hotel();
  //   setState(() {
  //     loading = false;
  //   });
  // }

  // Future location_distance_for_hotel() async {
  //   final _locationprovider =
  //       Provider.of<Locationprovider>(context, listen: false);
  //   _locationprovider.calculateDistance(
  //     lat2: _locationprovider.currentlocationData!.latitude,
  //     lon2: _locationprovider.currentlocationData!.longitude,
  //     lat1: double.parse(widget.data.latitude),
  //     lon1: double.parse(widget.data.longitude),
  //   );
  // }

  // @override
  // void initState() {
  //   print(widget.hotelid);
  //   loaddata();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<Hotelprovider>(context);
    return Scaffold(
      backgroundColor: Color(0xFfF7F7F7),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  expandedHeight: 260.h,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        PageView.builder(
                            itemCount: 5,
                            itemBuilder: ((context, index) {
                              return Image.asset("assets/1.png");
                            })),
                        Positioned(
                          top: 40.h,
                          left: 24.w,
                          child: Container(
                            height: 40.h,
                            width: 40.w,
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
                        ),
                        Positioned(
                          top: 40.h,
                          right: 24.w,
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Positioned(
                          top: 89.h,
                          right: 24.w,
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.photo_library_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 24.w,
                          top: 183.h,
                          child: Container(
                            height: 36.h,
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(48.r)),
                            child: Text(
                              "Hotel",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        // Positioned(
                        //   bottom: -20,
                        //   left: 0,
                        //   right: 0,
                        //   child: Container(
                        //     width: double.infinity,
                        //     height: 50.h,
                        //     decoration: BoxDecoration(
                        //       color: Color(0xFfF7F7F7),
                        //       borderRadius: BorderRadius.only(
                        //         topLeft: Radius.circular(30.r),
                        //         topRight: Radius.circular(30.r),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    centerTitle: false,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(left: 24.w, right: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Positioned(
                        //   bottom: -20,
                        //   left: 0,
                        //   right: 0,
                        //   child: Container(
                        //     width: double.infinity,
                        //     height: 50.h,
                        //     decoration: BoxDecoration(
                        //       color: Color(0xFfF7F7F7),
                        //       borderRadius: BorderRadius.only(
                        //         topLeft: Radius.circular(30.r),
                        //         topRight: Radius.circular(30.r),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Container(
                              height: 36.h,
                              width: 36.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r)),
                              child: Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 18,
                              ),
                            ),
                            SizedBox(width: 10.h),
                            Text(
                              "250",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFF4B806)),
                            ),
                            Spacer(),
                            Container(
                              height: 48.h,
                              width: 48.w,
                              child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                    "assets/youtube.png",
                                  )),
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              height: 48.h,
                              width: 48.w,
                              child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                    "assets/youtube_with.png",
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "widget.data.name",
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.grey,
                              size: 15,
                            ),
                            Text(
                              "widget.data.location",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "widget.data.description",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9C9C9C)),
                        ),

                        Divider(),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Column(
                        //       children: [
                        //         Container(
                        //           height: 65.h,
                        //           width: 80.w,
                        //           decoration: BoxDecoration(
                        //             color: Colors.white,
                        //             borderRadius: BorderRadius.circular(16.r),
                        //           ),
                        //           child: Icon(
                        //             Icons.menu_book,
                        //             color: Colors.grey,
                        //             size: 30,
                        //           ),
                        //         ),
                        //         Text(
                        //           "Menu",
                        //           style: TextStyle(
                        //               color: Colors.grey,
                        //               fontSize: 13.sp,
                        //               fontWeight: FontWeight.w400),
                        //         )
                        //       ],
                        //     ),
                        //     Column(
                        //       children: [
                        //         Container(
                        //           height: 65.h,
                        //           width: 80.w,
                        //           decoration: BoxDecoration(
                        //             color: Colors.white,
                        //             borderRadius: BorderRadius.circular(16.r),
                        //           ),
                        //           child: Icon(
                        //             Icons.phone,
                        //             color: Colors.grey,
                        //             size: 30,
                        //           ),
                        //         ),
                        //         Text(
                        //           "Contact",
                        //           style: TextStyle(
                        //               color: Colors.grey,
                        //               fontSize: 13.sp,
                        //               fontWeight: FontWeight.w400),
                        //         )
                        //       ],
                        //     ),
                        //     Column(
                        //       children: [
                        //         Container(
                        //           height: 65.h,
                        //           width: 80.w,
                        //           decoration: BoxDecoration(
                        //             color: Colors.white,
                        //             borderRadius: BorderRadius.circular(16.r),
                        //           ),
                        //           child: Image.asset("assets/online_order.png"),
                        //         ),
                        //         Text(
                        //           "Contact",
                        //           style: TextStyle(
                        //               color: Colors.grey,
                        //               fontSize: 13.sp,
                        //               fontWeight: FontWeight.w400),
                        //         )
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 23.h),
                        // Container(
                        //     width: 361.w,
                        //     height: 56.h,
                        //     child: CustomButton(
                        //       title: "Claim 50% Discount",
                        //       size: 18,
                        //       color: PColor.submitButtonColor,
                        //       onTap: () {},
                        //       icon: Icons.arrow_forward,
                        //     )),
                        // SizedBox(height: 27.h),
                        // Divider(),
                        // Image.asset(
                        //   "assets/burger.png",
                        //   fit: BoxFit.cover,
                        // ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(left: 24.w, top: 32.h, right: 24.w),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Available Offers",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 24.h,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Icon(
                                    Icons.calendar_month,
                                    size: 15,
                                    color: Color(0xFFD0D0D0),
                                  ),
                                ),
                                Text(
                                  "Change Date",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF9C9C9C)),
                                )
                              ],
                            )
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: ((context) =>
                                    AvailableofferButtomSheet()));
                          },
                          child: Container(
                            height: 42.h,
                            width: 82.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "More",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF9C9C9C)),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.green,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 10.h),
                ),
                // sliverlist()
                SliverToBoxAdapter(child: roomlist()),
                SliverToBoxAdapter(child: services()),
                SliverToBoxAdapter(child: latestreview()),
                SliverToBoxAdapter(child: map()),
                SliverToBoxAdapter(child: page())

              ],
            ),
    );
  }

  Widget roomlist() {
    // final provider = Provider.of<Hotelprovider>(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        // var data = provider.hotelRoom!.data![index];
        return resturentbox(null);
      },
    );
  }

  Widget resturentbox(data) {
    return Container(
      margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 10.h),
      height: 144.h,
      width: 365.w,
      padding: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              context: context,
              builder: ((context) => GrabOffer()));
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
                    "https://img1.10bestmedia.com/Images/Photos/378649/Park-Hyatt-New-York-Manhattan-Sky-Suite-Master-Bedroom-low-res_54_990x660.jpg",
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
                    Text(
                      "Single Room",maxLines: 1,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
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
                            child: Text("2 Bed",style: TextStyle(color: Colors.black54),),
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
                            child: Text("Night Stay",style: TextStyle(color: Colors.black54),),
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
                  SizedBox(height: 40.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "available offer",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                          // fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "1800"+" tk",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff08BA64)),
                      ),
                      Text(
                        "400"+" tk",
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w300,
                            decoration:
                            TextDecoration.lineThrough,
                            color: Color(0xff08BA64)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget services() {
    return Container(
      margin: EdgeInsets.only(left: 24.w, top: 32.h, right: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Service",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(
                Icons.check,
                color: Colors.green,
                size: 20.r,
              ),
              SizedBox(width: 10.w),
              Text("Laundry Service")
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check,
                color: Colors.green,
                size: 20.r,
              ),
              SizedBox(width: 10.w),
              Text("Laundry Service")
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check,
                color: Colors.green,
                size: 20.r,
              ),
              SizedBox(width: 10.w),
              Text("Laundry Service")
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check,
                color: Colors.green,
                size: 20.r,
              ),
              SizedBox(width: 10.w),
              Text("Laundry Service")
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check,
                color: Colors.green,
                size: 20.r,
              ),
              SizedBox(width: 10.w),
              Text("Laundry Service")
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check,
                color: Colors.green,
                size: 20.r,
              ),
              SizedBox(width: 10.w),
              Text("Laundry Service")
            ],
          ),
        ],
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
              leading: Image.asset("assets/facebook_white.png",height: 30,),
              trailing: Icon(Icons.arrow_forward_ios,color: Colors.black26,),
              title: Text("Facebook Page",style: TextStyle(color: Colors.black54),),
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
              leading:  Image.asset("assets/world.png",height: 30,),
              trailing: Icon(Icons.arrow_forward_ios,color: Colors.black26,),
              title: Text("Visit website",style: TextStyle(color: Colors.black54),),
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
              leading:  Image.asset("assets/privacy.png",height: 30,),
              trailing: Icon(Icons.arrow_forward_ios,color: Colors.black26,),
              title: Text("Privacy Policy",style: TextStyle(color: Colors.black54),),
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
              leading:  Image.asset("assets/clam.png",height: 30,),
              trailing: Icon(Icons.arrow_forward_ios,color: Colors.black26,),
              title: Text("How to claim?",style: TextStyle(color: Colors.black54),),
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
              leading:  Image.asset("assets/help.png",height: 30,),
              trailing: Icon(Icons.arrow_forward_ios,color: Colors.black26,),
              title: Text("Help & Support",style: TextStyle(color: Colors.black54),),
            ),
          ),
          SizedBox(height: 30.h),

        ],
      ),
    );
  }

}
