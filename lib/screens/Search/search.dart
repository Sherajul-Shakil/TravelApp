import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_master/screens/Search/searchhotel.dart';

import '../../utilites/route.dart';
import '../restaurant _details/hoteldetails.dart';
import 'datepicker.dart';
import 'dropdown.dart';

class SearchScreen extends StatefulWidget {
  final int selectedcategory;
  const SearchScreen({Key? key, required this.selectedcategory})
      : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isTap = false;
  TextEditingController _dobController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  // Locationprovider? _locationprovider;
  bool loading = false;
  int searhchotel = 0;
  String? areaselect;

  // Future locationdata() async {
  //   _locationprovider = Provider.of<Locationprovider>(context, listen: false);
  //   await _locationprovider!.locationenablecheck();
  //   await _locationprovider!.getcurrectlocation();
  // }

  // Future loadalldata() async {
  //   final provider = Provider.of<Hotelprovider>(context, listen: false);
  //   await provider.getdblocation();
  //   await provider.getrestorent();
  //   setState(() {
  //     loading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   loadalldata();
  //   super.initState();
  // }

  @override
  void dispose() {
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<Hotelprovider>(context);
    return Scaffold(
      body: loading
          ? Center(
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
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(16.r)),
                                child: Image.asset("assets/rainy.png"),
                              ),
                              Text(
                                "Rainy",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        )
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -20),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 1.62,
                          decoration: BoxDecoration(
                              color: Color(0xffF7F7F7),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                        ),
                        Transform.translate(
                          offset: Offset(0, -20),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Form(
                                      key: formkey,
                                      child: Container(
                                        width: 310.w,
                                        height: 48.h,
                                        // child: dropdownleague(),
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
                                            color: Color(0xff08BA64),
                                            borderRadius:
                                                BorderRadius.circular(16.r)),
                                        child: Image.asset(
                                          "assets/book.png",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 254.w,
                                      height: 48.h,
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.grey),
                                        readOnly: true,
                                        controller: _dobController,
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: ((context) =>
                                                  DatepickerPage()));
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          isDense: true,
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          fillColor: Colors.white,
                                          hintText: "21 Nov - 1 Dec",
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          prefixIcon: IconButton(
                                            onPressed: () =>
                                                _selectDateFromPicker(context),
                                            icon: Icon(
                                                Icons.calendar_today_outlined,
                                                color: Colors.grey),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          disabledBorder: InputBorder.none,
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                      ),
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
                                                BorderRadius.circular(16.r)),
                                        child: Icon(Icons.search),
                                      ),
                                    ),
                                    Container(
                                      width: 48.h,
                                      height: 48.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16.r)),
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
                                  color: Color(0xFFD0D0D0).withOpacity(0.80),
                                  thickness: 1.5,
                                  indent: 15,
                                  endIndent: 15,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                category(),
                                // Container(
                                //   height: 48.h,cb
                                //   width: double.infinity,
                                //   child: ListView.builder(
                                //     itemCount: 4,
                                //     scrollDirection: Axis.horizontal,
                                //     itemBuilder: (context, index) {
                                //       return Column(
                                //         children: [
                                //           Container(
                                //             height: 48.h,
                                //             width: 150.w,
                                //             margin: EdgeInsets.only(right: 8.w),
                                //             decoration: BoxDecoration(
                                //                 color: Colors.white,
                                //                 borderRadius:
                                //                     BorderRadius.circular(16.r)),
                                //             child: Row(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment.center,
                                //               children: [
                                //                 Container(
                                //                     height: 30.h,
                                //                     width: 30.w,
                                //                     child: Image.asset(
                                //                         'assets/hotel.png')),
                                //                 SizedBox(width: 4.w),
                                //                 Text(
                                //                   "Hotel/Resort",
                                //                   style: TextStyle(
                                //                       fontSize: 16.sp,
                                //                       fontWeight: FontWeight.w400),
                                //                 )
                                //               ],
                                //             ),
                                //           ),
                                //         ],
                                //       );
                                //     },
                                //   ),
                                // ),
                                if (widget.selectedcategory == 0) hotels(),
                                if (widget.selectedcategory == 1) restorent(),
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
  }

  Widget category() {
    // final provider = Provider.of<Hotelprovider>(context);
    return Container(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          // var data = provider.category!.data![index];
          return InkWell(
            onTap: () {
              setState(() {
                searhchotel = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                children: [
                  Container(
                    height: 20.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Image.network(
                        "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "categoryTitle!",
                    style: TextStyle(
                        color: Color(0xFf9C9C9C),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 20,
          );
        },
      ),
    );
  }

  // Widget dropdownleague() {
  //   final currentlocation = Provider.of<Locationprovider>(context);
  //   return Consumer<Hotelprovider>(builder: ((context, value, child) {
  //     return DropdownSearch<String>(
  //       items: List.generate(value.dbLocation!.data!.length,
  //           (index) => value.dbLocation!.data![index].name!),
  //       itemAsString: (value) => value,
  //       onSaved: (newValue) {
  //         setState(() {
  //           areaselect = newValue;
  //         });
  //       },
  //       validator: (value) {
  //         if (value!.isEmpty) {
  //           return;
  //         }
  //       },
  //       selectedItem: areaselect ?? null,
  //       // selectedItem: currentlocation.currentlocation == null
  //       //     ? null
  //       //     : _locationprovider!.currentlocation!.place!.area,
  //       popupProps: PopupProps.menu(
  //         showSearchBox: true,
  //         // menuProps: const MenuProps(backgroundColor: Color(0xFF0C1837)),
  //         searchFieldProps: TextFieldProps(
  //             decoration: InputDecoration(
  //           hintText: "Search League",
  //           hintStyle: const TextStyle(color: Colors.grey),
  //           isDense: true,
  //           contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
  //           border: OutlineInputBorder(
  //               borderSide: BorderSide(color: Colors.white.withOpacity(0.2))),
  //           enabledBorder: OutlineInputBorder(
  //               borderSide: BorderSide(color: Colors.white.withOpacity(0.2))),
  //           focusedBorder: OutlineInputBorder(
  //               borderSide: BorderSide(color: Colors.white.withOpacity(0.2))),
  //         )),
  //         // itemBuilder: (context, value, bools) {
  //         //   return ListTile(
  //         //     title: Row(
  //         //       children: [
  //         //         Container(
  //         //           height: 30.h,
  //         //           width: 30.w,
  //         //           child: CachedNetworkImage(
  //         //             imageUrl: value.league!.logo!,
  //         //             placeholder: (context, url) =>
  //         //                 const CircularProgressIndicator(),
  //         //             errorWidget: (context, url, error) =>
  //         //                 const Icon(Icons.error),
  //         //           ),
  //         //         ),
  //         //         SizedBox(width: 10.w),
  //         //         Text(value.league!.name!),
  //         //       ],
  //         //     ),
  //         //   );
  //         // },
  //       ),
  //       // dropdownDecoratorProps: DropDownDecoratorProps(
  //       //   baseStyle: const TextStyle(color: Colors.white),
  //       //   dropdownSearchDecoration: InputDecoration(
  //       //     hintText: "Select Location",
  //       //     hintStyle: const TextStyle(color: Colors.grey),
  //       //     border: OutlineInputBorder(
  //       //         borderSide: BorderSide(color: Colors.white.withOpacity(0.2))),
  //       //     enabledBorder: OutlineInputBorder(
  //       //         borderSide: BorderSide(color: Colors.white.withOpacity(0.2))),
  //       //     focusedBorder: OutlineInputBorder(
  //       //         borderSide: BorderSide(color: Colors.white.withOpacity(0.2))),
  //       //     isDense: true,
  //       //     fillColor: Colors.white,
  //       //     filled: true,
  //       //     contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
  //       //   ),
  //       // ),
  //     );
  //   }));
  // }

  Widget hotels() {
    // final provider = Provider.of<Hotelprovider>(context);
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: ((context, index) {
          // var data = provider.hotels!.data[index];
          return InkWell(
            onTap: () {
              // newpage(HoteldetailsPage2(hotelid: data.id, data: data), context);
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
                      child: Image.network(
                        "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8aG90ZWx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                        // data!.hotelImages!,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(width: 10.w),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "data.name",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 15),
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
                        Text("data.hotelTags[0].name"),
                        SizedBox(height: 20.h),
                        RatingBar.builder(
                          itemSize: 20.r,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(Icons.star,
                              size: 5, color: Colors.orangeAccent),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Text(
                          "data.hotelRatings.length review",
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
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
                                  "data.discount%",
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
                              "data.offerPrice tk",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff08BA64)),
                            ),
                            Text(
                              "data.price tk",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.lineThrough,
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
        }));
  }

  Widget restorent() {
    // final provider = Provider.of<Hotelprovider>(context);
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: ((context, index) {
          // var data = provider.restorent!.data![index];
          return InkWell(
            onTap: () {
              newpage(HoteldetailsPage2(), context);
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
                      child: Image.network(
                        "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                        fit: BoxFit.cover,
                      )),
                  SizedBox(width: 10.w),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "restaurantName",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 15),
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
                        Text("data.restaurantTags!"),
                        SizedBox(height: 20.h),
                        RatingBar.builder(
                          itemSize: 20.r,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(Icons.star,
                              size: 5, color: Colors.orangeAccent),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Text(
                          "${0} review",
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
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
                                  "10%",
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
                              "${"500"} tk",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff08BA64)),
                            ),
                            Text(
                              "${"700"} tk",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.lineThrough,
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
        }));
  }

  _showModalBottomSheetContact(BuildContext, context) {
    showModalBottomSheet(
      backgroundColor: Color(0xffE5E5E5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Dropdownlocation(
          onpresed: (value) {
            setState(() {
              areaselect = value;
            });
          },
        );
      },
    );
  }
}
