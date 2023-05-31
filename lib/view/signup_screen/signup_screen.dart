import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/view/common_widget/custom_btn.dart';
import 'package:flutter_application_1/view/common_widget/custom_textfield.dart';
import 'package:flutter_application_1/view/login_screen/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  List<String> Image =['f.png','g.png','t.png'];

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:  Expanded(
          child:Column(
            children: [
              _buildTopContainer(),
               SizedBox(height: 30.h,),
              CustomTextField(icon: Icons.person,text: 'Enter username',textController: username,),
              SizedBox(height: 20.h,),
               CustomTextField(icon: Icons.mail_lock_sharp,text: 'Enter email',textController: email,),
               SizedBox(height: 20.h,),
              CustomTextField(icon: Icons.password_sharp,text: 'Enter password',pwd: true,textController: password,),
              SizedBox(height: 45.h,),
              GestureDetector(
                onTap: (){
                  AuthController.instance.Register(email.text.trim(), password.text.trim());
                },
                child: CustomBtn(text: 'Sign Up',),
              ),
               SizedBox(height: 20.h,),
              _buildSigUp(),
              SizedBox(height: 20.h,),
               GestureDetector(
                onTap: (){
                  AuthController.instance.SignInWithGoogle();
                },
                child:_buildSocialMedia(),
               )
              

            ])),
      )
    );
  }

   Widget _buildTopContainer(){
      return Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height*0.4,
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

 Widget _buildSigUp(){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 25.w),
    alignment: Alignment.center,
    decoration: BoxDecoration(),
    child: RichText(
      text: TextSpan(
        text: 'Already have an account ',
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.grey[500],
        ),
        children: [
          TextSpan(
          text: 'Sign In',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
           recognizer: TapGestureRecognizer()..onTap=(){
            Get.to(()=>LoginScreen(), transition: Transition.zoom, duration: Duration(seconds: 1));
           }
        )
        ]
      )),
  );
 }

Widget _buildSocialMedia(){
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(horizontal: 25.w),
    child: Wrap(
      children: List.generate(3, (index) => 
      Container(
        width:45.h,
        height:45.h,
        margin: EdgeInsets.all(3.sp),
        padding: EdgeInsets.all(2.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(
            color: Colors.grey,
            width: 3.sp,
          ),
        ),
        child: Container(
          width:35.h,
          height:35.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/img/'+Image[index]))
          ),
        ),
      )
      ),
    ),
  );
}

}