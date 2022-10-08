import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app_master/screens/auth/registration.dart';
import 'package:travel_app_master/screens/navigation.dart';

import '../../Http/from.dart';
import '../utilitis/custom_textfield.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;

  bool istap = false;

  bool loading = false;

  Future login() async {
    setState(() {
      loading = true;
    });
    await HttpForm().login(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        Controller: emailController,
                        color: Color(0xffF7F7F7).withOpacity(0.4),
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
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )),
                        title: "A secure password",
                        Controller: passwordController,
                        color: Color(0xffF7F7F7).withOpacity(0.4),
                      ),
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : InkWell(
                            onTap: () {
                              login();
                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: ((context) =>
                              //             NavigationScreen())),
                              //     (route) => false);
                            },
                            child: Container(
                              height: 50.h,
                              width: 151.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(25.r)),
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
                                builder: ((context) => RegistrationScreen())));
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
        // body: Container(
        //   decoration: BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage("assets/login_back.jpeg"),
        //           fit: BoxFit.cover)),
        //   child: Column(
        //     children: [
        //       Expanded(
        //         child: SingleChildScrollView(
        //           physics: BouncingScrollPhysics(),
        //           child: Form(
        //             key: formKey,
        //             child: Container(
        //               padding: EdgeInsets.only(top: 10),
        //               width: double.infinity,
        //               height: MediaQuery.of(context).size.height,
        //               child: Column(
        //                 //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Image.asset("assets/travel_logo.png",
        //                       height: 90, width: 90),
        //                   SizedBox(height: 15),
        //                   Column(
        //                     children: [
        //                       Text("Email sign in",
        //                           style: TextStyle(
        //                               fontSize: 32,
        //                               color: Colors.white,
        //                               fontWeight: FontWeight.w700)),
        //                       Divider(
        //                           color: Colors.white.withOpacity(0.5),
        //                           thickness: 2,
        //                           indent: 180,
        //                           endIndent: 180),
        //                       SizedBox(height: 49),
        //                       Padding(
        //                         padding:
        //                             const EdgeInsets.symmetric(horizontal: 20),
        //                         child: Column(
        //                           children: [
        //                             CustomTextfield1(
        //                               readOnly: false,
        //                               obscureText: false,
        //                               title: "Your email address",
        //                               Controller: emailController,
        //                               color: Color(0xffF7F7F7).withOpacity(0.4),
        //                             ),
        //                             SizedBox(height: 15),
        //                             CustomTextfield1(
        //                               Controller: passwordController,
        //                               color: PColor.socialLogoButtonColor,
        //                               title: "A secure password",
        //                               obscureText: !istap,
        //                               readOnly: false,
        //                               icon: InkWell(
        //                                 onTap: _togglePasswordView,
        //                                 child: Icon(
        //                                   istap
        //                                       ? Icons.visibility
        //                                       : Icons.visibility_off,
        //                                   color: Colors.white,
        //                                 ),
        //                               ),
        //                             )
        //                           ],
        //                         ),
        //                       ),
        //                       SizedBox(height: 10),
        //                       Container(
        //                         alignment: Alignment.centerRight,
        //                         padding:
        //                             const EdgeInsets.symmetric(horizontal: 20),
        //                         child: TextButton(
        //                           onPressed: () {},
        //                           child: Text(
        //                             "Forgot password?",
        //                             style: TextStyle(
        //                                 color: Color(0xff08BA64), fontSize: 18),
        //                           ),
        //                         ),
        //                       ),
        //                       SizedBox(height: 20),
        //                       TextButton(
        //                         onPressed: () {
        //                           // Helper.toScreen(
        //                           //     context, SocialLogoScreen());
        //                         },
        //                         child: Text(
        //                           "Don't Have an Account? Sign Up",
        //                           style: TextStyle(
        //                               color: Color(0xff08BA64), fontSize: 18),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //           width: 150,
        //           height: 50,
        //           child: CustomButton(
        //             onTap: () {
        //               // login(context, authProvider);
        //             },
        //             title: "Continue",
        //             size: 16,
        //             color: PColor.submitButtonColor,
        //           )),
        //       SizedBox(height: 10),
        //     ],
        //   ),
        // ),
      ),
    );
  }

  void _togglePasswordView() {
    // if (ishiddenPassword == true) {
    //   ishiddenPassword = false;
    // } else {
    //   ishiddenPassword = true;
    // }
    setState(() {
      istap = !istap;
    });
  }
}
