import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_master/screens/restaurant%20_details/ButtomSheet/claimed.dart';
import 'package:travel_app_master/screens/restaurant%20_details/ButtomSheet/contact_for_booking.dart';

class GrabOffer extends StatefulWidget {
  // final HotelroomDatum data;
  const GrabOffer({
    Key? key,
    // required this.data,
  }) : super(key: key);

  @override
  State<GrabOffer> createState() => _GrabOfferState();
}

class _GrabOfferState extends State<GrabOffer> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    // final locationprovider = Provider.of<Locationprovider>(context);
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFfF7F7F7),
            borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
        ),

        child: Column(
          children: [
            SizedBox(height: 25.h),
            Text(
              "Grab the Offer",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              thickness: 1,
              indent: 160,
              endIndent: 160,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 120.h,
                    child: Row(
                      children: [
                        Container(
                          width: 120.w,
                          height: 120.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.asset(
                              "assets/couple_room.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: 19.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "widget.roomTitle!",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD0D0D0),
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Text(
                                    "2 Bed ",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF9C9C9C)),
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD0D0D0),
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Text(
                                    "Night Stay",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF9C9C9C)),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "DiscountPrice tk",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13.sp,
                                      color: Color(0xff08BA64)),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "roomPrice tk",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff08BA64)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "10% off",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffF4B806)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "roomDescription",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Color(0xff08BA64),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Laundry Service",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, color: Color(0xff08BA64)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "ABC Luxury Service",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, color: Color(0xff08BA64)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Laundry Service",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, color: Color(0xff08BA64)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Laundry Service",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 48.h,
                        width: 177.w,
                        decoration: BoxDecoration(
                          color: Color(0xFfD0D0D0).withOpacity(0.30),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.privacy_tip,
                              color: Color(0xFfD0D0D0),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "Privacy Policy",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFfD0D0D0)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 48.h,
                        width: 177.w,
                        decoration: BoxDecoration(
                          color: Color(0xFfD0D0D0).withOpacity(0.30),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.privacy_tip,
                              color: Color(0xFfD0D0D0),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "How to get?",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFfD0D0D0)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.1),
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Amount:",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        IconButton(
                            onPressed: () {
                              if (quantity != 0) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                            icon: Icon(Icons.remove)),
                        Text(
                          "${quantity}",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: Icon(Icons.add)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // if (locationprovider.distance >= 1.0)
                      InkWell(
                         onTap: (){
                           Navigator.pop(context);
                           showModalBottomSheet(
                               backgroundColor: Colors.transparent,
                               isScrollControlled: true,
                               context: context,
                               builder: ((context) => ContactForBooking()));
                         },
                        child: Container(
                          height: 62.h,
                          width: 170.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xFF08BA64).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Text(
                            "Contact for Booking",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      // if (locationprovider.distance <= 1.0)
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              builder: ((context) => ClaimedSheet()));
                        },
                        child: Container(
                          height: 62.h,
                          width: 170.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xFF08BA64),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Text(
                            "Claim Discount",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
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
}
