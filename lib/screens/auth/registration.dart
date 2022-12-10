import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController dobdayController = TextEditingController();
  TextEditingController dobmonthController = TextEditingController();
  TextEditingController dobyearController = TextEditingController();
  TextEditingController genderController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  var items = ["Male", "Female", "Other"];

  List<String> preferlist = [];

  bool istap = false;
  final formKey = GlobalKey<FormState>();

  String imagepath = "";
  bool location = false;

  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year - 20),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime(DateTime.now().year + 20));
    if (picked != null) {
      dobdayController.text = DateFormat('dd').format(picked);
      dobmonthController.text = DateFormat('MMM').format(picked);
      dobyearController.text = DateFormat('yyyy').format(picked);
    }
  }

  Future imagepicker() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File file = File(image.path);
      setState(() {
        imagepath = file.path;
      });
    }
  }

  bool loading = false;

  // Future registation() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   await HttpForm().registation(
  //       context: context,
  //       birthday:
  //           "${dobdayController.text} ${dobmonthController.text} ${dobyearController.text}",
  //       city: cityController.text,
  //       email: emailController.text,
  //       gender: genderController.text,
  //       name: nameController.text,
  //       number: phoneController.text,
  //       password: passwordController.text,
  //       prefer: preferlist.join(",").toString(),
  //       location: "23.810331,90.412521");
  //   setState(() {
  //     loading = false;
  //   });
  //   // print(preferlist.join(",").toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/4.png",
              fit: BoxFit.cover,
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.3),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(left: 32.w, right: 32.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 58.h),
                    Center(
                      child: Text(
                        "Registation",
                        style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 108.h),
                    Center(
                      child: Container(
                        height: 0.h,
                        width: 0.w,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // CircleAvatar(
                            //   radius: 25,
                            //   backgroundImage: FileImage(File(imagepath)),
                            // ),
                            // Positioned(
                            //   bottom: 10.h,
                            //   right: 5.w,
                            //   child: InkWell(
                            //     onTap: () {
                            //       imagepicker();
                            //     },
                            //     child: Container(
                            //       height: 22.h,
                            //       width: 22.w,
                            //       decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           borderRadius:
                            //               BorderRadius.circular(100.r)),
                            //       child: Icon(
                            //         Icons.camera_alt,
                            //         size: 15,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(height: 39.h),
                    Container(
                      height: 50.h,
                      width: 350.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.40),
                          borderRadius: BorderRadius.circular(27.r)),
                      child: textbox(
                          hintext: "Full Name", controller: nameController),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 50.h,
                      width: 350.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.40),
                          borderRadius: BorderRadius.circular(27.r)),
                      child: textbox(
                          hintext: "Email", controller: emailController),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 50.h,
                      width: 350.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.40),
                          borderRadius: BorderRadius.circular(27.r)),
                      child: Row(
                        children: [
                          SizedBox(width: 10.w),
                          Text(
                            "+880",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            height: 20,
                            width: 2,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          Flexible(
                              child: textbox(
                                  hintext: "Phone",
                                  controller: phoneController)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 50.h,
                      width: 350.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.40),
                          borderRadius: BorderRadius.circular(27.r)),
                      child: textbox(
                          hintext: "Password", controller: passwordController),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 50.h,
                      width: 350.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.40),
                          borderRadius: BorderRadius.circular(27.r)),
                      child: Row(
                        children: [
                          SizedBox(width: 10.w),
                          const Text(
                            "Birthday",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 10.w),
                          Flexible(
                            child: textbox(
                              hintext: "day",
                              controller: dobdayController,
                              onTap: () {
                                _selectDateFromPicker(context);
                              },
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 2,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          Flexible(
                              child: textbox(
                            hintext: "month",
                            controller: dobmonthController,
                            onTap: () {
                              _selectDateFromPicker(context);
                            },
                          )),
                          Container(
                            height: 20,
                            width: 2,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          Flexible(
                              child: textbox(
                            hintext: "year",
                            controller: dobyearController,
                            onTap: () {
                              _selectDateFromPicker(context);
                            },
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50.h,
                          width: 113.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.40),
                              borderRadius: BorderRadius.circular(27.r)),
                          child: Theme(
                            data: ThemeData(
                              textTheme: TextTheme(
                                  subtitle1: TextStyle(color: Colors.white)),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        10.w, 10.h, 10.w, 10.h),
                                    border: InputBorder.none,
                                    isDense: true,
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                        child: Text(
                                          "Male",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: 'Male'),
                                    DropdownMenuItem(
                                        child: Text(
                                          "Female",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: 'Female')
                                  ],
                                  onChanged: (value) {
                                    genderController.text = value.toString();
                                  }),
                            ),
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Container(
                          height: 50.h,
                          width: 231.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.40),
                              borderRadius: BorderRadius.circular(27.r)),
                          child: Row(
                            children: [
                              SizedBox(width: 10.w),
                              Text(
                                "City",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                height: 20,
                                width: 2,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              Flexible(
                                  child: textbox(
                                      hintext: "Dhaka",
                                      controller: cityController)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 28.h),
                    Text(
                      "What do you prefer?",
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(height: 11.h),
                    Wrap(
                      children: [
                        InkWell(
                          onTap: () {
                            if (preferlist.contains("Mountains")) {
                              preferlist.remove("Mountains");
                            } else {
                              preferlist.add("Mountains");
                            }
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                color: preferlist.contains("Mountains")
                                    ? Colors.green
                                    : Colors.white.withOpacity(0.40),
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Text(
                              "Mountains",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        InkWell(
                          onTap: () {
                            if (preferlist.contains("Rivers")) {
                              preferlist.remove("Rivers");
                            } else {
                              preferlist.add("Rivers");
                            }
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                color: preferlist.contains("Rivers")
                                    ? Colors.indigo
                                    : Colors.white.withOpacity(0.40),
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Text(
                              "Rivers",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        InkWell(
                          onTap: () {
                            if (preferlist.contains("Desert")) {
                              preferlist.remove("Desert");
                            } else {
                              preferlist.add("Desert");
                            }
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                color: preferlist.contains("Desert")
                                    ? Colors.indigo
                                    : Colors.white.withOpacity(0.40),
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Text(
                              "Desert",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Enable location for better experience",
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        Switch(
                            value: location,
                            onChanged: (value) {
                              setState(() {
                                location = value;
                              });
                            })
                      ],
                    ),
                    SizedBox(height: 62.h),
                    loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : InkWell(
                            onTap: () {
                              // registation();
                            },
                            child: Center(
                              child: Container(
                                alignment: Alignment.center,
                                height: 50.h,
                                width: 151.w,
                                decoration: BoxDecoration(
                                    color: Color(0xFf08BA64),
                                    borderRadius: BorderRadius.circular(25.r)),
                                child: Text(
                                  "Registation",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 24.h),
                    Center(
                      child: Text(
                        "Skip for now",
                        style: TextStyle(
                            color: Color(0xffEEEFED).withOpacity(0.7),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // body: Form(
      //   key: formKey,
      //   child: SingleChildScrollView(
      //     child: Container(
      //       decoration: BoxDecoration(
      //           image: DecorationImage(
      //               image: AssetImage("assets/login_back.jpeg"),
      //               fit: BoxFit.cover)),
      //       child: Container(
      //         padding: EdgeInsets.only(top: 30),
      //         width: double.infinity,
      //         height: MediaQuery.of(context).size.height,
      //         child: SingleChildScrollView(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Image.asset("assets/travel_logo.png"),
      //               Column(
      //                 children: [
      //                   Text(
      //                     "Email sign up",
      //                     style: TextStyle(
      //                         fontSize: 32,
      //                         color: Colors.white,
      //                         fontWeight: FontWeight.w700),
      //                   ),
      //                   Divider(
      //                     color: Colors.white.withOpacity(0.5),
      //                     thickness: 2,
      //                     indent: 180,
      //                     endIndent: 180,
      //                   ),
      //                   SizedBox(
      //                     height: 49,
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.symmetric(horizontal: 20),
      //                     child: Column(
      //                       children: [
      //                         CustomTextfield1(
      //                           readOnly: false,
      //                           obscureText: false,
      //                           title: "Full Name",
      //                           Controller: nameController,
      //                           color: PColor.textfieldColor,
      //                         ),
      //                         SizedBox(height: 15),
      //                         CustomTextfield1(
      //                           readOnly: false,
      //                           obscureText: false,
      //                           title: "Your email address",
      //                           Controller: emailController,
      //                           color: PColor.textfieldColor,
      //                         ),
      //                         SizedBox(height: 15),
      //                         CustomTextfield1(
      //                           readOnly: false,
      //                           obscureText: false,
      //                           title: "Your City",
      //                           Controller: cityController,
      //                           color: PColor.textfieldColor,
      //                         ),
      //                         SizedBox(height: 15),
      //                         IntlPhoneField(
      //                           controller: phoneController,
      //                           style: TextStyle(color: Colors.white),
      //                           initialCountryCode: 'BD',
      //                           onChanged: (phone) {
      //                             print(phone.completeNumber);
      //                           },
      //                           decoration: InputDecoration(
      //                             filled: true,
      //                             fillColor: Color(0xffF7F7F7).withOpacity(0.4),
      //                             hintText: " Phone  ",
      //                             hintStyle: TextStyle(
      //                               color: Colors.white,
      //                             ),
      //                             border: OutlineInputBorder(
      //                               borderRadius: BorderRadius.circular(27.5),
      //                             ),
      //                             disabledBorder: InputBorder.none,
      //                             focusedBorder: OutlineInputBorder(
      //                               borderSide: const BorderSide(),
      //                               borderRadius: BorderRadius.circular(25.0),
      //                             ),
      //                           ),
      //                         ),
      //                         CustomTextfield1(
      //                           Controller: genderController,
      //                           color: PColor.socialLogoButtonColor,
      //                           title: "Gender",
      //                           obscureText: false,
      //                           readOnly: true,
      //                           icon: PopupMenuButton<String>(
      //                             color: Colors.white,
      //                             icon: const Icon(
      //                               Icons.arrow_drop_down,
      //                               color: Colors.black,
      //                             ),
      //                             onSelected: (String value) {
      //                               genderController.text = value;
      //                             },
      //                             itemBuilder: (BuildContext context) {
      //                               return items.map<PopupMenuItem<String>>(
      //                                   (String value) {
      //                                 return new PopupMenuItem(
      //                                     child: Column(
      //                                       children: [
      //                                         new Text(
      //                                           value,
      //                                         ),
      //                                       ],
      //                                     ),
      //                                     value: value);
      //                               }).toList();
      //                             },
      //                           ),
      //                         ),
      //                         SizedBox(height: 15),
      //                         CustomTextfield1(
      //                           readOnly: true,
      //                           obscureText: false,
      //                           Controller: dobController,
      //                           color: PColor.socialLogoButtonColor,
      //                           title: "Date of Birth ",
      //                           icon: IconButton(
      //                             onPressed: () =>
      //                                 _selectDateFromPicker(context),
      //                             icon: Icon(
      //                               Icons.calendar_today_outlined,
      //                               color: Colors.white.withOpacity(0.4),
      //                             ),
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 15,
      //                         ),
      //                         CustomTextfield1(
      //                           Controller: passwordController,
      //                           color: PColor.socialLogoButtonColor,
      //                           title: "Password",
      //                           obscureText: !istap,
      //                           readOnly: false,
      //                           icon: InkWell(
      //                             onTap: _togglePasswordView,
      //                             child: Icon(
      //                               istap
      //                                   ? Icons.visibility
      //                                   : Icons.visibility_off,
      //                               color: Colors.white,
      //                             ),
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 15,
      //                         ),
      //                         CustomTextfield1(
      //                             readOnly: false,
      //                             obscureText: false,
      //                             Controller: confirmPasswordController,
      //                             color: PColor.textfieldColor,
      //                             title: "Confirm password")
      //                       ],
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     height: 30,
      //                   ),
      //                   SizedBox(
      //                     width: 150,
      //                     height: 50,
      //                     child: CustomButton(
      //                       onTap: () {},
      //                       title: "Continue",
      //                       size: 18,
      //                       color: PColor.submitButtonColor,
      //                       icon: Icons.arrow_forward,
      //                       iconColor: Colors.white,
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.only(left: 25),
      //                     child: Row(
      //                       children: [
      //                         Text(
      //                           "Already have an account?",
      //                           style: TextStyle(
      //                               fontSize: 18, color: Colors.white),
      //                         ),
      //                         TextButton(
      //                           onPressed: () {
      //                             Navigator.push(
      //                                 context,
      //                                 MaterialPageRoute(
      //                                     builder: (_) => LogInScreen()));
      //                           },
      //                           child: Text(
      //                             "Log in",
      //                             style: TextStyle(
      //                                 color: Color(0xff08BA64), fontSize: 18),
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     height: 20,
      //                   )
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
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

  Widget textbox(
      {String? hintext,
      TextEditingController? controller,
      final GestureTapCallback? onTap}) {
    return TextField(
      onTap: onTap,
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          hintText: hintext,
          hintStyle: TextStyle(color: Color(0xFFD0D0D0).withOpacity(0.80)),
          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
    );
  }
}
