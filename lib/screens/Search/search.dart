import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_master/screens/Search/searchhotel.dart';
import 'package:travel_app_master/screens/Search/selected_area.dart';
import 'package:travel_app_master/screens/restaurant%20_details/restaurant_page.dart';

import '../../utilites/route.dart';
import '../restaurant _details/hoteldetails.dart';
import 'datepicker.dart';
import 'dropdown.dart';

class SearchScreen extends StatefulWidget {
  final int selectedcategory;
  final String ?searchItem;

  const SearchScreen({Key? key, required this.selectedcategory,this.searchItem})
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
  TextEditingController _searchController = TextEditingController();

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
  void initState() {
    super.initState();
    _searchController = new TextEditingController(text: widget.searchItem.toString());
  }
  @override
  void dispose() {
    super.dispose();
  }

DateTime selectedDate = DateTime.now();
  TextEditingController date1 = TextEditingController();
  TextEditingController date2 = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101,9));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        date1.text = "${DateFormat.yMMMd().format(selectedDate)}";
      });
    }
  }
  DateTime selectedDate2 = DateTime.now();
  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101,9));
    if (picked != null && picked != selectedDate2) {
      setState(() {
        selectedDate2 = picked;


        date2.text = "${DateFormat.yMMMd().format(selectedDate2)}";

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
                                      child:    Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: Expanded(
                                          child: Container(
                                            width: 290.w,
                                            height: 48.h,
                                            child: TextFormField(
                                              controller: _searchController,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                contentPadding: EdgeInsets.all(10.r),
                                                filled: true,

                                                fillColor: Colors.white,
                                                prefixIcon: Icon(Icons.location_on_outlined),
                                                suffixIcon: InkWell(
                                                  onTap: (){


                                                  },
                                                  child: Icon(
                                                    Icons.arrow_forward,
                                                    color: Color(0xff08BA64),
                                                    size: 20,
                                                  ),
                                                ),
                                                labelStyle: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                hintText: "Where do you wanna go?",
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius: BorderRadius.circular(16),
                                                ),
                                                disabledBorder: InputBorder.none,
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius: BorderRadius.circular(16),
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

                                    Column(
                                      children: [
                                        Container(
                                          width: 254.w,
                                          height: 48.h,
                                          child: TextFormField(
                                            controller: date1,
                                            style: TextStyle(color: Colors.grey),
                                            readOnly: true,
                                            //  controller: _dobController,
                                            onTap: () {
                                              _selectDate(context);


                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              isDense: true,
                                              contentPadding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                              fillColor: Colors.white,
                                              hintText: "Start Date",
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              prefixIcon: IconButton(
                                                onPressed: () =>
                                                    //_selectDateFromPicker(context),
                                                _selectDate(context),
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
                                        SizedBox(height: 10,),
                                        Container(
                                          width: 254.w,
                                          height: 48.h,
                                          child: TextFormField(
                                             // initialValue:"",
                                            controller: date2,
                                            style: TextStyle(color: Colors.grey),
                                            readOnly: true,
                                            //  controller: _dobController,
                                            onTap: () {
                                              _selectDate2(context);


                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              isDense: true,
                                              contentPadding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                              fillColor: Colors.white,
                                              hintText: "End Date",
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              prefixIcon: IconButton(
                                                onPressed: () =>
                                                    //_selectDateFromPicker(context),
                                                _selectDate2(context),
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
                                      ],
                                    ),

                                    // Container(
                                    //   width: 254.w,
                                    //   height: 48.h,
                                    //   child: TextFormField(
                                    //     style: TextStyle(color: Colors.grey),
                                    //     readOnly: true,
                                    //     controller: _dobController,
                                    //     onTap: () {
                                    //       showDialog(
                                    //           context: context,
                                    //           builder: ((context) =>
                                    //               DatepickerPage()));
                                    //     },
                                    //     decoration: InputDecoration(
                                    //       filled: true,
                                    //       isDense: true,
                                    //       contentPadding: EdgeInsets.fromLTRB(
                                    //           10, 10, 10, 10),
                                    //       fillColor: Colors.white,
                                    //       hintText: "21 Nov - 1 Dec",
                                    //       hintStyle: TextStyle(
                                    //         color: Colors.grey,
                                    //       ),
                                    //       prefixIcon: IconButton(
                                    //         onPressed: () =>
                                    //             _selectDateFromPicker(context),
                                    //         icon: Icon(
                                    //             Icons.calendar_today_outlined,
                                    //             color: Colors.grey),
                                    //       ),
                                    //       border: OutlineInputBorder(
                                    //         borderSide: BorderSide.none,
                                    //         borderRadius:
                                    //             BorderRadius.circular(16),
                                    //       ),
                                    //       disabledBorder: InputBorder.none,
                                    //       focusedBorder: OutlineInputBorder(
                                    //         borderSide: BorderSide.none,
                                    //         borderRadius:
                                    //             BorderRadius.circular(16),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
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
                                categoryItem(),
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

  Widget categoryItem(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CustomRadioButton("Hotel/Resort", 1,"assets/hotel.png"),
          SizedBox(width: 10,),
          CustomRadioButton("Restaurant", 2,"assets/restaurant.png"),
          SizedBox(width: 10,),
          CustomRadioButton("Flight", 3,"assets/flight.png")


        ],
      ),
    );
  }


  // Widget category() {
  //   // final provider = Provider.of<Hotelprovider>(context);
  //   return Container(
  //     height: 40,
  //     child: ListView.separated(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: 5,
  //       itemBuilder: (BuildContext context, int index) {
  //         // var data = provider.category!.data![index];
  //         return InkWell(
  //           onTap: () {
  //             setState(() {
  //               searhchotel = index;
  //             });
  //           },
  //           child: Container(
  //             padding: EdgeInsets.symmetric(horizontal: 10.w),
  //             decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(10.r)),
  //             child: Row(
  //               children: [
  //                 Container(
  //                   height: 20.h,
  //                   width: 20.w,
  //                   decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(16.r)),
  //                   child: Image.network(
  //                       "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
  //                 ),
  //                 SizedBox(height: 5.h),
  //                 Text(
  //                   "categoryTitle!",
  //                   style: TextStyle(
  //                       color: Color(0xFf9C9C9C),
  //                       fontSize: 13.sp,
  //                       fontWeight: FontWeight.w400),
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //       separatorBuilder: (BuildContext context, int index) {
  //         return SizedBox(
  //           width: 20,
  //         );
  //       },
  //     ),
  //   );
  // }

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
              newpage(RestaurantScreen(), context);
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
       isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
    return  SingleChildScrollView(
    //  physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child:   Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15,),
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
                    builder: ((context) =>
                        SelectedAreaPage()));
              },
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff08BA64),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Use my location",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 25,
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),
          ],
        ),



        // child: Column(
        //   children: [
        //     Column(
        //       children: [
        //         SizedBox(height: 10.h),
        //         Text(
        //           "Select Area",
        //           style: TextStyle(
        //             fontSize: 20,
        //           ),
        //         ),
        //         Divider(),
        //       ],
        //     ),
        //     ListView.builder(
        //         shrinkWrap: true,
        //         physics: NeverScrollableScrollPhysics(),
        //         itemCount: 5,
        //         itemBuilder: ((context, index) {
        //           // var data = currentlocation.nearbylocation!.place[index];
        //           return InkWell(
        //             onTap: () {
        //               // widget.onpresed(data.area);
        //               // Navigator.pop(context);
        //             },
        //             child: Container(
        //               height: 150.h,
        //               margin: EdgeInsets.only(bottom: 10.h),
        //               width: double.infinity,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(10.r),
        //               ),
        //               child: Stack(
        //                 fit: StackFit.expand,
        //                 children: [
        //                   ClipRRect(
        //                     borderRadius: BorderRadius.circular(10.r),
        //                     child: Image.asset(
        //                       "assets/image003.jpeg",
        //                       fit: BoxFit.cover,
        //                     ),
        //                   ),
        //                   Container(
        //                     decoration: BoxDecoration(
        //                         color: Colors.black.withOpacity(0.3),
        //                         borderRadius:
        //                             BorderRadius.circular(10.r)),
        //                   ),
        //                   Container(
        //                     padding: EdgeInsets.all(10.r),
        //                     child: Column(
        //                       mainAxisAlignment: MainAxisAlignment.end,
        //                       crossAxisAlignment:
        //                           CrossAxisAlignment.start,
        //                       children: [
        //                         Text(
        //                           "data.name",
        //                           style: TextStyle(
        //                               fontSize: 22.sp,
        //                               color: Colors.white,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                         Text(
        //                           "data.address",
        //                           style: TextStyle(
        //                             fontSize: 18.sp,
        //                             color: Colors.white,
        //                           ),
        //                         ),
        //                         Row(
        //                           children: [
        //                             Text(
        //                               "data.city",
        //                               style: TextStyle(
        //                                 fontSize: 18.sp,
        //                                 color: Colors.white,
        //                               ),
        //                             ),
        //                             Text(
        //                               ",",
        //                               style: TextStyle(
        //                                 fontSize: 18.sp,
        //                                 color: Colors.white,
        //                               ),
        //                             ),
        //                             Text(
        //                               "data.area",
        //                               style: TextStyle(
        //                                 fontSize: 18.sp,
        //                                 color: Colors.white,
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           );
        //         }))
        //     // Image.asset("assets/map.png"),
        //     // Container(
        //     //   width: double.infinity,
        //     //   height: 56,
        //     //   decoration:
        //     //       BoxDecoration(borderRadius: BorderRadius.circular(20)),
        //     //   child: ElevatedButton(
        //     //     onPressed: () {
        //     //       // Navigator.push(context, MaterialPageRoute(builder: (_)=>SocialLogoScreen()));
        //     //     },
        //     //     child: Row(
        //     //       mainAxisAlignment: MainAxisAlignment.center,
        //     //       children: [
        //     //         Text(
        //     //           "Use my Location",
        //     //           style: TextStyle(fontSize: 18),
        //     //         ),
        //     //         SizedBox(
        //     //           width: 10,
        //     //         ),
        //     //         Icon(Icons.arrow_forward)
        //     //       ],
        //     //     ),
        //     //     style: ElevatedButton.styleFrom(
        //     //         shape: RoundedRectangleBorder(
        //     //           borderRadius: BorderRadius.circular(16),
        //     //         ),
        //     //         primary: Color(0xff08BA64)),
        //     //   ),
        //     // ),
        //   ],
        // ),
      ),
    );
    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Container(
    //       height: 40,
    //       margin: EdgeInsets.all(5),
    //       child: Center(
    //           child: Text(
    //             "Select Area",
    //             style: TextStyle(
    //                 fontSize: 25,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.black),
    //           )),
    //     ),
    //     Container(
    //       width: 350,
    //       height: 580,
    //       child: Stack(
    //         alignment: AlignmentDirectional.centerStart,
    //         children: [
    //           Container(
    //               width: double.infinity,
    //               height: double.infinity,
    //               child: Image.asset("assets/images/map.png",
    //                   fit: BoxFit.contain)),
    //           TextPosition(
    //               placesNumber: 12, txt: "places", top: 60, left: 85),
    //           TextPosition(
    //               placesNumber: 8, txt: "places", top: 160, left: 51),
    //           TextPosition(
    //               placesNumber: 34, txt: "places", top: 230, left: 150),
    //           TextPosition(
    //               placesNumber: 30,
    //               txt: "places",
    //               bottom: 220,
    //               left: 130),
    //           TextPosition(
    //               placesNumber: 64,
    //               txt: "places",
    //               bottom: 200,
    //               right: 40),
    //           TextPosition(
    //               placesNumber: 64, txt: "places", top: 188, right: 88),
    //         ],
    //       ),
    //     ),
    //     InkWell(
    //       onTap: (){
    //         //  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SelectAreaPage(),),);
    //
    //       },
    //       child: Container(
    //         height: 50,
    //         width: 250,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           color: Colors.blue,
    //           boxShadow: [
    //             BoxShadow(
    //               color: Color.fromARGB(255, 203, 203, 203),
    //               blurRadius: 2,
    //               spreadRadius: 1,
    //             ),
    //           ],
    //         ),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(
    //               "Use my location",
    //               style: TextStyle(
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.white),
    //             ),
    //             SizedBox(width: 5),
    //             Icon(
    //               Icons.arrow_forward_rounded,
    //               color: Colors.white,
    //               size: 25,
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //     SizedBox(height: 10,),
    //   ],
    // );
    },
    );

    }

  Widget CustomRadioButton(String text, int index,String img) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          color: Colors.white,
           border: Border.all(
          color: (value == index) ? Colors.green : Colors.transparent
              ),
          borderRadius: BorderRadius.circular(10.r)),
         child: InkWell(
         onTap: () {
                setState(() {
            value = index;
                       });},
        child: Row(
          children: [
            Container(
              height: 20.h,
              width: 20.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r)),
              child: Image.asset(
                  img),
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
          style: TextStyle(
              color:  Color(0xff08BA64), fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Text(
          txt!,
          style: TextStyle(
              color:  Color(0xff08BA64), fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ],
    ),
  );
}

