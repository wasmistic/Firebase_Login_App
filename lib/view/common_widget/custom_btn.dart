import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  CustomBtn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.5,
      height: MediaQuery.of(context).size.height*0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
          fit: BoxFit.cover,
          image:AssetImage('assets/img/loginbtn.png') )
      ),
      child: Center(child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 21.sp,
        ),
      )),
    );
  }
}