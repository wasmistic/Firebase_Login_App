import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool pwd;
  final TextEditingController textController;

   CustomTextField({super.key,required this.textController, required this.text, required this.icon, this.pwd=false});

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.symmetric(horizontal: 25.w),
       height: 45.h,
       decoration: BoxDecoration(
        color: Colors.white,
         borderRadius: BorderRadius.circular(30.r),
         boxShadow:[
          BoxShadow(
            blurRadius: 17.sp,
            spreadRadius:3.sp,
            color: Colors.grey.withOpacity(0.6),
            offset: Offset(1, 1)
          )
         ]
       ),
       child: TextField(
        autofocus: false,
        controller: textController,
        keyboardType: pwd==true ? TextInputType.numberWithOptions(
          decimal: true,
          signed: true
        ) : TextInputType.emailAddress,
        obscureText: pwd,
        decoration:InputDecoration(
          prefixIcon:Icon(icon),
          prefixIconColor: Colors.grey[500],
          hintText:text,
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 16.sp,
          ),
          contentPadding: EdgeInsets.only(top:20.sp),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none
          ),
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none
          ),
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none
           
          )
        ),
       ),
    );
  }
}