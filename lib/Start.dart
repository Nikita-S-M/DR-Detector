import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential user =
            await _auth.signInWithCredential(credential);

        await Navigator.pushReplacementNamed(context, "/");

        return user;
      } else {
        throw StateError('Missing Google Auth Token');
      }
    } else
      throw StateError('Sign in Aborted');
  }

  navigateToLogin() async {
    Navigator.pushReplacementNamed(context, "Login");
  }

  navigateToRegister() async {
    Navigator.pushReplacementNamed(context, "SignUp");
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            children: <Widget>[
              SizedBox(height: 35.0.h),
              Container(
                height: 300.h,
                child: Image(
                  image: AssetImage("images/start.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20.0.h),
              RichText(
                  text: TextSpan(
                      text: 'Welcome to ',
                      style: TextStyle(
                          fontSize: 25.0.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: <TextSpan>
                      [
                        TextSpan
                        (
                          text: 'DR Detector',
                          style: TextStyle(
                            fontSize: 30.0.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo
                  ))])),
              SizedBox(height: 10.0.h),
              RichText(
                text: TextSpan(
                  text: 'Diagnosis at your fingertips',
                  style: TextStyle(color: Colors.black,fontSize: 25.0.sp)
                )
              ),
              SizedBox(height: 30.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      //padding: EdgeInsets.only(left: 30, right: 30),
                      onPressed: navigateToLogin,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                      ),
                      //shape: RoundedRectangleBorder(
                        //borderRadius: BorderRadius.circular(10.0),
                      ),
                      //color: Colors.indigo),
                  SizedBox(width: 20.0.w),
                  ElevatedButton(
                      //padding: EdgeInsets.only(left: 30, right: 30),
                      onPressed: navigateToRegister,
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                      ),
                      //shape: RoundedRectangleBorder(
                        //borderRadius: BorderRadius.circular(10.0),
                      ),
                      
                      //color: Colors.indigo),
                ],
              ),
              SizedBox(height: 20.0.h),
              SignInButton(Buttons.Google,
                  text: "Sign up with Google", onPressed: googleSignIn)
            ],
          ),
        ),
      );
  }
}
