import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLogoButton extends StatelessWidget {
  final VoidCallback?onTap;
   String image;
   String title;
   Color color;
   SocialLogoButton({
    Key? key,
    this.onTap,
    required this.image,
    required this.title,
    required this.color
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, 
      child: Row( 
        children: [
          Transform.translate(
            offset: Offset(-15, 0),
            child: Container(
              height: 50.h,
              width: 50.w,
              child: Image.asset("$image",scale: 4,),
              
            ),
          ),
          Text(
            title
          ),
        ],
      ),
        style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      ),
      primary: color
      ),
      );
  }
}
