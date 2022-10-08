import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../offer/grab_offer.dart';

class AvailableofferButtomSheet extends StatefulWidget {
  const AvailableofferButtomSheet({Key? key}) : super(key: key);

  @override
  State<AvailableofferButtomSheet> createState() =>
      _AvailableofferButtomSheetState();
}

class _AvailableofferButtomSheetState extends State<AvailableofferButtomSheet> {
  @override
  Widget build(BuildContext context) {
    return showBottomSheet(context);
  }

  Widget showBottomSheet(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        // color: const Color.fromRGBO(0, 0, 0, 0.001),
        child: GestureDetector(
          onTap: () {},
          child: DraggableScrollableSheet(
            builder: (_, controller) {
              return SingleChildScrollView(
                controller: controller,
                child: Container(
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                      color: Color(0xFFF7F7F7),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Available Offers",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        height: 1.h,
                        width: 50.w,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10.h),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 10,
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
                          }))
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget resturentbox() {
    return Container(
      margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 10.h),
      height: 144.h,
      width: 365.w,
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
              child: Image.asset(
                "assets/segull.png",
                fit: BoxFit.cover,
              )),
          SizedBox(width: 10.w),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Seagull Hotel",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
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
                Row(
                  children: [
                    Text(
                      "Hotel",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Restaurent",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                RatingBar.builder(
                  itemSize: 20.r,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, size: 5, color: Colors.orangeAccent),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Text(
                  "131 review",
                  style:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w200),
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
                          "50%",
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
                      "6,000 tk",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff08BA64)),
                    ),
                    Text(
                      "12,000 tk",
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
    );
  }
}
