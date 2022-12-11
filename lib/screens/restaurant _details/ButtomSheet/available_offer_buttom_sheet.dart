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
                    "https://static.theprint.in/wp-content/uploads/2022/10/Hotel.jpg?compress=true&quality=80&w=376&dpr=2.6",
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
                      "Double Room",maxLines: 1,
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

}
