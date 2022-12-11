
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactForBooking extends StatefulWidget {
  const ContactForBooking({Key? key}) : super(key: key);

  @override
  State<ContactForBooking> createState() => _ContactForBookingState();
}

class _ContactForBookingState extends State<ContactForBooking> {
  @override
  Widget build(BuildContext context) {
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
              "Contact for Booking",
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

                  SizedBox(
                    height: 15,
                  ),
                  Text("You have to contact Seagull Hotel and confirm your booking. After confirming the booking, claim discount and enjoy your deal."),
                  SizedBox(
                    height: 15,
                  ),
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
                      leading:  Icon(Icons.email_outlined,size: 30,),
                      trailing: Icon(Icons.arrow_forward_ios,color: Colors.black26,),
                      title: Text("Privacy Policy",style: TextStyle(color: Colors.black54),),
                    ),
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
