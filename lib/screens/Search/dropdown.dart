import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Dropdownlocation extends StatefulWidget {
  final Function onpresed;
  const Dropdownlocation({Key? key, required this.onpresed}) : super(key: key);

  @override
  State<Dropdownlocation> createState() => _DropdownlocationState();
}

class _DropdownlocationState extends State<Dropdownlocation> {
  bool loading = true;

  // Future loaddata() async {
  //   final _locationprovider =
  //       Provider.of<Locationprovider>(context, listen: false);
  //   await _locationprovider.locationenablecheck();
  //   await _locationprovider.getcurrectlocation();
  //   setState(() {
  //     loading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   loaddata();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final currentlocation = Provider.of<Locationprovider>(context);
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 10.h),
                      Text(
                        "Select Area",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: ((context, index) {
                        // var data = currentlocation.nearbylocation!.place[index];
                        return InkWell(
                          onTap: () {
                            // widget.onpresed(data.area);
                            // Navigator.pop(context);
                          },
                          child: Container(
                            height: 150.h,
                            margin: EdgeInsets.only(bottom: 10.h),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.asset(
                                    "assets/image003.jpeg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.r),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "data.name",
                                        style: TextStyle(
                                            fontSize: 22.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "data.address",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "data.city",
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            ",",
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "data.area",
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }))
                  // Image.asset("assets/map.png"),
                  // Container(
                  //   width: double.infinity,
                  //   height: 56,
                  //   decoration:
                  //       BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       // Navigator.push(context, MaterialPageRoute(builder: (_)=>SocialLogoScreen()));
                  //     },
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Text(
                  //           "Use my Location",
                  //           style: TextStyle(fontSize: 18),
                  //         ),
                  //         SizedBox(
                  //           width: 10,
                  //         ),
                  //         Icon(Icons.arrow_forward)
                  //       ],
                  //     ),
                  //     style: ElevatedButton.styleFrom(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(16),
                  //         ),
                  //         primary: Color(0xff08BA64)),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
  }
}
