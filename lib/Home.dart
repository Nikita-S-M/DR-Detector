import 'package:authentification/About.dart';
import 'package:authentification/Camera.dart';
import 'package:authentification/Home1.dart';
import 'package:authentification/ImageP.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'About.dart';
import 'Camera.dart';
import 'ImageP.dart';
import 'Profile.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

Color color = Colors.blue;
String disp ='';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> 
{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final List<Widget> _pages = 
  [
    Home1(),
    Camera(),
    ImageP(),
    About(),
    Profile(),
  ];

  int _selectedIndex = 0;
  

  _onTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }

  
  navigateToCamera() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Camera()));
  }

  navigateToImageP() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ImageP()));
  }

  navigateToAbout() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text("DR Detector"),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[..._pages],

      ),

      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        animationDuration: Duration(microseconds: 400),
        
        index: _selectedIndex,
        backgroundColor: Colors.white,
        color: Colors.blue.shade100,
        
        onTap: _onTapped,
        items: [
          Icon(Icons.home),
          Icon(Icons.photo_camera ),
          Icon(Icons.photo_filter),
          Icon(Icons.info),
          Icon(Icons.person),
        ],

      ),
      
    );
  }
 }


  
 

 
  






