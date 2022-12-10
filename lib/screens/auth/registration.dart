import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'dart:async';

import 'package:travel_app_master/screens/auth/controller/auth_controller.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // TextEditingController emailController = TextEditingController();
  // TextEditingController nameController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController confirmPasswordController = TextEditingController();
  // TextEditingController dobdayController = TextEditingController();
  // TextEditingController dobmonthController = TextEditingController();
  // TextEditingController dobyearController = TextEditingController();
  // TextEditingController genderController = TextEditingController();
  // TextEditingController cityController = TextEditingController();
  // var items = ["Male", "Female", "Other"];

  // List<String> preferlist = [];

  // bool istap = false;
  // final formKey = GlobalKey<FormState>();

  // String imagepath = "";
  // bool location = false;

  AuthController authController = Get.put(AuthController());

  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year - 20),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime(DateTime.now().year + 20));
    if (picked != null) {
      authController.dobdayController.text = DateFormat('dd').format(picked);
      authController.dobmonthController.text = DateFormat('MMM').format(picked);
      authController.dobyearController.text = DateFormat('yyyy').format(picked);
    }
  }

  Future imagepicker() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File file = File(image.path);
      setState(() {
        authController.imagepath = file.path;
      });
    }
  }

  bool loading = false;
  final loc.Location locationn = loc.Location();

  @override
  void initState() {
    super.initState();
    _requestPermission();
    locationn.changeSettings(
        interval: 300, accuracy: loc.LocationAccuracy.high);
    locationn.enableBackgroundMode(enable: true);
    _getLocation();
  }

  _getLocation() async {
    try {
      final loc.LocationData _locationResult = await locationn.getLocation();
      final coordinates =
          Coordinates(_locationResult.latitude, _locationResult.longitude);
      final addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      final first = addresses.first;
      print(
          "fffffffffffffffffffffffffffffffffff ${first.subLocality}  latitude: ${_locationResult.latitude} longitude: ${_locationResult.longitude} ");
      authController.latitude.value = _locationResult.latitude!;
      authController.longitude.value = _locationResult.longitude!;
      //     'Address': first.locality,
      //     'latitude': _locationResult.latitude,
      //     'longitude': _locationResult.longitude,

      Timer.periodic(const Duration(seconds: 2), (Timer t) => _getLocation());
    } catch (e) {
      print(e);
    }
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (authController) {
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
                                children: const [
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
                                hintext: "Full Name",
                                controller: authController.nameController),
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
                                hintext: "Email",
                                controller: authController.emailController),
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
                                        controller:
                                            authController.phoneController)),
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
                              hintext: "Password",
                              controller: authController.passwordController,
                              ispassword: true,
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
                                    controller: authController.dobdayController,
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
                                  controller: authController.dobmonthController,
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
                                  controller: authController.dobyearController,
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
                                    textTheme: const TextTheme(
                                        subtitle1:
                                            TextStyle(color: Colors.white)),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                        hint: Text("Gender",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10.w, 10.h, 10.w, 10.h),
                                          border: InputBorder.none,
                                          isDense: true,
                                        ),
                                        items: const [
                                          DropdownMenuItem(
                                              child: Text(
                                                "Male",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              value: 'Male'),
                                          DropdownMenuItem(
                                              child: Text(
                                                "Female",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              value: 'Female')
                                        ],
                                        onChanged: (value) {
                                          authController.genderController.text =
                                              value.toString();
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
                                    const Text(
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
                                            controller:
                                                authController.cityController)),
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
                                  if (authController.preferlist
                                      .contains("Mountains")) {
                                    authController.preferlist
                                        .remove("Mountains");
                                  } else {
                                    authController.preferlist.add("Mountains");
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: authController.preferlist
                                              .contains("Mountains")
                                          ? Colors.green
                                          : Colors.white.withOpacity(0.40),
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
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
                                  if (authController.preferlist
                                      .contains("Rivers")) {
                                    authController.preferlist.remove("Rivers");
                                  } else {
                                    authController.preferlist.add("Rivers");
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: authController.preferlist
                                              .contains("Rivers")
                                          ? Colors.indigo
                                          : Colors.white.withOpacity(0.40),
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
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
                                  if (authController.preferlist
                                      .contains("Desert")) {
                                    authController.preferlist.remove("Desert");
                                  } else {
                                    authController.preferlist.add("Desert");
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: authController.preferlist
                                              .contains("Desert")
                                          ? Colors.indigo
                                          : Colors.white.withOpacity(0.40),
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
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
                                  value: authController.location,
                                  onChanged: (value) {
                                    setState(() {
                                      authController.location = value;
                                    });
                                  })
                            ],
                          ),
                          SizedBox(height: 62.h),
                          authController.isLoading == true
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : InkWell(
                                  onTap: () {
                                    // registation();
                                    authController.register();
                                  },
                                  child: Center(
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50.h,
                                      width: 151.w,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFf08BA64),
                                          borderRadius:
                                              BorderRadius.circular(25.r)),
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
                                  color:
                                      const Color(0xffEEEFED).withOpacity(0.7),
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
          );
        });
  }

  void _togglePasswordView() {
    setState(() {
      authController.istap = !authController.istap;
    });
  }

  Widget textbox(
      {String? hintext,
      TextEditingController? controller,
      final GestureTapCallback? onTap,
      bool? ispassword = false}) {
    return TextField(
      onTap: onTap,
      style: const TextStyle(color: Colors.white),
      controller: controller,
      obscureText: ispassword == true ? true : false,
      decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          hintText: hintext,
          hintStyle:
              TextStyle(color: const Color(0xFFD0D0D0).withOpacity(0.80)),
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10)),
    );
  }
}
