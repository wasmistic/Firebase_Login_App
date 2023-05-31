import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/login_screen/login.dart';
import 'package:flutter_application_1/view/profile/profile_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthController extends GetxController{

  static AuthController instance = Get.find();

  GoogleSignIn googleSign = GoogleSignIn();
  late Rx<GoogleSignInAccount?> googleSignInAccount;

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();

    _user = Rx<User?> (auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _setInitialScreen);

     googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }


  void _setInitialScreen(User? user){
      if(user==null){
        Get.offAll(()=>LoginScreen(), transition: Transition.zoom, duration: Duration(seconds: 1));
      }else{
        Get.to(()=>ProfileScreen(email: user.email.toString(),), transition: Transition.zoom, duration: Duration(seconds: 1));
      }
  }

  void Register(String email, password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
        Get.snackbar('User Error', 'User Error Message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        titleText:Text(
          'Sign Up Error',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),
        ),
        messageText: Text(
          '$e',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
          ),
        ),
        );
    }
  }

  void Login(String email, password) async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
         Get.snackbar('User Error', 'User Error Message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        titleText:Text(
          'Sign Up Error',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),
        ),
        messageText: Text(
          '$e',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
          ),
        ),
        );
    }
  }


  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
       Get.offAll(()=>LoginScreen(), transition: Transition.zoom, duration: Duration(seconds: 1));
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
     Get.to(()=>ProfileScreen(email: googleSignInAccount.email.toString(),), transition: Transition.zoom, duration: Duration(seconds: 1));
    }
  }


  void SignInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth
            .signInWithCredential(credential);
            // .catchError((onErr) => print('Google Sign In Error'+onErr));
      }
    } catch (e) {
      Get.snackbar('User Error', 'User Error Message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        titleText:Text(
          'Sign In Error',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),
        ),
        messageText: Text(
          '$e',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
          ),
        ),
        );
      print('Error not able to sign in with Google'+e.toString());
    }
  }

  void LogOut(){
    googleSign.signOut();
    auth.signOut();
    Get.offAll(()=>LoginScreen(), transition: Transition.zoom, duration: Duration(seconds: 1));
  }

}