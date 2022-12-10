import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClaimedSheet extends StatefulWidget {
  const ClaimedSheet({Key? key}) : super(key: key);

  @override
  State<ClaimedSheet> createState() => _ClaimedSheetState();
}

class _ClaimedSheetState extends State<ClaimedSheet> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFfF7F7F7),
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
        ),

        child: Column(
          children: [
            SizedBox(height: 25.h),
            Text(
              "Successfully Claimed!",
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
                  Center(child: Image.asset("assets/claimd.png")),
                  SizedBox(
                    height: 15,
                  ),
                  Text("You have successfully claimed the discount through DD Travel. To enjoy the discount, call Seagull Hotel and provide your discount id. You will get this amazing discount!"),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // if (locationprovider.distance >= 1.0)
                      Container(
                        height: 62.h,
                        width: 170.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFF08BA64).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Text(
                          "My Discount",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      // if (locationprovider.distance <= 1.0)
                      Container(
                        height: 62.h,
                        width: 170.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xFF08BA64),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.call,color: Colors.white,),
                            SizedBox(width: 10,),
                            Text(
                              "Call the Hotel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
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
