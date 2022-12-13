import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_app_master/screens/Search/searchhotel.dart';
import 'package:travel_app_master/screens/Search/selected_area.dart';
import 'package:travel_app_master/screens/home/home_controller.dart';
import 'package:travel_app_master/screens/restaurant%20_details/restaurant_page.dart';
import '../../utilites/route.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  HomeController _homeController = Get.put(HomeController());
  bool isTap = false;
  final TextEditingController _dobController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  // Locationprovider? _locationprovider;
  bool loading = false;
  int searhchotel = 0;
  String? areaselect;
  // final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _searchController = new TextEditingController(text: widget.searchItem.toString());
  }

  @override
  void dispose() {
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101, 9));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _homeController.date1.text = DateFormat.yMMMd().format(selectedDate);
      });
    }
  }

  DateTime selectedDate2 = DateTime.now();
  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101, 9));
    if (picked != null && picked != selectedDate2) {
      setState(() {
        selectedDate2 = picked;

        _homeController.date2.text =
            "${DateFormat.yMMMd().format(selectedDate2)}";
      });
    }
  }

  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year - 20),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime(DateTime.now().year));
    if (picked != null)
      setState(() {
        _dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
  }

  int value = 0;

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<Hotelprovider>(context);
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return Scaffold(
            backgroundColor: const Color(0xffF7F7F7),
            body: homeController.isLoading == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 217.h,
                          width: 414.w,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                "assets/restaurent.png",
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 76.h,
                                left: 24.w,
                                child: Text(
                                  "Where do \nyou wanna go?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Positioned(
                                top: 77.h,
                                right: 25.w,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(11.r),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(16.r)),
                                      child: Image.asset("assets/rainy.png"),
                                    ),
                                    const Text(
                                      "Rainy",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              )
                            ],
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -20),
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height / 1.62,
                                decoration: const BoxDecoration(
                                    color: Color(0xffF7F7F7),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                              ),
                              Transform.translate(
                                offset: const Offset(0, -20),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Form(
                                            key: formkey,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Expanded(
                                                child: Container(
                                                  width: 290.w,
                                                  height: 48.h,
                                                  child: TextFormField(
                                                    controller: homeController
                                                        .searchController,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      contentPadding:
                                                          EdgeInsets.all(10.r),
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      prefixIcon: const Icon(Icons
                                                          .location_on_outlined),
                                                      suffixIcon: InkWell(
                                                        onTap: () {},
                                                        child: const Icon(
                                                          Icons.arrow_forward,
                                                          color:
                                                              Color(0xff08BA64),
                                                          size: 20,
                                                        ),
                                                      ),
                                                      labelStyle:
                                                          const TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      hintText:
                                                          "Where do you wanna go?",
                                                      hintStyle:
                                                          const TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      disabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // locationdata();
                                              _showModalBottomSheetContact(
                                                  BuildContext, context);
                                            },
                                            child: Container(
                                              width: 47,
                                              height: 48.h,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff08BA64),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r)),
                                              child: Image.asset(
                                                "assets/book.png",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                width: 254.w,
                                                height: 48.h,
                                                child: TextFormField(
                                                  controller:
                                                      _homeController.date1,
                                                  style: const TextStyle(
                                                      color: Colors.grey),
                                                  readOnly: true,
                                                  //  controller: _dobController,
                                                  onTap: () {
                                                    _selectDate(context);
                                                  },
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .fromLTRB(
                                                            10, 10, 10, 10),
                                                    fillColor: Colors.white,
                                                    hintText: "Start Date",
                                                    hintStyle: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                    prefixIcon: IconButton(
                                                      onPressed: () =>
                                                          //_selectDateFromPicker(context),
                                                          _selectDate(context),
                                                      icon: const Icon(
                                                          Icons
                                                              .calendar_today_outlined,
                                                          color: Colors.grey),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    ),
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: 254.w,
                                                height: 48.h,
                                                child: TextFormField(
                                                  // initialValue:"",
                                                  controller:
                                                      _homeController.date2,
                                                  style: const TextStyle(
                                                      color: Colors.grey),
                                                  readOnly: true,
                                                  //  controller: _dobController,
                                                  onTap: () {
                                                    _selectDate2(context);
                                                  },
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .fromLTRB(
                                                            10, 10, 10, 10),
                                                    fillColor: Colors.white,
                                                    hintText: "End Date",
                                                    hintStyle: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                    prefixIcon: IconButton(
                                                      onPressed: () =>
                                                          //_selectDateFromPicker(context),
                                                          _selectDate2(context),
                                                      icon: const Icon(
                                                          Icons
                                                              .calendar_today_outlined,
                                                          color: Colors.grey),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    ),
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // if (formkey.currentState!.validate()) {
                                              //   formkey.currentState!.save();
                                              //   setState(() {
                                              //     searhchotel = 4;
                                              //     provider.hotelsearch(
                                              //         area: areaselect);
                                              //   });
                                              // }
                                            },
                                            child: Container(
                                              width: 48.h,
                                              height: 48.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r)),
                                              child: const Icon(Icons.search),
                                            ),
                                          ),
                                          Container(
                                            width: 48.h,
                                            height: 48.w,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.r)),
                                            child: Image.asset(
                                              "assets/icon_slider.png",
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Divider(
                                        color: const Color(0xFFD0D0D0)
                                            .withOpacity(0.80),
                                        thickness: 1.5,
                                        indent: 15,
                                        endIndent: 15,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      categoryItem(),
                                      if (homeController.selectedcategory == 0)
                                        hotels(),
                                      if (homeController.selectedcategory == 1)
                                        restorent(),
                                      if (searhchotel == 4)
                                        HotelSearchPage(area: areaselect!),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }

  Widget categoryItem() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CustomRadioButton("Hotel/Resort", 1, "assets/hotel.png"),
          const SizedBox(
            width: 10,
          ),
          CustomRadioButton("Restaurant", 2, "assets/restaurant.png"),
          const SizedBox(
            width: 10,
          ),
          CustomRadioButton("Flight", 3, "assets/flight.png")
        ],
      ),
    );
  }

  Widget hotels() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              height: 144.h,
              width: 365.w,
              margin: EdgeInsets.all(10.r),
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r)),
                        child: Image.network(
                          "https://media-cdn.tripadvisor.com/media/photo-s/15/99/54/30/swimming-pool.jpg",
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
                            "Hotel Name Here jsdhkj skdn dkjsd sdknsd ",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 15),
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
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    "Hotel",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    "Restaurant",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.h),
                          RatingBar.builder(
                            itemSize: 16.r,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(Icons.star,
                                size: 5, color: Colors.orangeAccent),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text(
                            "10 review",
                            style: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.w300),
                          )
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
                              "600" + " tk",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff08BA64)),
                            ),
                            Text(
                              "200" + " tk",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.lineThrough,
                                  color: const Color(0xff08BA64)),
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
        }));
  }

  Widget restorent() {
    // final provider = Provider.of<Hotelprovider>(context);
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: ((context, index) {
          // var data = provider.restorent!.data![index];
          return InkWell(
            onTap: () {
              newpage(const RestaurantScreen(), context);
            },
            child: Container(
              height: 144.h,
              width: 365.w,
              margin: EdgeInsets.all(10.r),
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r)),
                        child: Image.network(
                          "https://media-cdn.tripadvisor.com/media/photo-s/05/5d/3d/36/getlstd-property-photo.jpg",
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
                            "Restaurant Name",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 15),
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
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "Restaurant",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          RatingBar.builder(
                            itemSize: 16.r,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(Icons.star,
                                size: 5, color: Colors.orangeAccent),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text(
                            "10 review",
                            style: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.w300),
                          )
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
                              "600" + " tk",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff08BA64)),
                            ),
                            Text(
                              "200" + " tk",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.lineThrough,
                                  color: const Color(0xff08BA64)),
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
        }));
  }

  _showModalBottomSheetContact(BuildContext, context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          //  physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 350,
                  height: 580,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Image.asset("assets/map.png",
                              fit: BoxFit.contain)),
                      TextPosition(
                          placesNumber: 12, txt: "places", top: 75, left: 60),
                      TextPosition(
                          placesNumber: 8, txt: "places", top: 160, left: 51),
                      TextPosition(
                          placesNumber: 39, txt: "places", top: 230, left: 130),
                      TextPosition(
                          placesNumber: 30,
                          txt: "places",
                          bottom: 220,
                          left: 100),
                      TextPosition(
                          placesNumber: 64,
                          txt: "places",
                          bottom: 180,
                          right: 20),
                      TextPosition(
                          placesNumber: 55, txt: "places", top: 188, right: 70),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: ((context) => const SelectedAreaPage()));
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff08BA64),
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.white,
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Use my location",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 25,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget CustomRadioButton(String text, int index, String img) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: (value == index) ? Colors.green : Colors.transparent),
          borderRadius: BorderRadius.circular(10.r)),
      child: InkWell(
        onTap: () {
          setState(() {
            value = index;
          });
        },
        child: Row(
          children: [
            Container(
              height: 20.h,
              width: 20.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r)),
              child: Image.asset(img),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                text,
                style: TextStyle(
                    color: (value == index) ? Colors.green : Colors.black54,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Positioned TextPosition(
    {int? placesNumber,
    String? txt,
    double? bottom,
    double? right,
    double? left,
    double? top}) {
  return Positioned(
    bottom: bottom != null ? bottom : null,
    right: right != null ? right : null,
    left: left != null ? left : null,
    top: top != null ? top : null,
    child: Column(
      children: [
        Text(
          placesNumber!.toString(),
          style: const TextStyle(
              color: Color(0xff08BA64),
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        Text(
          txt!,
          style: const TextStyle(
              color: Color(0xff08BA64),
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
      ],
    ),
  );
}
