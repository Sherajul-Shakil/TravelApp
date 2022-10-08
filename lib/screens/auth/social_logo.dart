

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/route.dart';
import '../utilitis/constant/color.dart';
import '../utilitis/social_logo_button.dart';
import 'login.dart';

class SocialLogoScreen extends StatelessWidget {
  const SocialLogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/sign_back.jpeg",
          fit: BoxFit.cover,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black.withOpacity(0.3),
        ),
        Container(
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Container(
                height: 80.h,
                width: 80.w,
                child: Image.asset(
                  "assets/travel_logo.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 318.h),
              Text(
                "Sign in to DD",
                style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 17.h),
              
              Container(
                height: 50.h,
                width: 289.w,
                child: SocialLogoButton(
                    onTap: () {},
                    title: "Continue With Google",
                    image: "assets/google.png",
                    color: PColor.socialLogoButtonColor),
              ),
              SizedBox(height: 13.h),
              SizedBox(
                height: 50.h,
                width: 289.w,
                child: SocialLogoButton(
                    onTap: () {},
                    title: "Continue With Facebook",
                    image: "assets/facebook.png",
                    color: PColor.socialLogoButtonColor),
              ),
              SizedBox(height: 13.h),
              SizedBox(
                height: 50.h,
                width: 289.w,
                child: SocialLogoButton(
                    onTap: () {},
                    title: "Continue With Apple",
                    image: "assets/apple.png",
                    color: PColor.socialLogoButtonColor),
              ),
              SizedBox(height: 52.h),
              GestureDetector(
                onTap: () {
                  newpage(LogInScreen(), context);
                },
                child: Container(
                    width: 194.w,
                    height: 46.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color(0xffEEEFED).withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      "Continue with Email",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.75)),
                    )),
              ),
              SizedBox(height: 24.h),
              Text(
                "Skip for now",
                style: TextStyle(
                    color: Color(0xffEEEFED).withOpacity(0.7),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
