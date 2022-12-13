import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_app_master/core/network_helper/network_helper.dart';
import 'package:travel_app_master/screens/auth/controller/auth_controller.dart';
import 'package:travel_app_master/screens/home/home_controller.dart';

import '../../utilites/route.dart';
import '../Search/search.dart';
import '../restaurant _details/offer/offer_page.dart';
import '../restaurant _details/hoteldetails.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TextEditingController searchController = TextEditingController();
  NetworkHelper networkHelper = Get.put(NetworkHelper());
  bool onPressed = false;

  List<String> sImage = [
    "assets/16taka.png",
    "assets/16taka.png",
    "assets/16taka.png",
    "assets/16taka.png",
  ];

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (homeController) {
              return Scaffold(
                  backgroundColor: const Color(0xffF7F7F7),
                  body: homeController.isLoading == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 48.h,
                                      width: 48.w,
                                      child: const CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://www.w3schools.com/howto/img_avatar.png"),
                                        radius: 25,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hi, pk",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              color: Colors.grey,
                                              size: 15,
                                            ),
                                            Text(
                                              "city!",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 38.w,
                                      height: 38.h,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(13.r)),
                                      child: Image.asset(
                                        "assets/youtube_with.png",
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () => networkHelper.logout(),
                                      child: Container(
                                          width: 38.w,
                                          height: 38.h,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(13.r)),
                                          child: const Icon(
                                              Icons.notifications_outlined)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 290.w,
                                        height: 48.h,
                                        child: TextFormField(
                                          controller:
                                              homeController.searchController,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                                EdgeInsets.all(10.r),
                                            filled: true,
                                            fillColor: Colors.white,
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                Get.to(
                                                    () => const SearchScreen());
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //       builder: (context) =>
                                                //           SearchScreen(
                                                //         selectedcategory: 1,
                                                //         searchItem: value,
                                                //       ),
                                                //     ));
                                              },
                                              child: const Icon(
                                                Icons.arrow_forward,
                                                color: Color(0xff08BA64),
                                                size: 20,
                                              ),
                                            ),
                                            labelStyle: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            hintText: "Where do you wanna go?",
                                            hintStyle: const TextStyle(
                                              color: Colors.grey,
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            disabledBorder: InputBorder.none,
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: 64.w,
                                        height: 48.h,
                                        decoration: BoxDecoration(
                                            color: const Color(0xff08BA64),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: 20.w,
                                                height: 17.h,
                                                child: Image.asset(
                                                    "assets/emergency.png")),
                                            Text(
                                              "Emergency",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              category(),
                              SizedBox(
                                height: 20.h,
                              ),
                              slider(),
                              if (homeController.selectcategory == 0) hotels(),
                              if (homeController.selectcategory == 1)
                                restorent(),
                              const SizedBox(
                                height: 10,
                              ),
                              // arroundworld(),
                            ],
                          ),
                        ));
            }));
  }

  Widget category() {
    HomeController homeController = Get.find();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  homeController.changeHotelRes(0);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(10.r),
                          height: 65.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              color: homeController.selectcategory == 0
                                  ? const Color(0xff08BA64).withOpacity(0.3)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Image.asset("assets/hotel.png")),
                      SizedBox(height: 5.h),
                      Text(
                        "Hotel/Resot",
                        style: TextStyle(
                            color: const Color(0xFf9C9C9C),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: () {
                    homeController.changeHotelRes(1);
                  },
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(10.r),
                          height: 65.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              color: homeController.selectcategory == 1
                                  ? const Color(0xff08BA64).withOpacity(0.3)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Image.asset("assets/restaurant.png")),
                      SizedBox(height: 5.h),
                      Text(
                        "Restaurant",
                        style: TextStyle(
                            color: const Color(0xFf9C9C9C),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(10.r),
                          height: 65.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Image.asset("assets/cruise.png")),
                      SizedBox(height: 5.h),
                      Text(
                        "Cruise",
                        style: TextStyle(
                            color: const Color(0xFf9C9C9C),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(10.r),
                          height: 65.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Image.asset("assets/flight.png")),
                      SizedBox(height: 5.h),
                      Text(
                        "Flight",
                        style: TextStyle(
                            color: const Color(0xFf9C9C9C),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget slider() {
    // final provider = Provider.of<Hotelprovider>(context);
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Offers for you",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        width: 50.w,
                        height: 1,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        if (onPressed == false) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OfferScreen()));
                        }
                      });
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                    )),
              ],
            ),
          ),
          Container(
            height: 250.h,
            child: PageView.builder(
                itemCount: 4,
                itemBuilder: ((context, index) {
                  // var data = provider.offerbanner!.data[index];
                  return Container(
                    padding: EdgeInsets.all(25.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                          fit: BoxFit.cover,
                        )),
                  );
                })),
          )
        ],
      ),
    );
  }

  Widget hotels() {
    HomeController homeController = Get.put(HomeController());
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Popular Deals",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      width: 50.w,
                      height: 1,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_forward,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homeController.popularHotelList.length,
            itemBuilder: ((context, index) {
              var hotelData = homeController.popularHotelList[index];
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      newpage(const HoteldetailsPage2(), context);
                    },
                    child: Container(
                      height: 144.h,
                      width: 365.w,
                      margin: EdgeInsets.all(10.r),
                      padding: EdgeInsets.only(right: 10.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 144.h,
                              width: 105.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    bottomLeft: Radius.circular(10.r)),
                                child: Image.network(
                                  "${hotelData.image}",
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
                                    "${hotelData.name}",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 8.h),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on, size: 15),
                                      SizedBox(
                                        width: Get.width * 0.3,
                                        child: Text(
                                          "${hotelData.location}",
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            "Hotel",
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //     color: Colors.grey.shade200,
                                      //     borderRadius: const BorderRadius.all(
                                      //         Radius.circular(20)),
                                      //   ),
                                      //   child: const Padding(
                                      //     padding: EdgeInsets.symmetric(
                                      //         horizontal: 8),
                                      //     child: Text(
                                      //       "Restaurant",
                                      //       style: TextStyle(
                                      //           color: Colors.black54),
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  RatingBar.builder(
                                    itemSize: 16.r,
                                    initialRating:
                                        double.parse("${hotelData.rating}"),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        size: 5,
                                        color: Colors.orangeAccent),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Text(
                                    "${hotelData.totalRating}",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w300),
                                  )
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
                                          "${hotelData.discount ?? 0}%",
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
                                      "${hotelData.offerPrice ?? 0} tk",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff08BA64)),
                                    ),
                                    Text(
                                      "${hotelData.price ?? 0} tk",
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w300,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: const Color(0xff08BA64)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            })),
      ],
    );
  }

  Widget restorent() {
    HomeController homeController = Get.find();
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: homeController.popularRestaurentList.length,
        itemBuilder: ((context, index) {
          var restData = homeController.popularRestaurentList[index];
          return InkWell(
            onTap: () {
              // newpage(RestaurantScreen(data: data), context);
            },
            child: Container(
              height: 144.h,
              width: 365.w,
              margin: EdgeInsets.all(10.r),
              padding: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 144.h,
                      width: 105.w,
                      child: Image.network(
                        "${restData.image}",
                        fit: BoxFit.cover,
                      )),
                  SizedBox(width: 10.w),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${restData.name}",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 15),
                            Text(
                              "${restData.location}",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Resturent",
                        ),
                        SizedBox(height: 20.h),
                        RatingBar.builder(
                          itemSize: 20.r,
                          initialRating: double.parse("${restData.rating}"),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => const Icon(Icons.star,
                              size: 5, color: Colors.orangeAccent),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Text(
                          "${restData.totalRating}",
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
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
                                  "${restData.discount}%",
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
                              "${restData.offerPrice ?? 0} tk",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff08BA64)),
                            ),
                            Text(
                              "${restData.price ?? 0} tk",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.lineThrough,
                                  color: const Color(0xff08BA64)),
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
        }));
  }

  Widget arroundworld() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
          child: Row(
            children: [
              Text(
                "Around The World",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Container(
                    height: 226.h,
                    width: 366.w,
                    margin: EdgeInsets.only(bottom: 15.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                              // "https://s3-alpha-sig.figma.com/img/a240/b900/13cd146be9d499fd002d2eb37f80f830?Expires=1663545600&Signature=F8BCx92CUQaxz7XHG2CT2-K4FiFdMOCGMo1aK2ceOxN5kWyj6KGfkroNyZm8UuVbmTNm5-ibG4IxpeyZZqTfDMJ8RSNAqAMq2fHy5eYs7DJd4cRJhJp7AWmM8QdQMGmG4n0jzVg-JNz47blSZbvzz9Vgh0FjbbbUqgDdzYo8OCpO246jx~GhtQGPZrXIkdPTmyU1yAB6VgeM9laKlFrfLSu9KouD4qEFuRcGHYmzMOFo8xNWm0kAHTeK~O9DDHLGzVlvs1c9JDvaD00fBShZ3nLVvasKi3s1~-CEbr6Pn5y-vdN~D2LI6bZotBwDmOXC0A4Km~u7DqpBZMpjuQGs~w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                            ))),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10.r),
                        )),
                        Container(
                          padding: EdgeInsets.all(10.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Longest Sea Beach",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              Text(
                                "It was a very good journey, we visited a lot of places there. The travel became so affordable, the interest thing is...",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }))
      ],
    );
  }
}

// class HomeButton {
//   String? image;
//   String? title;
//   Widget? screens;

//   HomeButton({this.image, this.title, this.screens});
// }

// List<HomeButton> home = [
//   HomeButton(
//       image: "assets/hotel.png",
//       title: "Hotel/Resort",
//       screens: SearchScreen()),
//   HomeButton(
//       image: "assets/restaurant.png",
//       title: "Restaurant",
//       screens: RestaurantScreen()),
//   HomeButton(
//       image: "assets/cruise.png", title: "Cruise", screens: RestaurantScreen()),
//   HomeButton(
//       image: "assets/flight.png", title: "Flight", screens: RestaurantScreen()),
// ];
