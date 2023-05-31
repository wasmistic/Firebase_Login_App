
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/view/common_widget/custom_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  final String email;
   const ProfileScreen({super.key, this.email='abc@yahoo.com'});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Flexible(
          child:Column(
            children: [
              _buildTopContainer(),
               SizedBox(height: 30,),
              _buildWelcomeText(),
              SizedBox(height: 200,),
             GestureDetector(
                onTap: (){
                  AuthController.instance.LogOut();
                },
                child:CustomBtn(text: 'Log Out',),
              ),
               SizedBox(height: 30,),

            ])
          ),
      )
    );
  }

   Widget _buildTopContainer(){
      return Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height*0.4,
        decoration: BoxDecoration(
        ),
        child:Stack(
          alignment: Alignment.center,
            children: [
              Positioned(
              child:Container(
                 width:MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height*0.4,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Colors.black54
                  // ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/signup.png')
                    )
                ),
              )),
              Positioned(
                bottom: 20.h,
                child:  Container(
                  width:100.w,
                  height:100.h,
                  child: CircleAvatar(
                backgroundColor:Colors.white,
                backgroundImage: AssetImage('assets/img/profile1.png'),
              ),
                ))
            ],
          ),
      );
    }

  Widget _buildWelcomeText(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      child: RichText(
        text: TextSpan(
          text: 'Welcome',
          style: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text:'\n'+ widget.email,
               style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color:Colors.grey[500],
              ),
            )
          ]
        )
        ),
    );
  }


}