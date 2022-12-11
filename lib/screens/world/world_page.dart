import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorldPage extends StatefulWidget {
  const WorldPage({Key? key}) : super(key: key);

  @override
  State<WorldPage> createState() => _WorldPageState();
}

class _WorldPageState extends State<WorldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Around the World",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),

      body:   ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Container(
                  height: 226.h,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                            // "https://s3-alpha-sig.figma.com/img/a240/b900/13cd146be9d499fd002d2eb37f80f830?Expires=1663545600&Signature=F8BCx92CUQaxz7XHG2CT2-K4FiFdMOCGMo1aK2ceOxN5kWyj6KGfkroNyZm8UuVbmTNm5-ibG4IxpeyZZqTfDMJ8RSNAqAMq2fHy5eYs7DJd4cRJhJp7AWmM8QdQMGmG4n0jzVg-JNz47blSZbvzz9Vgh0FjbbbUqgDdzYo8OCpO246jx~GhtQGPZrXIkdPTmyU1yAB6VgeM9laKlFrfLSu9KouD4qEFuRcGHYmzMOFo8xNWm0kAHTeK~O9DDHLGzVlvs1c9JDvaD00fBShZ3nLVvasKi3s1~-CEbr6Pn5y-vdN~D2LI6bZotBwDmOXC0A4Km~u7DqpBZMpjuQGs~w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                          ))),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10.r),
                          )),
                      Container(
                        padding: EdgeInsets.all(10.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Longest Sea Beach",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Text(
                              "It was a very good journey, we visited a lot of places there. The travel became so affordable, the interest thing is...",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          })),
    );
  }
}
