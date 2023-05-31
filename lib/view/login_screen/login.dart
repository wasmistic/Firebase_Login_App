import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/view/common_widget/custom_btn.dart';
import 'package:flutter_application_1/view/common_widget/custom_textfield.dart';
import 'package:flutter_application_1/view/signup_screen/signup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Expanded(
          child:Column(
            children: [
              _buildTopContainer(),
              _buildWelcomeText(),
              SizedBox(height: 40.h,),
              CustomTextField(icon: Icons.person,text: 'Enter email or username',textController:email),
              SizedBox(height: 20.h,),
              CustomTextField(icon: Icons.password_sharp,text: 'Enter password',pwd: true,textController:password),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 25.w,vertical:15.h),
                child: Align(
                alignment: Alignment.centerRight,
                child:Text(
                  'Forgotten password',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16.sp,
                  ),
                ),
              ),
                ),
              SizedBox(height: 15.h,),
              GestureDetector(
                onTap: ()=>AuthController.instance.Login(email.text.trim(), password.text.trim()),
                child:CustomBtn(text: 'Sign In',),
              ),
               SizedBox(height: 30.h,),
              _buildSigUp()

            ])),
      )
    );   
  }

  Widget _buildTopContainer(){
      return Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height*0.4,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/img/loginimg.png')
            )
        ),
      );
    }

  Widget _buildWelcomeText(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      child: RichText(
        text: TextSpan(
          text: 'Hello',
          style: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text:'\n Sign in with your account',
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

 Widget _buildSigUp(){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 25.w),
    alignment: Alignment.centerRight,
    decoration: BoxDecoration(),
    child: RichText(
      text: TextSpan(
        text: 'Don\'t have an account ',
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.grey[500],
        ),
        children: [
          TextSpan(
          text: 'Create',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
           recognizer: TapGestureRecognizer()..onTap=(){
            Get.to(()=>SignUpScreen(), transition: Transition.zoom, duration: Duration(seconds: 1));
           }
        )
        ]
      )),
  );
 }
}