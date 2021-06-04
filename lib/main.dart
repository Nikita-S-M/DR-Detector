import 'package:authentification/Login.dart';
import 'package:authentification/SignUp.dart';
import 'package:authentification/Start.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'About.dart';
import 'Camera.dart';
import 'ImageP.dart';
import 'Home.dart';
import 'Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   
  await Firebase.initializeApp();
   runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
    designSize: Size(360, 720),
    builder: () => MaterialApp(

      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      
      home: 
      
      HomePage(),
      
      
      routes: <String,WidgetBuilder>{

        "Login" : (BuildContext context)=>Login(),
        "SignUp":(BuildContext context)=>SignUp(),
        "Start":(BuildContext context)=>Start(),
        "Home":(BuildContext context)=>Home(),
        "Camera":(BuildContext context)=>Camera(),
        "ImageP":(BuildContext context)=>ImageP(),
        "About":(BuildContext context)=>About(),
        "Profile":(BuildContext context)=>Profile(),
        
        
      },
      
     ),
    );
  }

}



