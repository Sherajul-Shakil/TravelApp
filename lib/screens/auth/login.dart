import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_app_master/screens/auth/controller/auth_controller.dart';
import 'package:travel_app_master/screens/auth/registration.dart';
import 'package:travel_app_master/screens/navigation.dart';

import '../utilitis/custom_textfield.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;

  // bool istap = false;

  // bool loading = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (authController) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.black,
              body: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/login_back.jpeg",
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  SingleChildScrollView(
                    child: Container(
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
                          SizedBox(height: 303.h),
                          Text(
                            "Email sign in",
                            style: TextStyle(
                                fontSize: 30.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            height: 2.h,
                            width: 50.w,
                            color: Colors.white.withOpacity(0.50),
                          ),
                          SizedBox(height: 49.h),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 33.w),
                            child: CustomTextfield1(
                              readOnly: false,
                              obscureText: false,
                              title: "Your email address",
                              Controller: authController.emailController,
                              color: const Color(0xffF7F7F7).withOpacity(0.4),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 33.w),
                            child: CustomTextfield1(
                              readOnly: false,
                              obscureText: obscureText,
                              icon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  child: obscureText
                                      ? const Icon(
                                          Icons.visibility_off,
                                          color: Colors.black,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: Colors.black,
                                        )),
                              title: "A secure password",
                              Controller: authController.passwordController,
                              color: const Color(0xffF7F7F7).withOpacity(0.4),
                            ),
                          ),
                          SizedBox(
                            height: 34.h,
                          ),
                          authController.isLoading == true
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : InkWell(
                                  onTap: () {
                                    authController.login();
                                    // login();
                                    // Navigator.pushAndRemoveUntil(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: ((context) =>
                                    //             const NavigationScreen())),
                                    //     (route) => false);
                                  },
                                  child: Container(
                                    height: 50.h,
                                    width: 151.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(25.r)),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                          SizedBox(height: 20.h),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const RegistrationScreen())));
                            },
                            child: Text(
                              "Don't have account? Registation",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  // void _togglePasswordView() {
  //   setState(() {
  //     istap = !istap;
  //   });
  // }
}
