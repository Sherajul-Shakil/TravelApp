import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/hotel.dart';
import '../../provider/pagecontroll.dart';
import '../../utilites/route.dart';
import '../Search/search.dart';
import '../restaurant _details/offer/offer_page.dart';
import '../restaurant _details/restaurant_page.dart';
import '../restaurant _details/hoteldetails.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  bool onPressed = false;

  List<String> sImage = [
    "assets/16taka.png",
    "assets/16taka.png",
    "assets/16taka.png",
    "assets/16taka.png",
  ];

  bool loading = true;

  Future loaddata() async {
    final provider = Provider.of<Hotelprovider>(context, listen: false);
    // await provider.getcategory();
    await provider.getofferbanner();
    await provider.gethotels();
    await provider.getprofile();
    await provider.getrestorent();
    setState(() {
      loading = false;
    });
  }

  int selectcategory = 0;

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Hotelprovider>(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffF7F7F7),
          body: loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Row(
                          children: [
                            Container(
                              height: 48.h,
                              width: 48.w,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://www.w3schools.com/howto/img_avatar.png"),
                                radius: 25,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hi, ${provider.profileData!.data!.name!}",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                      size: 15,
                                    ),
                                    Text(
                                      provider.profileData!.data!.city!,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                              width: 38.w,
                              height: 38.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(13.r)),
                              child: Image.asset(
                                "assets/youtube_with.png",
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                width: 38.w,
                                height: 38.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(13.r)),
                                child: Icon(Icons.notifications_outlined)),
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
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(10.r),
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xff08BA64),
                                      size: 20,
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    hintText: "Where do you wanna go?",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(16),
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
                                    color: Color(0xff08BA64),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                      if (selectcategory == 0) hotels(),
                      if (selectcategory == 1) restorent(),
                      SizedBox(
                        height: 10,
                      ),
                      arroundworld(),
                    ],
                  ),
                )),
    );
  }

  Widget category() {
    final provider = Provider.of<Hotelprovider>(context);
    final pageprovider = Provider.of<PagecontrollProvider>(context);
    return Container(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 24.w),
        itemCount: provider.category!.data!.length,
        itemBuilder: (BuildContext context, int index) {
          var data = provider.category!.data![index];
          return InkWell(
            onTap: () {
              setState(() {
                pageprovider.categoryindex(index);
                pageprovider.pageController.jumpToPage(1);
              });
            },
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.r),
                  height: 65.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Image.network(
                    data.categoryIcon!,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  data.categoryTitle!,
                  style: TextStyle(
                      color: Color(0xFf9C9C9C),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 20,
          );
        },
      ),
    );
  }

  Widget slider() {
    final provider = Provider.of<Hotelprovider>(context);
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
                                  builder: (context) => OfferScreen()));
                        }
                      });
                    },
                    child: Icon(
                      Icons.arrow_forward,
                    )),
              ],
            ),
          ),
          Container(
            height: 250.h,
            child: PageView.builder(
                itemCount: provider.offerbanner!.data.length,
                itemBuilder: ((context, index) {
                  var data = provider.offerbanner!.data[index];
                  return Container(
                    padding: EdgeInsets.all(25.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.network(
                          data.bannerPhoto,
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
    final provider = Provider.of<Hotelprovider>(context);
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
                  child: Icon(
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
            physics: NeverScrollableScrollPhysics(),
            itemCount: provider.hotels!.data.length,
            itemBuilder: ((context, index) {
              var data = provider.hotels!.data[index];
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      newpage(HoteldetailsPage2(hotelid: data.id, data: data),
                          context);
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
                                borderRadius: BorderRadius.circular(10.r),
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8aG90ZWx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                                  // data.hotelImages!,
                                  fit: BoxFit.cover,
                                ),
                              )),
                          SizedBox(width: 10.w),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data.name,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  children: [
                                    Icon(Icons.location_on, size: 15),
                                    Text(
                                      "Cox’s Bazaar",
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                Text(data.hotelTags[0].name),
                                SizedBox(height: 20.h),
                                RatingBar.builder(
                                  itemSize: 20.r,
                                  initialRating: 3,
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
                                Text(
                                  "${data.hotelRatings.length} review",
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w200),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
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
                                          "${data.discount}%",
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
                                      "${data.offerPrice} tk",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff08BA64)),
                                    ),
                                    Text(
                                      "${data.price} tk",
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
                  ),
                ],
              );
            })),
      ],
    );
  }

  Widget restorent() {
    final provider = Provider.of<Hotelprovider>(context);
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: provider.restorent!.data!.length,
        itemBuilder: ((context, index) {
          var data = provider.restorent!.data![index];
          return InkWell(
            onTap: () {
              newpage(RestaurantScreen(data: data), context);
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
                        data.restaurantImages!,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(width: 10.w),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data.restaurantName!,
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 15),
                            Text(
                              "Cox’s Bazaar",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(data.restaurantTags!),
                        SizedBox(height: 20.h),
                        RatingBar.builder(
                          itemSize: 20.r,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(Icons.star,
                              size: 5, color: Colors.orangeAccent),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Text(
                          "${0} review",
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
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
                                  "${data.restaurantDiscount}%",
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
                              "${""} tk",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff08BA64)),
                            ),
                            Text(
                              "${""} tk",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.lineThrough,
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
              Spacer(),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://s3-alpha-sig.figma.com/img/a240/b900/13cd146be9d499fd002d2eb37f80f830?Expires=1663545600&Signature=F8BCx92CUQaxz7XHG2CT2-K4FiFdMOCGMo1aK2ceOxN5kWyj6KGfkroNyZm8UuVbmTNm5-ibG4IxpeyZZqTfDMJ8RSNAqAMq2fHy5eYs7DJd4cRJhJp7AWmM8QdQMGmG4n0jzVg-JNz47blSZbvzz9Vgh0FjbbbUqgDdzYo8OCpO246jx~GhtQGPZrXIkdPTmyU1yAB6VgeM9laKlFrfLSu9KouD4qEFuRcGHYmzMOFo8xNWm0kAHTeK~O9DDHLGzVlvs1c9JDvaD00fBShZ3nLVvasKi3s1~-CEbr6Pn5y-vdN~D2LI6bZotBwDmOXC0A4Km~u7DqpBZMpjuQGs~w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"))),
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
